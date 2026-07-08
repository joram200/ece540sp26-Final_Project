// ddr_mux_wrapper.sv
// Wraps the PULP axi_mux (4 slaves → 1 master) with the same flat/packed-vector
// port interface used by axi_crossbar_0, so rvfpganexys.sv changes are minimal.
//
// Key difference from axi_crossbar_0:
//   axi_mux PREPENDS a 2-bit slave-port-index to AWID/ARID before sending to
//   litedram, giving an 8-bit master ID.  On B/R response the top 2 bits of
//   BID/RID identify which slave port receives the response and are stripped
//   before the 6-bit ID is returned to the slave.  This correctly handles the
//   6-bit VeeRwolf AXI IDs (which carry PULP-internal routing bits in [5:4])
//   that the Xilinx axi_crossbar_0 misrouted.
//
// SlvAxiIDWidth = 6  (matches mem.aw_id width from VeeRwolf)
// NoSlvPorts    = 4  (CPU, SG-DMA, MM2S-DMA-stub, S2MM-DMA)
// MstAxiIDWidth = 8  (6 + clog2(4) = 6 + 2)
// DataWidth     = 64, AddrWidth = 32

`default_nettype none
module ddr_mux_wrapper (
    input  wire        aclk,
    input  wire        aresetn,

    // ---- Slave ports (4 × packed vectors, 6-bit IDs, 64-bit data, 32-bit addr) ----
    input  wire [23:0]  s_axi_awid,     // [6*i+5 : 6*i] per port
    input  wire [127:0] s_axi_awaddr,   // [32*i+31: 32*i]
    input  wire [31:0]  s_axi_awlen,    // [8*i+7 : 8*i]
    input  wire [11:0]  s_axi_awsize,   // [3*i+2 : 3*i]
    input  wire [7:0]   s_axi_awburst,  // [2*i+1 : 2*i]
    input  wire [3:0]   s_axi_awlock,   // [i]
    input  wire [15:0]  s_axi_awcache,  // [4*i+3 : 4*i]
    input  wire [11:0]  s_axi_awprot,   // [3*i+2 : 3*i]
    input  wire [15:0]  s_axi_awqos,    // [4*i+3 : 4*i]
    input  wire [3:0]   s_axi_awvalid,
    output wire [3:0]   s_axi_awready,
    input  wire [255:0] s_axi_wdata,    // [64*i+63: 64*i]
    input  wire [31:0]  s_axi_wstrb,    // [8*i+7 : 8*i]
    input  wire [3:0]   s_axi_wlast,
    input  wire [3:0]   s_axi_wvalid,
    output wire [3:0]   s_axi_wready,
    output wire [23:0]  s_axi_bid,      // [6*i+5 : 6*i]
    output wire [7:0]   s_axi_bresp,    // [2*i+1 : 2*i]
    output wire [3:0]   s_axi_bvalid,
    input  wire [3:0]   s_axi_bready,
    input  wire [23:0]  s_axi_arid,
    input  wire [127:0] s_axi_araddr,
    input  wire [31:0]  s_axi_arlen,
    input  wire [11:0]  s_axi_arsize,
    input  wire [7:0]   s_axi_arburst,
    input  wire [3:0]   s_axi_arlock,
    input  wire [15:0]  s_axi_arcache,
    input  wire [11:0]  s_axi_arprot,
    input  wire [15:0]  s_axi_arqos,
    input  wire [3:0]   s_axi_arvalid,
    output wire [3:0]   s_axi_arready,
    output wire [23:0]  s_axi_rid,
    output wire [255:0] s_axi_rdata,
    output wire [7:0]   s_axi_rresp,
    output wire [3:0]   s_axi_rlast,
    output wire [3:0]   s_axi_rvalid,
    input  wire [3:0]   s_axi_rready,

    // ---- Master port (single, 8-bit IDs, 64-bit data, 32-bit addr) ----
    output wire [7:0]   m_axi_awid,
    output wire [31:0]  m_axi_awaddr,
    output wire [7:0]   m_axi_awlen,
    output wire [2:0]   m_axi_awsize,
    output wire [1:0]   m_axi_awburst,
    output wire         m_axi_awlock,
    output wire [3:0]   m_axi_awcache,
    output wire [2:0]   m_axi_awprot,
    output wire [3:0]   m_axi_awqos,
    output wire         m_axi_awvalid,
    input  wire         m_axi_awready,
    output wire [63:0]  m_axi_wdata,
    output wire [7:0]   m_axi_wstrb,
    output wire         m_axi_wlast,
    output wire         m_axi_wvalid,
    input  wire         m_axi_wready,
    input  wire [7:0]   m_axi_bid,
    input  wire [1:0]   m_axi_bresp,
    input  wire         m_axi_bvalid,
    output wire         m_axi_bready,
    output wire [7:0]   m_axi_arid,
    output wire [31:0]  m_axi_araddr,
    output wire [7:0]   m_axi_arlen,
    output wire [2:0]   m_axi_arsize,
    output wire [1:0]   m_axi_arburst,
    output wire         m_axi_arlock,
    output wire [3:0]   m_axi_arcache,
    output wire [2:0]   m_axi_arprot,
    output wire [3:0]   m_axi_arqos,
    output wire         m_axi_arvalid,
    input  wire         m_axi_arready,
    input  wire [7:0]   m_axi_rid,
    input  wire [63:0]  m_axi_rdata,
    input  wire [1:0]   m_axi_rresp,
    input  wire         m_axi_rlast,
    input  wire         m_axi_rvalid,
    output wire         m_axi_rready
);

  // ---- Struct definitions (matching axi/typedef.svh macros) ------------------
  // Slave side: 6-bit IDs
  typedef logic [5:0]  slv_id_t;
  // Master side: 8-bit IDs (6 + clog2(4) = 8)
  typedef logic [7:0]  mst_id_t;
  typedef logic [31:0] addr_t;
  typedef logic [63:0] data_t;
  typedef logic [7:0]  strb_t;
  typedef logic [0:0]  user_t;

  // AW channel structs
  typedef struct packed {
    slv_id_t           id;
    addr_t             addr;
    axi_pkg::len_t     len;
    axi_pkg::size_t    size;
    axi_pkg::burst_t   burst;
    logic              lock;
    axi_pkg::cache_t   cache;
    axi_pkg::prot_t    prot;
    axi_pkg::qos_t     qos;
    axi_pkg::region_t  region;
    axi_pkg::atop_t    atop;
    user_t             user;
  } slv_aw_t;

  typedef struct packed {
    mst_id_t           id;
    addr_t             addr;
    axi_pkg::len_t     len;
    axi_pkg::size_t    size;
    axi_pkg::burst_t   burst;
    logic              lock;
    axi_pkg::cache_t   cache;
    axi_pkg::prot_t    prot;
    axi_pkg::qos_t     qos;
    axi_pkg::region_t  region;
    axi_pkg::atop_t    atop;
    user_t             user;
  } mst_aw_t;

  // W channel (same for slave and master, ID-less)
  typedef struct packed {
    data_t   data;
    strb_t   strb;
    logic    last;
    user_t   user;
  } w_t;

  // B channel structs
  typedef struct packed {
    slv_id_t           id;
    axi_pkg::resp_t    resp;
    user_t             user;
  } slv_b_t;

  typedef struct packed {
    mst_id_t           id;
    axi_pkg::resp_t    resp;
    user_t             user;
  } mst_b_t;

  // AR channel structs
  typedef struct packed {
    slv_id_t           id;
    addr_t             addr;
    axi_pkg::len_t     len;
    axi_pkg::size_t    size;
    axi_pkg::burst_t   burst;
    logic              lock;
    axi_pkg::cache_t   cache;
    axi_pkg::prot_t    prot;
    axi_pkg::qos_t     qos;
    axi_pkg::region_t  region;
    user_t             user;
  } slv_ar_t;

  typedef struct packed {
    mst_id_t           id;
    addr_t             addr;
    axi_pkg::len_t     len;
    axi_pkg::size_t    size;
    axi_pkg::burst_t   burst;
    logic              lock;
    axi_pkg::cache_t   cache;
    axi_pkg::prot_t    prot;
    axi_pkg::qos_t     qos;
    axi_pkg::region_t  region;
    user_t             user;
  } mst_ar_t;

  // R channel structs
  typedef struct packed {
    slv_id_t           id;
    data_t             data;
    axi_pkg::resp_t    resp;
    logic              last;
    user_t             user;
  } slv_r_t;

  typedef struct packed {
    mst_id_t           id;
    data_t             data;
    axi_pkg::resp_t    resp;
    logic              last;
    user_t             user;
  } mst_r_t;

  // Request/Response structs (matching `AXI_TYPEDEF_REQ_T / RESP_T macros)
  typedef struct packed {
    slv_aw_t  aw;
    logic     aw_valid;
    w_t       w;
    logic     w_valid;
    logic     b_ready;
    slv_ar_t  ar;
    logic     ar_valid;
    logic     r_ready;
  } slv_req_t;

  typedef struct packed {
    logic     aw_ready;
    logic     ar_ready;
    logic     w_ready;
    logic     b_valid;
    slv_b_t   b;
    logic     r_valid;
    slv_r_t   r;
  } slv_resp_t;

  typedef struct packed {
    mst_aw_t  aw;
    logic     aw_valid;
    w_t       w;
    logic     w_valid;
    logic     b_ready;
    mst_ar_t  ar;
    logic     ar_valid;
    logic     r_ready;
  } mst_req_t;

  typedef struct packed {
    logic     aw_ready;
    logic     ar_ready;
    logic     w_ready;
    logic     b_valid;
    mst_b_t   b;
    logic     r_valid;
    mst_r_t   r;
  } mst_resp_t;

  // ---- Wire declarations for struct arrays ----------------------------------
  slv_req_t  [3:0] slv_reqs;
  slv_resp_t [3:0] slv_resps;
  mst_req_t        mst_req;
  mst_resp_t       mst_resp;

  // ---- Unpack slave port 0 (CPU / mem) ------------------------------------
  assign slv_reqs[0].aw.id     = s_axi_awid[5:0];
  assign slv_reqs[0].aw.addr   = s_axi_awaddr[31:0];
  assign slv_reqs[0].aw.len    = s_axi_awlen[7:0];
  assign slv_reqs[0].aw.size   = s_axi_awsize[2:0];
  assign slv_reqs[0].aw.burst  = s_axi_awburst[1:0];
  assign slv_reqs[0].aw.lock   = s_axi_awlock[0];
  assign slv_reqs[0].aw.cache  = s_axi_awcache[3:0];
  assign slv_reqs[0].aw.prot   = s_axi_awprot[2:0];
  assign slv_reqs[0].aw.qos    = s_axi_awqos[3:0];
  assign slv_reqs[0].aw.region = 4'd0;
  assign slv_reqs[0].aw.atop   = 6'd0;
  assign slv_reqs[0].aw.user   = 1'b0;
  assign slv_reqs[0].aw_valid  = s_axi_awvalid[0];
  assign slv_reqs[0].w.data    = s_axi_wdata[63:0];
  assign slv_reqs[0].w.strb    = s_axi_wstrb[7:0];
  assign slv_reqs[0].w.last    = s_axi_wlast[0];
  assign slv_reqs[0].w.user    = 1'b0;
  assign slv_reqs[0].w_valid   = s_axi_wvalid[0];
  assign slv_reqs[0].b_ready   = s_axi_bready[0];
  assign slv_reqs[0].ar.id     = s_axi_arid[5:0];
  assign slv_reqs[0].ar.addr   = s_axi_araddr[31:0];
  assign slv_reqs[0].ar.len    = s_axi_arlen[7:0];
  assign slv_reqs[0].ar.size   = s_axi_arsize[2:0];
  assign slv_reqs[0].ar.burst  = s_axi_arburst[1:0];
  assign slv_reqs[0].ar.lock   = s_axi_arlock[0];
  assign slv_reqs[0].ar.cache  = s_axi_arcache[3:0];
  assign slv_reqs[0].ar.prot   = s_axi_arprot[2:0];
  assign slv_reqs[0].ar.qos    = s_axi_arqos[3:0];
  assign slv_reqs[0].ar.region = 4'd0;
  assign slv_reqs[0].ar.user   = 1'b0;
  assign slv_reqs[0].ar_valid  = s_axi_arvalid[0];
  assign slv_reqs[0].r_ready   = s_axi_rready[0];

  assign s_axi_awready[0]    = slv_resps[0].aw_ready;
  assign s_axi_wready[0]     = slv_resps[0].w_ready;
  assign s_axi_bid[5:0]      = slv_resps[0].b.id;
  assign s_axi_bresp[1:0]    = slv_resps[0].b.resp;
  assign s_axi_bvalid[0]     = slv_resps[0].b_valid;
  assign s_axi_arready[0]    = slv_resps[0].ar_ready;
  assign s_axi_rid[5:0]      = slv_resps[0].r.id;
  assign s_axi_rdata[63:0]   = slv_resps[0].r.data;
  assign s_axi_rresp[1:0]    = slv_resps[0].r.resp;
  assign s_axi_rlast[0]      = slv_resps[0].r.last;
  assign s_axi_rvalid[0]     = slv_resps[0].r_valid;

  // ---- Unpack slave port 1 (SG-DMA) ---------------------------------------
  assign slv_reqs[1].aw.id     = s_axi_awid[11:6];
  assign slv_reqs[1].aw.addr   = s_axi_awaddr[63:32];
  assign slv_reqs[1].aw.len    = s_axi_awlen[15:8];
  assign slv_reqs[1].aw.size   = s_axi_awsize[5:3];
  assign slv_reqs[1].aw.burst  = s_axi_awburst[3:2];
  assign slv_reqs[1].aw.lock   = s_axi_awlock[1];
  assign slv_reqs[1].aw.cache  = s_axi_awcache[7:4];
  assign slv_reqs[1].aw.prot   = s_axi_awprot[5:3];
  assign slv_reqs[1].aw.qos    = s_axi_awqos[7:4];
  assign slv_reqs[1].aw.region = 4'd0;
  assign slv_reqs[1].aw.atop   = 6'd0;
  assign slv_reqs[1].aw.user   = 1'b0;
  assign slv_reqs[1].aw_valid  = s_axi_awvalid[1];
  assign slv_reqs[1].w.data    = s_axi_wdata[127:64];
  assign slv_reqs[1].w.strb    = s_axi_wstrb[15:8];
  assign slv_reqs[1].w.last    = s_axi_wlast[1];
  assign slv_reqs[1].w.user    = 1'b0;
  assign slv_reqs[1].w_valid   = s_axi_wvalid[1];
  assign slv_reqs[1].b_ready   = s_axi_bready[1];
  assign slv_reqs[1].ar.id     = s_axi_arid[11:6];
  assign slv_reqs[1].ar.addr   = s_axi_araddr[63:32];
  assign slv_reqs[1].ar.len    = s_axi_arlen[15:8];
  assign slv_reqs[1].ar.size   = s_axi_arsize[5:3];
  assign slv_reqs[1].ar.burst  = s_axi_arburst[3:2];
  assign slv_reqs[1].ar.lock   = s_axi_arlock[1];
  assign slv_reqs[1].ar.cache  = s_axi_arcache[7:4];
  assign slv_reqs[1].ar.prot   = s_axi_arprot[5:3];
  assign slv_reqs[1].ar.qos    = s_axi_arqos[7:4];
  assign slv_reqs[1].ar.region = 4'd0;
  assign slv_reqs[1].ar.user   = 1'b0;
  assign slv_reqs[1].ar_valid  = s_axi_arvalid[1];
  assign slv_reqs[1].r_ready   = s_axi_rready[1];

  assign s_axi_awready[1]    = slv_resps[1].aw_ready;
  assign s_axi_wready[1]     = slv_resps[1].w_ready;
  assign s_axi_bid[11:6]     = slv_resps[1].b.id;
  assign s_axi_bresp[3:2]    = slv_resps[1].b.resp;
  assign s_axi_bvalid[1]     = slv_resps[1].b_valid;
  assign s_axi_arready[1]    = slv_resps[1].ar_ready;
  assign s_axi_rid[11:6]     = slv_resps[1].r.id;
  assign s_axi_rdata[127:64] = slv_resps[1].r.data;
  assign s_axi_rresp[3:2]    = slv_resps[1].r.resp;
  assign s_axi_rlast[1]      = slv_resps[1].r.last;
  assign s_axi_rvalid[1]     = slv_resps[1].r_valid;

  // ---- Unpack slave port 2 (MM2S-DMA, stubbed in rvfpganexys.sv) ----------
  assign slv_reqs[2].aw.id     = s_axi_awid[17:12];
  assign slv_reqs[2].aw.addr   = s_axi_awaddr[95:64];
  assign slv_reqs[2].aw.len    = s_axi_awlen[23:16];
  assign slv_reqs[2].aw.size   = s_axi_awsize[8:6];
  assign slv_reqs[2].aw.burst  = s_axi_awburst[5:4];
  assign slv_reqs[2].aw.lock   = s_axi_awlock[2];
  assign slv_reqs[2].aw.cache  = s_axi_awcache[11:8];
  assign slv_reqs[2].aw.prot   = s_axi_awprot[8:6];
  assign slv_reqs[2].aw.qos    = s_axi_awqos[11:8];
  assign slv_reqs[2].aw.region = 4'd0;
  assign slv_reqs[2].aw.atop   = 6'd0;
  assign slv_reqs[2].aw.user   = 1'b0;
  assign slv_reqs[2].aw_valid  = s_axi_awvalid[2];
  assign slv_reqs[2].w.data    = s_axi_wdata[191:128];
  assign slv_reqs[2].w.strb    = s_axi_wstrb[23:16];
  assign slv_reqs[2].w.last    = s_axi_wlast[2];
  assign slv_reqs[2].w.user    = 1'b0;
  assign slv_reqs[2].w_valid   = s_axi_wvalid[2];
  assign slv_reqs[2].b_ready   = s_axi_bready[2];
  assign slv_reqs[2].ar.id     = s_axi_arid[17:12];
  assign slv_reqs[2].ar.addr   = s_axi_araddr[95:64];
  assign slv_reqs[2].ar.len    = s_axi_arlen[23:16];
  assign slv_reqs[2].ar.size   = s_axi_arsize[8:6];
  assign slv_reqs[2].ar.burst  = s_axi_arburst[5:4];
  assign slv_reqs[2].ar.lock   = s_axi_arlock[2];
  assign slv_reqs[2].ar.cache  = s_axi_arcache[11:8];
  assign slv_reqs[2].ar.prot   = s_axi_arprot[8:6];
  assign slv_reqs[2].ar.qos    = s_axi_arqos[11:8];
  assign slv_reqs[2].ar.region = 4'd0;
  assign slv_reqs[2].ar.user   = 1'b0;
  assign slv_reqs[2].ar_valid  = s_axi_arvalid[2];
  assign slv_reqs[2].r_ready   = s_axi_rready[2];

  assign s_axi_awready[2]      = slv_resps[2].aw_ready;
  assign s_axi_wready[2]       = slv_resps[2].w_ready;
  assign s_axi_bid[17:12]      = slv_resps[2].b.id;
  assign s_axi_bresp[5:4]      = slv_resps[2].b.resp;
  assign s_axi_bvalid[2]       = slv_resps[2].b_valid;
  assign s_axi_arready[2]      = slv_resps[2].ar_ready;
  assign s_axi_rid[17:12]      = slv_resps[2].r.id;
  assign s_axi_rdata[191:128]  = slv_resps[2].r.data;
  assign s_axi_rresp[5:4]      = slv_resps[2].r.resp;
  assign s_axi_rlast[2]        = slv_resps[2].r.last;
  assign s_axi_rvalid[2]       = slv_resps[2].r_valid;

  // ---- Unpack slave port 3 (S2MM-DMA) -------------------------------------
  assign slv_reqs[3].aw.id     = s_axi_awid[23:18];
  assign slv_reqs[3].aw.addr   = s_axi_awaddr[127:96];
  assign slv_reqs[3].aw.len    = s_axi_awlen[31:24];
  assign slv_reqs[3].aw.size   = s_axi_awsize[11:9];
  assign slv_reqs[3].aw.burst  = s_axi_awburst[7:6];
  assign slv_reqs[3].aw.lock   = s_axi_awlock[3];
  assign slv_reqs[3].aw.cache  = s_axi_awcache[15:12];
  assign slv_reqs[3].aw.prot   = s_axi_awprot[11:9];
  assign slv_reqs[3].aw.qos    = s_axi_awqos[15:12];
  assign slv_reqs[3].aw.region = 4'd0;
  assign slv_reqs[3].aw.atop   = 6'd0;
  assign slv_reqs[3].aw.user   = 1'b0;
  assign slv_reqs[3].aw_valid  = s_axi_awvalid[3];
  assign slv_reqs[3].w.data    = s_axi_wdata[255:192];
  assign slv_reqs[3].w.strb    = s_axi_wstrb[31:24];
  assign slv_reqs[3].w.last    = s_axi_wlast[3];
  assign slv_reqs[3].w.user    = 1'b0;
  assign slv_reqs[3].w_valid   = s_axi_wvalid[3];
  assign slv_reqs[3].b_ready   = s_axi_bready[3];
  assign slv_reqs[3].ar.id     = s_axi_arid[23:18];
  assign slv_reqs[3].ar.addr   = s_axi_araddr[127:96];
  assign slv_reqs[3].ar.len    = s_axi_arlen[31:24];
  assign slv_reqs[3].ar.size   = s_axi_arsize[11:9];
  assign slv_reqs[3].ar.burst  = s_axi_arburst[7:6];
  assign slv_reqs[3].ar.lock   = s_axi_arlock[3];
  assign slv_reqs[3].ar.cache  = s_axi_arcache[15:12];
  assign slv_reqs[3].ar.prot   = s_axi_arprot[11:9];
  assign slv_reqs[3].ar.qos    = s_axi_arqos[15:12];
  assign slv_reqs[3].ar.region = 4'd0;
  assign slv_reqs[3].ar.user   = 1'b0;
  assign slv_reqs[3].ar_valid  = s_axi_arvalid[3];
  assign slv_reqs[3].r_ready   = s_axi_rready[3];

  assign s_axi_awready[3]      = slv_resps[3].aw_ready;
  assign s_axi_wready[3]       = slv_resps[3].w_ready;
  assign s_axi_bid[23:18]      = slv_resps[3].b.id;
  assign s_axi_bresp[7:6]      = slv_resps[3].b.resp;
  assign s_axi_bvalid[3]       = slv_resps[3].b_valid;
  assign s_axi_arready[3]      = slv_resps[3].ar_ready;
  assign s_axi_rid[23:18]      = slv_resps[3].r.id;
  assign s_axi_rdata[255:192]  = slv_resps[3].r.data;
  assign s_axi_rresp[7:6]      = slv_resps[3].r.resp;
  assign s_axi_rlast[3]        = slv_resps[3].r.last;
  assign s_axi_rvalid[3]       = slv_resps[3].r_valid;

  // ---- Connect master req struct → flat output wires -----------------------
  assign m_axi_awid    = mst_req.aw.id;
  assign m_axi_awaddr  = mst_req.aw.addr;
  assign m_axi_awlen   = mst_req.aw.len;
  assign m_axi_awsize  = mst_req.aw.size;
  assign m_axi_awburst = mst_req.aw.burst;
  assign m_axi_awlock  = mst_req.aw.lock;
  assign m_axi_awcache = mst_req.aw.cache;
  assign m_axi_awprot  = mst_req.aw.prot;
  assign m_axi_awqos   = mst_req.aw.qos;
  assign m_axi_awvalid = mst_req.aw_valid;
  assign m_axi_wdata   = mst_req.w.data;
  assign m_axi_wstrb   = mst_req.w.strb;
  assign m_axi_wlast   = mst_req.w.last;
  assign m_axi_wvalid  = mst_req.w_valid;
  assign m_axi_bready  = mst_req.b_ready;
  assign m_axi_arid    = mst_req.ar.id;
  assign m_axi_araddr  = mst_req.ar.addr;
  assign m_axi_arlen   = mst_req.ar.len;
  assign m_axi_arsize  = mst_req.ar.size;
  assign m_axi_arburst = mst_req.ar.burst;
  assign m_axi_arlock  = mst_req.ar.lock;
  assign m_axi_arcache = mst_req.ar.cache;
  assign m_axi_arprot  = mst_req.ar.prot;
  assign m_axi_arqos   = mst_req.ar.qos;
  assign m_axi_arvalid = mst_req.ar_valid;
  assign m_axi_rready  = mst_req.r_ready;

  // ---- Connect flat input wires → master resp struct -----------------------
  assign mst_resp.aw_ready = m_axi_awready;
  assign mst_resp.ar_ready = m_axi_arready;
  assign mst_resp.w_ready  = m_axi_wready;
  assign mst_resp.b.id     = m_axi_bid;
  assign mst_resp.b.resp   = m_axi_bresp;
  assign mst_resp.b.user   = 1'b0;
  assign mst_resp.b_valid  = m_axi_bvalid;
  assign mst_resp.r.id     = m_axi_rid;
  assign mst_resp.r.data   = m_axi_rdata;
  assign mst_resp.r.resp   = m_axi_rresp;
  assign mst_resp.r.last   = m_axi_rlast;
  assign mst_resp.r.user   = 1'b0;
  assign mst_resp.r_valid  = m_axi_rvalid;

  // ---- Instantiate PULP axi_mux -------------------------------------------
  axi_mux #(
    .SlvAxiIDWidth (6),
    .slv_aw_chan_t (slv_aw_t),
    .mst_aw_chan_t (mst_aw_t),
    .w_chan_t      (w_t),
    .slv_b_chan_t  (slv_b_t),
    .mst_b_chan_t  (mst_b_t),
    .slv_ar_chan_t (slv_ar_t),
    .mst_ar_chan_t (mst_ar_t),
    .slv_r_chan_t  (slv_r_t),
    .mst_r_chan_t  (mst_r_t),
    .slv_req_t     (slv_req_t),
    .slv_resp_t    (slv_resp_t),
    .mst_req_t     (mst_req_t),
    .mst_resp_t    (mst_resp_t),
    .NoSlvPorts    (4),
    .MaxWTrans     (8),
    .FallThrough   (1'b0),
    .SpillAw       (1'b1),
    .SpillW        (1'b0),
    .SpillB        (1'b0),
    .SpillAr       (1'b1),
    .SpillR        (1'b0)
  ) u_ddr_mux (
    .clk_i       (aclk),
    .rst_ni      (aresetn),
    .test_i      (1'b0),
    .slv_reqs_i  (slv_reqs),
    .slv_resps_o (slv_resps),
    .mst_req_o   (mst_req),
    .mst_resp_i  (mst_resp)
  );

endmodule
`default_nettype wire
