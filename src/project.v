/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_template (
    input  wire [7:0] ui_in,    // Input A (4-bit) and B (4-bit)
    output wire [7:0] uo_out    // Output Product (8-bit)
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
    assign uo_out = product;

endmodule

// ✅ Wallace Tree Multiplier (with integrated adders)
module wallace_tree_multiplier(
    input [3:0] A, B,
    output [7:0] product
);
    wire [3:0] pp0, pp1, pp2, pp3;
    wire s1, c1, s2, c2, s3, c3, s4, c4, s5, c5, s6, c6, s7, c7;
    wire s8, c8, s9, c9, s10, c10, s11, c11;

    // Step 1: Generate Partial Products
    assign pp0 = A & {4{B[0]}};
    assign pp1 = A & {4{B[1]}};
    assign pp2 = A & {4{B[2]}};
    assign pp3 = A & {4{B[3]}};

    // Step 2: Wallace Tree Reduction
    half_adder ha1(pp0[1], pp1[0], s1, c1);
    full_adder fa1(pp0[2], pp1[1], pp2[0], s2, c2);
    full_adder fa2(pp0[3], pp1[2], pp2[1], s3, c3);
    half_adder ha2(pp1[3], pp2[2], s4, c4);
    
    half_adder ha3(s2, c1, s5, c5);
    full_adder fa3(s3, c2, pp3[0], s6, c6);
    full_adder fa4(s4, c3, pp3[1], s7, c7);
    half_adder ha4(pp2[3], pp3[2], s8, c8);

    half_adder ha5(s6, c5, s9, c9);
    full_adder fa5(s7, c6, c4, s10, c10);
    full_adder fa6(s8, c7, pp3[3], s11, c11);

    // Step 3: Final Addition
    assign product[0] = pp0[0];
    assign product[1] = s1;
    assign product[2] = s5;
    assign product[3] = s9;
    assign product[4] = s10;
    assign product[5] = s11;
    assign product[6] = c11;
    assign product[7] = 0; // Final carry is not considered in this 4×4 multiplier.

endmodule

// ✅ Half Adder (Integrated)
module half_adder(
    input a, b,
    output sum, carry
);
    assign sum = a ^ b;
    assign carry = a & b;
endmodule

// ✅ Full Adder (Integrated)
module full_adder(
    input a, b, cin,
    output sum, cout
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
