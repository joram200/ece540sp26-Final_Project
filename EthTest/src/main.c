#define ETH      0x80040000u
#define ETH_IS   (*(volatile unsigned int *)(ETH + 0x0Cu))
#define ETH_RCW1 (*(volatile unsigned int *)(ETH + 0x404u))
#define LED_OUT  (*(volatile unsigned int *)0x80001404u)
#define LED_OE   (*(volatile unsigned int *)0x80001408u)
#define RX_FLAGS 0x0Cu

int main(void)
{
    LED_OE = 0xFFFFu;
    LED_OUT = 0u;
    ETH_RCW1 = (1u << 28);
    ETH_IS = RX_FLAGS;

    unsigned int frames  = 0u;
    unsigned int rx_prev = 0u;
    unsigned int rx_held = 0u;

    for (;;)
    {
        unsigned int status = ETH_IS;
        unsigned int rx = status & RX_FLAGS;

        if (rx && !rx_prev)
        {
            rx_held = (status >> 2) & 0x3u;
            frames = (frames + 1u) & 0xFu;
        }
        if (rx)
            ETH_IS = rx;
        rx_prev = rx;

        LED_OUT = (frames << 4) | rx_held;
    }
}
