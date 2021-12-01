// (C) 2001-2020 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.



// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// $Id: //acds/rel/20.1std/ip/merlin/altera_merlin_router/altera_merlin_router.sv.terp#1 $
// $Revision: #1 $
// $Date: 2019/10/06 $
// $Author: psgswbuild $

// -------------------------------------------------------
// Merlin Router
//
// Asserts the appropriate one-hot encoded channel based on 
// either (a) the address or (b) the dest id. The DECODER_TYPE
// parameter controls this behaviour. 0 means address decoder,
// 1 means dest id decoder.
//
// In the case of (a), it also sets the destination id.
// -------------------------------------------------------

`timescale 1 ns / 1 ns

module NiosBase_mm_interconnect_0_router_default_decode
  #(
     parameter DEFAULT_CHANNEL = 2,
               DEFAULT_WR_CHANNEL = -1,
               DEFAULT_RD_CHANNEL = -1,
               DEFAULT_DESTID = 31 
   )
  (output [87 - 82 : 0] default_destination_id,
   output [35-1 : 0] default_wr_channel,
   output [35-1 : 0] default_rd_channel,
   output [35-1 : 0] default_src_channel
  );

  assign default_destination_id = 
    DEFAULT_DESTID[87 - 82 : 0];

  generate
    if (DEFAULT_CHANNEL == -1) begin : no_default_channel_assignment
      assign default_src_channel = '0;
    end
    else begin : default_channel_assignment
      assign default_src_channel = 35'b1 << DEFAULT_CHANNEL;
    end
  endgenerate

  generate
    if (DEFAULT_RD_CHANNEL == -1) begin : no_default_rw_channel_assignment
      assign default_wr_channel = '0;
      assign default_rd_channel = '0;
    end
    else begin : default_rw_channel_assignment
      assign default_wr_channel = 35'b1 << DEFAULT_WR_CHANNEL;
      assign default_rd_channel = 35'b1 << DEFAULT_RD_CHANNEL;
    end
  endgenerate

endmodule


module NiosBase_mm_interconnect_0_router
(
    // -------------------
    // Clock & Reset
    // -------------------
    input clk,
    input reset,

    // -------------------
    // Command Sink (Input)
    // -------------------
    input                       sink_valid,
    input  [101-1 : 0]    sink_data,
    input                       sink_startofpacket,
    input                       sink_endofpacket,
    output                      sink_ready,

    // -------------------
    // Command Source (Output)
    // -------------------
    output                          src_valid,
    output reg [101-1    : 0] src_data,
    output reg [35-1 : 0] src_channel,
    output                          src_startofpacket,
    output                          src_endofpacket,
    input                           src_ready
);

    // -------------------------------------------------------
    // Local parameters and variables
    // -------------------------------------------------------
    localparam PKT_ADDR_H = 54;
    localparam PKT_ADDR_L = 36;
    localparam PKT_DEST_ID_H = 87;
    localparam PKT_DEST_ID_L = 82;
    localparam PKT_PROTECTION_H = 91;
    localparam PKT_PROTECTION_L = 89;
    localparam ST_DATA_W = 101;
    localparam ST_CHANNEL_W = 35;
    localparam DECODER_TYPE = 0;

    localparam PKT_TRANS_WRITE = 57;
    localparam PKT_TRANS_READ  = 58;

    localparam PKT_ADDR_W = PKT_ADDR_H-PKT_ADDR_L + 1;
    localparam PKT_DEST_ID_W = PKT_DEST_ID_H-PKT_DEST_ID_L + 1;



    // -------------------------------------------------------
    // Figure out the number of bits to mask off for each slave span
    // during address decoding
    // -------------------------------------------------------
    localparam PAD0 = log2ceil(64'h40000 - 64'h20000); 
    localparam PAD1 = log2ceil(64'h41000 - 64'h40800); 
    localparam PAD2 = log2ceil(64'h41100 - 64'h41080); 
    localparam PAD3 = log2ceil(64'h41180 - 64'h41160); 
    localparam PAD4 = log2ceil(64'h411a0 - 64'h41180); 
    localparam PAD5 = log2ceil(64'h411c0 - 64'h411a0); 
    localparam PAD6 = log2ceil(64'h413a0 - 64'h41390); 
    localparam PAD7 = log2ceil(64'h413b0 - 64'h413a0); 
    localparam PAD8 = log2ceil(64'h413c0 - 64'h413b0); 
    localparam PAD9 = log2ceil(64'h413d0 - 64'h413c0); 
    localparam PAD10 = log2ceil(64'h413e0 - 64'h413d0); 
    localparam PAD11 = log2ceil(64'h413f0 - 64'h413e0); 
    localparam PAD12 = log2ceil(64'h41400 - 64'h413f0); 
    localparam PAD13 = log2ceil(64'h41410 - 64'h41400); 
    localparam PAD14 = log2ceil(64'h41420 - 64'h41410); 
    localparam PAD15 = log2ceil(64'h41430 - 64'h41420); 
    localparam PAD16 = log2ceil(64'h41440 - 64'h41430); 
    localparam PAD17 = log2ceil(64'h41450 - 64'h41440); 
    localparam PAD18 = log2ceil(64'h41460 - 64'h41450); 
    localparam PAD19 = log2ceil(64'h41470 - 64'h41460); 
    localparam PAD20 = log2ceil(64'h41480 - 64'h41470); 
    localparam PAD21 = log2ceil(64'h41490 - 64'h41480); 
    localparam PAD22 = log2ceil(64'h414a0 - 64'h41490); 
    localparam PAD23 = log2ceil(64'h414b0 - 64'h414a0); 
    localparam PAD24 = log2ceil(64'h414c0 - 64'h414b0); 
    localparam PAD25 = log2ceil(64'h414d0 - 64'h414c0); 
    localparam PAD26 = log2ceil(64'h414e0 - 64'h414d0); 
    localparam PAD27 = log2ceil(64'h414f0 - 64'h414e0); 
    localparam PAD28 = log2ceil(64'h41500 - 64'h414f0); 
    localparam PAD29 = log2ceil(64'h41510 - 64'h41500); 
    localparam PAD30 = log2ceil(64'h41520 - 64'h41510); 
    localparam PAD31 = log2ceil(64'h41530 - 64'h41520); 
    localparam PAD32 = log2ceil(64'h41540 - 64'h41530); 
    localparam PAD33 = log2ceil(64'h41550 - 64'h41540); 
    localparam PAD34 = log2ceil(64'h41560 - 64'h41550); 
    // -------------------------------------------------------
    // Work out which address bits are significant based on the
    // address range of the slaves. If the required width is too
    // large or too small, we use the address field width instead.
    // -------------------------------------------------------
    localparam ADDR_RANGE = 64'h41560;
    localparam RANGE_ADDR_WIDTH = log2ceil(ADDR_RANGE);
    localparam OPTIMIZED_ADDR_H = (RANGE_ADDR_WIDTH > PKT_ADDR_W) ||
                                  (RANGE_ADDR_WIDTH == 0) ?
                                        PKT_ADDR_H :
                                        PKT_ADDR_L + RANGE_ADDR_WIDTH - 1;

    localparam RG = RANGE_ADDR_WIDTH-1;
    localparam REAL_ADDRESS_RANGE = OPTIMIZED_ADDR_H - PKT_ADDR_L;

      reg [PKT_ADDR_W-1 : 0] address;
      always @* begin
        address = {PKT_ADDR_W{1'b0}};
        address [REAL_ADDRESS_RANGE:0] = sink_data[OPTIMIZED_ADDR_H : PKT_ADDR_L];
      end   

    // -------------------------------------------------------
    // Pass almost everything through, untouched
    // -------------------------------------------------------
    assign sink_ready        = src_ready;
    assign src_valid         = sink_valid;
    assign src_startofpacket = sink_startofpacket;
    assign src_endofpacket   = sink_endofpacket;
    wire [PKT_DEST_ID_W-1:0] default_destid;
    wire [35-1 : 0] default_src_channel;




    // -------------------------------------------------------
    // Write and read transaction signals
    // -------------------------------------------------------
    wire read_transaction;
    assign read_transaction  = sink_data[PKT_TRANS_READ];


    NiosBase_mm_interconnect_0_router_default_decode the_default_decode(
      .default_destination_id (default_destid),
      .default_wr_channel   (),
      .default_rd_channel   (),
      .default_src_channel  (default_src_channel)
    );

    always @* begin
        src_data    = sink_data;
        src_channel = default_src_channel;
        src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = default_destid;

        // --------------------------------------------------
        // Address Decoder
        // Sets the channel and destination ID based on the address
        // --------------------------------------------------

    // ( 0x20000 .. 0x40000 )
    if ( {address[RG:PAD0],{PAD0{1'b0}}} == 19'h20000   ) begin
            src_channel = 35'b00000000000000000000000000000000100;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 31;
    end

    // ( 0x40800 .. 0x41000 )
    if ( {address[RG:PAD1],{PAD1{1'b0}}} == 19'h40800   ) begin
            src_channel = 35'b00000000000000000000000000000000010;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 16;
    end

    // ( 0x41080 .. 0x41100 )
    if ( {address[RG:PAD2],{PAD2{1'b0}}} == 19'h41080   ) begin
            src_channel = 35'b00000000000000000000000000000000001;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 0;
    end

    // ( 0x41160 .. 0x41180 )
    if ( {address[RG:PAD3],{PAD3{1'b0}}} == 19'h41160   ) begin
            src_channel = 35'b00000000000000000000100000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 34;
    end

    // ( 0x41180 .. 0x411a0 )
    if ( {address[RG:PAD4],{PAD4{1'b0}}} == 19'h41180   ) begin
            src_channel = 35'b00000000000000000000000000000010000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 33;
    end

    // ( 0x411a0 .. 0x411c0 )
    if ( {address[RG:PAD5],{PAD5{1'b0}}} == 19'h411a0   ) begin
            src_channel = 35'b00000000000000000000000000000001000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 32;
    end

    // ( 0x41390 .. 0x413a0 )
    if ( {address[RG:PAD6],{PAD6{1'b0}}} == 19'h41390   ) begin
            src_channel = 35'b10000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 20;
    end

    // ( 0x413a0 .. 0x413b0 )
    if ( {address[RG:PAD7],{PAD7{1'b0}}} == 19'h413a0   ) begin
            src_channel = 35'b01000000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 21;
    end

    // ( 0x413b0 .. 0x413c0 )
    if ( {address[RG:PAD8],{PAD8{1'b0}}} == 19'h413b0  && read_transaction  ) begin
            src_channel = 35'b00100000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 15;
    end

    // ( 0x413c0 .. 0x413d0 )
    if ( {address[RG:PAD9],{PAD9{1'b0}}} == 19'h413c0  && read_transaction  ) begin
            src_channel = 35'b00010000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 14;
    end

    // ( 0x413d0 .. 0x413e0 )
    if ( {address[RG:PAD10],{PAD10{1'b0}}} == 19'h413d0  && read_transaction  ) begin
            src_channel = 35'b00001000000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 13;
    end

    // ( 0x413e0 .. 0x413f0 )
    if ( {address[RG:PAD11],{PAD11{1'b0}}} == 19'h413e0  && read_transaction  ) begin
            src_channel = 35'b00000100000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 12;
    end

    // ( 0x413f0 .. 0x41400 )
    if ( {address[RG:PAD12],{PAD12{1'b0}}} == 19'h413f0  && read_transaction  ) begin
            src_channel = 35'b00000010000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 11;
    end

    // ( 0x41400 .. 0x41410 )
    if ( {address[RG:PAD13],{PAD13{1'b0}}} == 19'h41400  && read_transaction  ) begin
            src_channel = 35'b00000001000000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 10;
    end

    // ( 0x41410 .. 0x41420 )
    if ( {address[RG:PAD14],{PAD14{1'b0}}} == 19'h41410   ) begin
            src_channel = 35'b00000000100000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 19;
    end

    // ( 0x41420 .. 0x41430 )
    if ( {address[RG:PAD15],{PAD15{1'b0}}} == 19'h41420   ) begin
            src_channel = 35'b00000000010000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 18;
    end

    // ( 0x41430 .. 0x41440 )
    if ( {address[RG:PAD16],{PAD16{1'b0}}} == 19'h41430   ) begin
            src_channel = 35'b00000000001000000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 30;
    end

    // ( 0x41440 .. 0x41450 )
    if ( {address[RG:PAD17],{PAD17{1'b0}}} == 19'h41440   ) begin
            src_channel = 35'b00000000000100000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 29;
    end

    // ( 0x41450 .. 0x41460 )
    if ( {address[RG:PAD18],{PAD18{1'b0}}} == 19'h41450   ) begin
            src_channel = 35'b00000000000010000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 28;
    end

    // ( 0x41460 .. 0x41470 )
    if ( {address[RG:PAD19],{PAD19{1'b0}}} == 19'h41460   ) begin
            src_channel = 35'b00000000000001000000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 27;
    end

    // ( 0x41470 .. 0x41480 )
    if ( {address[RG:PAD20],{PAD20{1'b0}}} == 19'h41470   ) begin
            src_channel = 35'b00000000000000100000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 26;
    end

    // ( 0x41480 .. 0x41490 )
    if ( {address[RG:PAD21],{PAD21{1'b0}}} == 19'h41480   ) begin
            src_channel = 35'b00000000000000010000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 25;
    end

    // ( 0x41490 .. 0x414a0 )
    if ( {address[RG:PAD22],{PAD22{1'b0}}} == 19'h41490   ) begin
            src_channel = 35'b00000000000000001000000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 24;
    end

    // ( 0x414a0 .. 0x414b0 )
    if ( {address[RG:PAD23],{PAD23{1'b0}}} == 19'h414a0   ) begin
            src_channel = 35'b00000000000000000100000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 23;
    end

    // ( 0x414b0 .. 0x414c0 )
    if ( {address[RG:PAD24],{PAD24{1'b0}}} == 19'h414b0   ) begin
            src_channel = 35'b00000000000000000010000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 22;
    end

    // ( 0x414c0 .. 0x414d0 )
    if ( {address[RG:PAD25],{PAD25{1'b0}}} == 19'h414c0   ) begin
            src_channel = 35'b00000000000000000001000000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 17;
    end

    // ( 0x414d0 .. 0x414e0 )
    if ( {address[RG:PAD26],{PAD26{1'b0}}} == 19'h414d0  && read_transaction  ) begin
            src_channel = 35'b00000000000000000000010000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 7;
    end

    // ( 0x414e0 .. 0x414f0 )
    if ( {address[RG:PAD27],{PAD27{1'b0}}} == 19'h414e0  && read_transaction  ) begin
            src_channel = 35'b00000000000000000000001000000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 6;
    end

    // ( 0x414f0 .. 0x41500 )
    if ( {address[RG:PAD28],{PAD28{1'b0}}} == 19'h414f0  && read_transaction  ) begin
            src_channel = 35'b00000000000000000000000100000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 5;
    end

    // ( 0x41500 .. 0x41510 )
    if ( {address[RG:PAD29],{PAD29{1'b0}}} == 19'h41500  && read_transaction  ) begin
            src_channel = 35'b00000000000000000000000010000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 4;
    end

    // ( 0x41510 .. 0x41520 )
    if ( {address[RG:PAD30],{PAD30{1'b0}}} == 19'h41510  && read_transaction  ) begin
            src_channel = 35'b00000000000000000000000001000000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 3;
    end

    // ( 0x41520 .. 0x41530 )
    if ( {address[RG:PAD31],{PAD31{1'b0}}} == 19'h41520  && read_transaction  ) begin
            src_channel = 35'b00000000000000000000000000100000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 2;
    end

    // ( 0x41530 .. 0x41540 )
    if ( {address[RG:PAD32],{PAD32{1'b0}}} == 19'h41530  && read_transaction  ) begin
            src_channel = 35'b00000000000000000000000000010000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 1;
    end

    // ( 0x41540 .. 0x41550 )
    if ( {address[RG:PAD33],{PAD33{1'b0}}} == 19'h41540  && read_transaction  ) begin
            src_channel = 35'b00000000000000000000000000001000000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 9;
    end

    // ( 0x41550 .. 0x41560 )
    if ( {address[RG:PAD34],{PAD34{1'b0}}} == 19'h41550   ) begin
            src_channel = 35'b00000000000000000000000000000100000;
            src_data[PKT_DEST_ID_H:PKT_DEST_ID_L] = 8;
    end

end


    // --------------------------------------------------
    // Ceil(log2()) function
    // --------------------------------------------------
    function integer log2ceil;
        input reg[65:0] val;
        reg [65:0] i;

        begin
            i = 1;
            log2ceil = 0;

            while (i < val) begin
                log2ceil = log2ceil + 1;
                i = i << 1;
            end
        end
    endfunction

endmodule


