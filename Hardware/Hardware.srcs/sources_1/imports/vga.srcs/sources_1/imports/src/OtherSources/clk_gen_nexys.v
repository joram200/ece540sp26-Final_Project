// SPDX-License-Identifier: Apache-2.0
// Copyright 2019 Western Digital Corporation or its affiliates.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//********************************************************************************
// $Id$
//
// Function: VeeRwolf Basys3 clock generation
// Comments:
//
//********************************************************************************

module clk_gen_nexys
  (input  wire i_clk,
   input  wire     i_rst,
   output wire     o_clk_core,
   output wire     o_clk_eth,
   output wire     o_clk_gtx,
   output wire     o_clk_eth_ref,      // 50 MHz, 0 deg : RMII reference for rmii_phy_if
   output wire     o_clk_eth_ref_phy,  // 50 MHz, 45 deg: forwarded out to PHY CLKIN pin
   output reg o_rst_core);

   wire   clkfb;
   wire   locked;
   reg 	  locked_r;

   PLLE2_BASE
     #(.BANDWIDTH("OPTIMIZED"),
       .CLKFBOUT_MULT(15),
       .CLKIN1_PERIOD(10.0), //100MHz
       .CLKOUT0_DIVIDE(60),  // 100*15/60 = 25MHz core clock
       .CLKOUT1_DIVIDE(15),  // 100*15/15 = 100MHz eth clock
       .CLKOUT2_DIVIDE(12),  // 100*15/12 = 125MHz gtx clock
       .CLKOUT3_DIVIDE(30),  // 100*15/30 = 50MHz RMII ref (0 deg)  -> rmii_phy_if
       .CLKOUT4_DIVIDE(30),  // 100*15/30 = 50MHz RMII ref (45 deg) -> PHY CLKIN pin
       .CLKOUT4_PHASE(45.0), // RMII RX-window skew per Digilent guidance (tune if needed)
       .DIVCLK_DIVIDE(1),
       .STARTUP_WAIT("FALSE"))
   PLLE2_BASE_inst
     (.CLKOUT0(o_clk_core),
      .CLKOUT1(o_clk_eth),
      .CLKOUT2(o_clk_gtx),
      .CLKOUT3(o_clk_eth_ref),
      .CLKOUT4(o_clk_eth_ref_phy),
      .CLKOUT5(),
      .CLKFBOUT(clkfb),
      .LOCKED(locked),
      .CLKIN1(i_clk),
      .PWRDWN(1'b0),
      .RST(i_rst),
      .CLKFBIN(clkfb));

   always @(posedge o_clk_core) begin
      locked_r <= locked;
      o_rst_core <= !locked_r;
   end

endmodule
