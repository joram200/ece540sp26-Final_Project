`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Portland State University
// Engineer: Jose Ramirez
//
// Module Name: axi_lite_64to32
// Description:
//   AXI4-Lite data-width adapter: 64-bit master bus -> 32-bit peripheral.
//
//   Only write-data, write-strobe, and read-data require lane conversion;
//   all address and flow-control signals pass through the parent unchanged.
//
//   Write path: AW and W are independent AXI4 channels.  addr[2] is latched
//   when the AW handshake fires so it is available when the W beat arrives
//   (which may be a cycle later on a compliant master).
//
//   Read path: addr[2] is registered at the AR handshake; the 32-bit read
//   datum is placed in the matching 64-bit lane when R returns.  One
//   outstanding read is assumed (AXI4-Lite).
//
//////////////////////////////////////////////////////////////////////////////////

module axi_lite_64to32 (
    input  wire        aclk,
    input  wire        aresetn,

    // ---- Write address channel observation (addr bit + handshake) ----------
    input  wire        s_awaddr2,    // s_axi_awaddr[2] from upstream master
    input  wire        s_awvalid,    // s_axi_awvalid
    input  wire        m_awready,    // s_axi_awready driven by MAC (passed through)

    // ---- Write data channel observation (for aw2 latch management) ---------
    input  wire        s_wvalid,     // s_axi_wvalid
    input  wire        m_wready,     // s_axi_wready driven by MAC (passed through)

    // ---- 64-bit -> 32-bit write data / strobe conversion -------------------
    input  wire [63:0] s_wdata,      // full 64-bit write data from master bus
    input  wire  [7:0] s_wstrb,      // 8-bit byte enables from master bus
    output wire [31:0] m_wdata,      // 32-bit write data to MAC
    output wire  [3:0] m_wstrb,      // 4-bit byte enables to MAC

    // ---- Read address channel observation ----------------------------------
    input  wire        s_araddr2,    // s_axi_araddr[2]
    input  wire        s_arvalid,    // s_axi_arvalid
    input  wire        m_arready,    // s_axi_arready driven by MAC (passed through)

    // ---- 32-bit -> 64-bit read data conversion -----------------------------
    input  wire [31:0] m_rdata,      // 32-bit read data from MAC
    output wire [63:0] s_rdata       // 64-bit read data back to master bus
);

    // -----------------------------------------------------------------------
    // Write path: latch aw_addr[2] so it is available when W arrives.
    //
    // aw2_vld is set when AW fires without a simultaneous W completion and
    // cleared when the following W handshake completes on the MAC side.
    // When AW and W arrive and complete in the same cycle aw2_vld stays 0.
    // -----------------------------------------------------------------------

    reg  aw2_q;     // latched copy of s_awaddr2
    reg  aw2_vld;   // aw2_q holds a valid address (AW accepted; W not yet done)

    // Handshakes observed from parent module signals.
    // AW passes through unchanged so s_awready == m_awready.
    // W  passes through unchanged so s_wready  == m_wready.
    wire aw_hs = s_awvalid & m_awready;
    wire w_hs  = s_wvalid  & m_wready;

    always_ff @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            aw2_vld <= 1'b0;
            aw2_q   <= 1'b0;
        end else begin
            if (aw_hs) begin
                aw2_q   <= s_awaddr2;
                // If W fires the same cycle as AW the address is consumed
                // immediately; no need to hold it.
                aw2_vld <= ~w_hs;
            end else if (aw2_vld & w_hs) begin
                aw2_vld <= 1'b0;
            end
        end
    end

    // Use the latched value when AW has already been accepted; otherwise use
    // the live AW channel value (valid whenever s_awvalid is high, which
    // covers simultaneous AW+W presentation from the CPU).
    wire cur_aw2 = aw2_vld ? aw2_q : s_awaddr2;

    assign m_wdata = cur_aw2 ? s_wdata[63:32] : s_wdata[31:0];
    assign m_wstrb = cur_aw2 ? s_wstrb[7:4]   : s_wstrb[3:0];

    // -----------------------------------------------------------------------
    // Read path: register ar_addr[2] at AR handshake; steer the 32-bit MAC
    // response into the 64-bit lane the master will sample.
    // -----------------------------------------------------------------------

    wire ar_hs = s_arvalid & m_arready;

    reg ar2_q;
    always_ff @(posedge aclk or negedge aresetn) begin
        if (!aresetn) ar2_q <= 1'b0;
        else if (ar_hs) ar2_q <= s_araddr2;
    end

    // Place MAC data in the half the CPU will sample; zero the unused half.
    assign s_rdata = ar2_q ? {m_rdata, 32'h0} : {32'h0, m_rdata};

endmodule
