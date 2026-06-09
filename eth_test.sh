#!/usr/bin/env bash
#
# eth_test.sh - Blast broadcast Ethernet frames at a directly-connected FPGA
# board so its MAC receive path (eth_test.c) toggles LED0. Purely a link/RX
# bring-up test: the board has no IP stack, it only counts received frames.
#
# usage: sudo ./eth_test.sh <interface> [interval_seconds]
# Linux only (uses ip / ping -b / /sys/class/net).
#
set -euo pipefail

HOST_IP="169.254.1.1"
BCAST="169.254.1.255"
INTERVAL="${2:-0.1}"

if [ $# -lt 1 ]; then
    echo "usage: sudo $0 <interface> [interval_seconds]" >&2
    echo "wired interfaces:" >&2
    for path in /sys/class/net/*; do
        name=$(basename "$path")
        [ "$name" = "lo" ] && continue
        [ -d "$path/wireless" ] && continue
        [ "$(cat "$path/type" 2>/dev/null)" = "1" ] && echo "  $name" >&2
    done
    exit 1
fi

IFACE="$1"

if [ ! -e "/sys/class/net/$IFACE" ]; then
    echo "no such interface: $IFACE" >&2
    exit 1
fi

if [ "$(id -u)" -ne 0 ]; then
    echo "must run as root: sudo $0 $*" >&2
    exit 1
fi

ip addr add "${HOST_IP}/24" dev "$IFACE" 2>/dev/null || true
ip link set "$IFACE" up

echo "Sending broadcast frames out $IFACE every ${INTERVAL}s (Ctrl-C to stop)."
echo "Watch LED0 on the board."

trap 'echo; exit 0' INT
if ! ping -b -i "$INTERVAL" -I "$IFACE" "$BCAST"; then
    if command -v arping >/dev/null; then
        echo "broadcast ping failed; falling back to arping." >&2
        arping -b -I "$IFACE" "$HOST_IP"
    fi
fi
