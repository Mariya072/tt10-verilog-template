/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Input A (4-bit) and B (4-bit)
    output wire [7:0] uo_out,   // Output Product (8-bit)
    input  wire [7:0] uio_in,   // IOs: Input path (Unused, set to 0)
    output wire [7:0] uio_out,  // IOs: Output path (Unused, set to 0)
    output wire [7:0] uio_oe,   // IOs: Enable path (Unused, set to 0)
    input  wire       ena,      // Always 1 when powered (Unused, ignored)
    input  wire       clk,      // Clock (Unused for combinational logic)
    input  wire       rst_n     // Reset (Unused for combinational logic)
);

    // Internal wires for inputs and output
    wire [3:0] A = ui_in[3:0];
    wire [3:0] B = ui_in[7:4];
    wire [7:0] product;

    // Instantiate Wallace Tree Multiplier
    wallace_tree_multiplier uut (
        .A(A),
        .B(B),
        .product(product)
    );

    // Assign output
    assign uo_out  = product;

    // Disable unused IO signals (Required for TinyTapeout compatibility)
    assign uio_out = 8'b00000000;
    assign uio_oe  = 8'b00000000;

endmodule

