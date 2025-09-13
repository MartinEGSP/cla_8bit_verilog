`timescale 1ns / 1ps // interpret time units

//------1. Design and Simulate the Following Modules--------

module nand2_delay (
    input logic a,
    input logic b,
    output logic y
);
assign #1 y = ~(a & b); //#1 = 1T delay
endmodule

module xor2_delay (
    input logic a,
    input logic b,
    output logic y
);

logic nand1_out;
logic nand2_out;
logic nand3_out;

nand2_delay u1 (
    .a(a), 
    .b(b),
    .y(nand1_out) // A nand B = y1
); 

nand2_delay u2 (
    .a(a), 
    .b(nand1_out),
    .y(nand2_out) // A nand y1 = y2
); 
nand2_delay u3 (
    .a(b), 
    .b(nand1_out), 
    .y(nand3_out) // B nand y1 = y3
); 

nand2_delay u4 (
    .a(nand2_out), 
    .b(nand3_out), 
    .y(y) // y2 nand y3 = XOR
); 
endmodule



module propagate_logic (
    input logic a,
    input logic b,
    output logic p //A or B
);

logic nand1_out;
logic nand2_out;

nand2_delay u1 (
    .a(a), 
    .b(a), 
    .y(nand1_out)
); 

nand2_delay u2 (
    .a(b), 
    .b(b), 
    .y(nand2_out)
); 

nand2_delay u3 (
    .a(nand1_out), 
    .b(nand2_out), 
    .y(p)
    );
endmodule

module generate_logic (
    input logic a,
    input logic b,
    output logic g //A and B
);

logic nand_out;


nand2_delay u1 (
    .a(a), 
    .b(b),
    .y(nand_out)
); 

nand2_delay u2 (
    .a(nand_out), 
    .b(nand_out), 
    .y(g)
); 
endmodule

module sum_logic (
    input logic a,
    input logic b,
    input logic carry_in,
    output logic sum
);

logic xor1_out;

xor2_delay u1 (
    .a(a), 
    .b(b), 
    .y(xor1_out)
); 

xor2_delay u2 (
    .a(xor1_out), 
    .b(carry_in), 
    .y(sum)
); 

endmodule

module carry_logic_0 ( 
input logic p0,
input logic g0,
input logic carry_in0,
output logic carry_out);

logic nand1_out;
logic nand2_out;

nand2_delay u1 (
    .a(p0), 
    .b(carry_in0), 
    .y(nand1_out)
); 

nand2_delay u2 (
    .a(g0), 
    .b(g0), 
    .y(nand2_out)
); 

nand2_delay u3 (
    .a(nand1_out), 
    .b(nand2_out), 
    .y(carry_out)
); 
endmodule


//---------2. Design nandN_delay Gate Modules--------

//nandN_delay without N amount, rewrite?
module nand3_delay (
    input logic a,
    input logic b,
    input logic c,
    output logic y
);
assign #1.25 y = ~(a & b & c); //#1.25 = 1.25T delay
endmodule

module nand4_delay (
    input logic a,
    input logic b,
    input logic c,
    input logic d,
    output logic y
);
assign #1.5 y = ~(a & b & c & d); //#1.5 = 1.5T delay
endmodule

module nand5_delay (
    input logic a,
    input logic b,
    input logic c,
    input logic d,
    input logic e,
    output logic y
);

logic nand1_out;
logic nand2_out;

nand3_delay u1 (
    .a(a), 
    .b(b),
    .c(c), 
    .y(nand1_out)
);

nand2_delay u2 (
    .a(d), 
    .b(e), 
    .y(nand2_out)
);
nand2_delay u3 (
    .a(nand1_out), 
    .b(nand2_out), 
    .y(y)
);
endmodule

module nand6_delay (
    input logic a,
    input logic b,
    input logic c,
    input logic d,
    input logic e,
    input logic f,
    output logic y
);

logic nand1_out;
logic nand2_out;

nand3_delay u1 (
    .a(a), 
    .b(b),
    .c(c), 
    .y(nand1_out)
);

nand3_delay u2 (
    .a(d), 
    .b(e),
    .c(f), 
    .y(nand2_out)
);
nand2_delay u3 (
    .a(nand1_out), 
    .b(nand2_out), 
    .y(y)
);
endmodule

module nand7_delay (
    input logic a,
    input logic b,
    input logic c,
    input logic d,
    input logic e,
    input logic f,
    input logic g,
    output logic y
);

logic nand1_out;
logic nand2_out;

nand3_delay u1 (
    .a(a), 
    .b(b),
    .c(c), 
    .y(nand1_out)
);

nand4_delay u2 (
    .a(d), 
    .b(e),
    .c(f), 
    .d(g),
    .y(nand2_out)
);
nand2_delay u3 (
    .a(nand1_out), 
    .b(nand2_out), 
    .y(y)
);
endmodule

module nand8_delay (
    input logic a,
    input logic b,
    input logic c,
    input logic d,
    input logic e,
    input logic f,
    input logic g,
    input logic h,
    output logic y
);

logic nand1_out;
logic nand2_out;

nand4_delay u1 (
    .a(a), 
    .b(b),
    .c(c), 
    .d(d),
    .y(nand1_out)
);

nand4_delay u2 (
    .a(e), 
    .b(f),
    .c(g), 
    .d(h),
    .y(nand2_out)
);
nand2_delay u3 (
    .a(nand1_out), 
    .b(nand2_out), 
    .y(y)
);
endmodule

module nand9_delay (
    input logic a,
    input logic b,
    input logic c,
    input logic d,
    input logic e,
    input logic f,
    input logic g,
    input logic h,
    input logic i,
    output logic y
);

logic nand1_out;
logic nand2_out;
logic nand3_out;

nand3_delay u1 (
    .a(a), 
    .b(b),
    .c(c), 
    .y(nand1_out)
);

nand3_delay u2 (
    .a(d), 
    .b(e),
    .c(f), 
    .y(nand2_out)
);
nand3_delay u3 (
    .a(g), 
    .b(h),
    .c(i), 
    .y(nand3_out)
);
nand3_delay u4 (
    .a(nand1_out), 
    .b(nand2_out), 
    .c(nand3_out),
    .y(y)
);
endmodule


//------------ 3. Design the Carry-Out Logic 1-7-----------
/*
module carry_logic_i (    
    input logic pi,
    input logic gi,
    input logic carry_ini, //carry in i-1
    output logic carry_outi
);

logic nand_pc_in; //p nand carry in
logic nand_g_in; 
logic and_;

nand2_delay u1 ( 
    .a(pi), 
    .b(carry_ini), 
    .y(nand_pc_in)
); 

nand2_delay u2 ( //p and carry in
    .a(nand_pc_in), 
    .b(nand_pc_in), 
    .y(and_)
); 

nand2_delay u3 ( //not gi 
    .a(gi), 
    .b(gi), 
    .y(nand_g_in)
); 

nand2_delay u4 (
    .a(and_),       //pci
    .b(nand_g_in),  //not gi
    .y(carry_outi)  //not(pci and not gi) = pci or gi 
); 
endmodule
*/



module CLA_carry_logic_1 (
    input logic p0,
    input logic g0,
    input logic p1,
    input logic g1,
    input logic ci0,
    output logic co
);

logic nand1_out;
logic nand2_out;
logic nand3_out;


nand3_delay u1 (
    .a(p0), 
    .b(p1), 
    .c(ci0),
    .y(nand1_out)
); 
nand2_delay u2 (
    .a(p1), 
    .b(g0),
    .y(nand2_out)
); 
nand2_delay u3 (
    .a(g1), 
    .b(g1), 
    .y(nand3_out)
); 
nand3_delay u4 (
    .a(nand1_out), 
    .b(nand2_out), 
    .c(nand3_out), 
    .y(co)
); 
endmodule

module CLA_carry_logic_2 (
    input logic p0,
    input logic g0,
    input logic p1,
    input logic g1,
    input logic p2,
    input logic g2,
    input logic ci0,
    output logic co
);

logic nand1_out; 
logic nand2_out; 
logic nand3_out; 
logic nand4_out;

nand4_delay u1 (
    .a(p2), 
    .b(p1), 
    .c(p0), 
    .d(ci0), 
    .y(nand1_out)
); 
nand3_delay u2 (
    .a(p2), 
    .b(p1), 
    .c(g0), 
    .y(nand2_out)
); 
nand2_delay u3 (
    .a(p2), 
    .b(g1), 
    .y(nand3_out)
); 
nand2_delay u4 (
    .a(g2), 
    .b(g2),
    .y(nand4_out)
); 
nand4_delay u5 (
    .a(nand1_out),
    .b(nand2_out),
    .c(nand3_out),
    .d(nand4_out),
    .y(co)
); 
endmodule

module CLA_carry_logic_3 (
    input logic p0, g0,
    input logic p1, g1,
    input logic p2, g2,
    input logic p3, g3,
    input logic ci0,
    output logic co
);

logic nand1_out, nand2_out, nand3_out;
logic nand4_out, nand5_out;

nand5_delay u1 (
    .a(p0),
    .b(p1),
    .c(p2),
    .d(p3),
    .e(ci0),
    .y(nand1_out)
); 
nand4_delay u2 (
    .a(p1),
    .b(p2),
    .c(p3),
    .d(g0),
    .y(nand2_out)
); 
nand3_delay u3 (
    .a(p3),
    .b(p2),
    .c(g1), 
    .y(nand3_out)
); 
nand2_delay u4 (
    .a(p3),
    .b(g2),
    .y(nand4_out)
); 
nand2_delay u5 (
    .a(g3),
    .b(g3),
    .y(nand5_out)
); 
nand5_delay u6 (
    .a(nand1_out),
    .b(nand2_out),
    .c(nand3_out), 
    .d(nand4_out),
    .e(nand5_out),
    .y(co)
); 
endmodule

module CLA_carry_logic_4 (
    input logic p0, g0,
    input logic p1, g1,
    input logic p2, g2,
    input logic p3, g3,
    input logic p4, g4,
    input logic ci0,
    output logic co
);

logic nand1_out, nand2_out, nand3_out;
logic nand4_out, nand5_out, nand6_out;

nand6_delay u1(
    .a(p0),
    .b(p1),
    .c(p2),
    .d(p3),
    .e(p4),
    .f(ci0),
    .y(nand1_out)
); 
nand5_delay u2 (
    .a(p1),
    .b(p2),
    .c(p3),
    .d(p4),
    .e(g0),
    .y(nand2_out)
); 
nand4_delay u3 (
    .a(p2),
    .b(p3),
    .c(p4),
    .d(g1),
    .y(nand3_out)
); 
nand3_delay u4 (
    .a(p3),
    .b(p4),
    .c(g2), 
    .y(nand4_out)
); 
nand2_delay u5 (
    .a(p4),
    .b(g3),
    .y(nand5_out)
); 
nand2_delay u6 (
    .a(g4),
    .b(g4),
    .y(nand6_out)
); 
nand6_delay u7 (
    .a(nand1_out),
    .b(nand2_out),
    .c(nand3_out), 
    .d(nand4_out),
    .e(nand5_out),
    .f(nand6_out),
    .y(co)
); 
endmodule

module CLA_carry_logic_5 (
    input logic p0, g0,
    input logic p1, g1,
    input logic p2, g2,
    input logic p3, g3,
    input logic p4, g4,
    input logic p5, g5,
    input logic ci0,
    output logic co
);

logic nand1_out, nand2_out, nand3_out;
logic nand4_out, nand5_out, nand6_out;
logic nand7_out;

nand7_delay u1(
    .a(p0),
    .b(p1),
    .c(p2),
    .d(p3),
    .e(p4),
    .f(p5),
    .g(ci0),
    .y(nand1_out)
); 
nand6_delay u2(
    .a(p1),
    .b(p2),
    .c(p3),
    .d(p4),
    .e(p5),
    .f(g0),
    .y(nand2_out)
); 
nand5_delay u3 (
    .a(p2),
    .b(p3),
    .c(p4),
    .d(p5),
    .e(g1),
    .y(nand3_out)
); 
nand4_delay u4 (
    .a(p3),
    .b(p4),
    .c(p5),
    .d(g2),
    .y(nand4_out)
); 
nand3_delay u5 (
    .a(p4),
    .b(p5),
    .c(g3), 
    .y(nand5_out)
); 
nand2_delay u6 (
    .a(p5),
    .b(g4),
    .y(nand6_out)
); 
nand2_delay u7 (
    .a(g5),
    .b(g5),
    .y(nand7_out)
); 
nand7_delay u8 (
    .a(nand1_out),
    .b(nand2_out),
    .c(nand3_out), 
    .d(nand4_out),
    .e(nand5_out),
    .f(nand6_out),    
    .g(nand7_out),
    .y(co)
); 
endmodule

module CLA_carry_logic_6 (
    input logic p0, g0,
    input logic p1, g1,
    input logic p2, g2,
    input logic p3, g3,
    input logic p4, g4,
    input logic p5, g5,
    input logic p6, g6,
    input logic ci0,
    output logic co
);

logic nand1_out, nand2_out, nand3_out;
logic nand4_out, nand5_out, nand6_out;
logic nand7_out, nand8_out;

nand8_delay u1(
    .a(p0),
    .b(p1),
    .c(p2),
    .d(p3),
    .e(p4),
    .f(p5),
    .g(p6),
    .h(ci0),
    .y(nand1_out)
); 
nand7_delay u2(
    .a(p1),
    .b(p2),
    .c(p3),
    .d(p4),
    .e(p5),
    .f(p6),
    .g(g0),
    .y(nand2_out)
); 
nand6_delay u3(
    .a(p2),
    .b(p3),
    .c(p4),
    .d(p5),
    .e(p6),
    .f(g1),
    .y(nand3_out)
); 
nand5_delay u4 (
    .a(p3),
    .b(p4),
    .c(p5),
    .d(p6),
    .e(g2),
    .y(nand4_out)
); 
nand4_delay u5 (
    .a(p4),
    .b(p5),
    .c(p6),
    .d(g3),
    .y(nand5_out)
); 
nand3_delay u6 (
    .a(p5),
    .b(p6),
    .c(g4), 
    .y(nand6_out)
); 
nand2_delay u7 (
    .a(p6),
    .b(g5),
    .y(nand7_out)
); 
nand2_delay u8 (
    .a(g6),
    .b(g6),
    .y(nand8_out)
); 
nand8_delay u9 (
    .a(nand1_out),
    .b(nand2_out),
    .c(nand3_out), 
    .d(nand4_out),
    .e(nand5_out),
    .f(nand6_out),    
    .g(nand7_out),
    .h(nand8_out),
    .y(co)
); 
endmodule

module CLA_carry_logic_7 (
    input logic p0, g0,
    input logic p1, g1,
    input logic p2, g2,
    input logic p3, g3,
    input logic p4, g4,
    input logic p5, g5,
    input logic p6, g6,
    input logic p7, g7,
    input logic ci0,
    output logic co
);

logic nand1_out, nand2_out, nand3_out;
logic nand4_out, nand5_out, nand6_out;
logic nand7_out, nand8_out, nand9_out;

nand9_delay u1(
    .a(p0),
    .b(p1),
    .c(p2),
    .d(p3),
    .e(p4),
    .f(p5),
    .g(p6),
    .h(p7),
    .i(ci0),
    .y(nand1_out)
); 
nand8_delay u2(
    .a(p1),
    .b(p2),
    .c(p3),
    .d(p4),
    .e(p5),
    .f(p6),
    .g(p7),
    .h(g0),
    .y(nand2_out)
); 
nand7_delay u3(
    .a(p2),
    .b(p3),
    .c(p4),
    .d(p5),
    .e(p6),
    .f(p7),
    .g(g1),
    .y(nand3_out)
); 
nand6_delay u4(
    .a(p3),
    .b(p4),
    .c(p5),
    .d(p6),
    .e(p7),
    .f(g2),
    .y(nand4_out)
); 
nand5_delay u5 (
    .a(p4),
    .b(p5),
    .c(p6),
    .d(p7),
    .e(g3),
    .y(nand5_out)
); 
nand4_delay u6 (
    .a(p5),
    .b(p6),
    .c(p7),
    .d(g4),
    .y(nand6_out)
); 
nand3_delay u7 (
    .a(p6),
    .b(p7),
    .c(g5), 
    .y(nand7_out)
); 
nand2_delay u8 (
    .a(p7),
    .b(g6),
    .y(nand8_out)
); 
nand2_delay u9 (
    .a(g7),
    .b(g7),
    .y(nand9_out)
); 
nand9_delay u10 (
    .a(nand1_out),
    .b(nand2_out),
    .c(nand3_out), 
    .d(nand4_out),
    .e(nand5_out),
    .f(nand6_out),    
    .g(nand7_out),
    .h(nand8_out),
    .i(nand9_out),
    .y(co)
); 
endmodule

//------------ 4. Design and connect the 8-bit CLA------------
/*
module cla_8bit (
    input logic [7:0] a,
    input logic [7:0] b,
    output logic [8:0] sum
);

logic [7:0] p, g; //propagate and generate
logic [8:0] c;  //carry

// Propagate Logic
genvar i;
generate
    for (i = 0; i < 8; i++) 
        begin : generate_PL
            propagate_logic pl (
                .a(a[i]),
                .b(b[i]),
                .p(p[i])
            );
        end
endgenerate
 
// Generate Logic
genvar j;
generate
    for (j = 0; j < 8; j++) 
        begin : generate_GL 
            generate_logic gl (
                .a(a[j]), 
                .b(b[j]), 
                .g(g[j])
            );
        end
endgenerate

// Sum Logic
genvar k;
generate
    for (k = 0; k < 8; k++) 
        begin : generate_SL
            sum_logic sl (
                .a(a[k]),
                .b(b[k]),
                .cin(c[k]),
                .s(sum[k]) 
            );
        end
endgenerate

// Slice 0 does not need carry computation – 
// Cin is the carry coming from outside and is assumed to be 0

assign c[0] = 1'b0; // Cin is 0
assign sum[8] = c[8];

//Slice 1
CLA_carry_logic_0 cl0 (
    .p0(p[0]), 
    .g0(g[0]), 
    .ci0(1'b0), 
    .co(c[1])
);

//Slice 2
CLA_carry_logic_1 cl1 (
    .p0(p[0]),
    .g0(g[0]), 
    .p1(p[1]), 
    .g1(g[1]), 
    .ci0(c[0]), 
    .co(c[2])
);


// Slice 3
CLA_carry_logic_2 cl2 (
    .p0(p[0]), 
    .g0(g[0]), 
    .p1(p[1]), 
    .g1(g[1]), 
    .p2(p[2]), 
    .g2(g[2]),
    .ci0(c[0]), 
    .co(c[3])
);

// Slice 4 implements sign extension
CLA_carry_logic_3 cl3 (
    .p0(p[0]), 
    .g0(g[0]), 
    .p1(p[1]), 
    .g1(g[1]), 
    .p2(p[2]), 
    .g2(g[2]), 
    .p3(p[3]), 
    .g3(g[3]), 
    .ci0(c[0]), 
    .co(c[4])
);

endmodule


*/

module cla_8bit (
    input logic [7:0] a,
    input logic [7:0] b,
    output logic [8:0] sum
);

logic [7:0] p, g; //propagate and generate
logic [8:0] c;  //carry

// Propagate Logic
genvar i;
generate
    for (i = 0; i < 8; i++) 
        begin : generate_PL
            propagate_logic pl (
                .a(a[i]),
                .b(b[i]),
                .p(p[i])
            );
        end
endgenerate
 
// Generate Logic
genvar j;
generate
    for (j = 0; j < 8; j++) 
        begin : generate_GL 
            generate_logic gl (
                .a(a[j]), 
                .b(b[j]), 
                .g(g[j])
            );
        end
endgenerate

// Sum Logic
assign c[0] = 1'b0; // Cin is 0

genvar k;
generate
    for (k = 0; k < 8; k++) begin : SUM_BLOCK
        sum_logic sl (
            .a(a[k]),
            .b(b[k]),
            .carry_in(c[k]),
            .sum(sum[k])
        );
    end
endgenerate

// The final MSB sum bit (sign extension)
assign sum[8] = c[8];

/*
//Slice 0
CLA_carry_logic_0 cl0 (
    .p0(p[0]), 
    .g0(g[0]), 
    .ci0(1'b0), 
    .co(c[1])
);*/

//Slice 1
CLA_carry_logic_1 cl1 (
    .p0(p[0]),
    .g0(g[0]), 
    .p1(p[1]), 
    .g1(g[1]), 
    .ci0(1'b0), 
    .co(c[2])
);
// Slice 2
CLA_carry_logic_2 cl2 (
    .p0(p[0]), 
    .g0(g[0]), 
    .p1(p[1]), 
    .g1(g[1]), 
    .p2(p[2]), 
    .g2(g[2]),
    .ci0(1'b0), 
    .co(c[3])
);

// Slice 3
CLA_carry_logic_3 cl3 (
    .p0(p[0]), 
    .g0(g[0]), 
    .p1(p[1]), 
    .g1(g[1]), 
    .p2(p[2]), 
    .g2(g[2]), 
    .p3(p[3]), 
    .g3(g[3]), 
    .ci0(1'b0), 
    .co(c[4])
);
// Slice 4
CLA_carry_logic_4 cl4 (
    .p0(p[0]), 
    .g0(g[0]), 
    .p1(p[1]), 
    .g1(g[1]), 
    .p2(p[2]), 
    .g2(g[2]), 
    .p3(p[3]), 
    .g3(g[3]),
    .p4(p[4]), 
    .g4(g[4]), 
    .ci0(1'b0), 
    .co(c[5])
);
// Slice 5
CLA_carry_logic_5 cl5 (
    .p0(p[0]), 
    .g0(g[0]), 
    .p1(p[1]), 
    .g1(g[1]), 
    .p2(p[2]), 
    .g2(g[2]), 
    .p3(p[3]), 
    .g3(g[3]),
    .p4(p[4]), 
    .g4(g[4]),
    .p5(p[5]), 
    .g5(g[5]), 
    .ci0(1'b0), 
    .co(c[6])
);
// Slice 6
CLA_carry_logic_6 cl6 (
    .p0(p[0]), 
    .g0(g[0]), 
    .p1(p[1]), 
    .g1(g[1]), 
    .p2(p[2]), 
    .g2(g[2]), 
    .p3(p[3]), 
    .g3(g[3]),
    .p4(p[4]), 
    .g4(g[4]),
    .p5(p[5]), 
    .g5(g[5]),
    .p6(p[6]), 
    .g6(g[6]), 
    .ci0(1'b0), 
    .co(c[7])
);
// Slice 7
CLA_carry_logic_7 cl7 (
    .p0(p[0]), 
    .g0(g[0]), 
    .p1(p[1]), 
    .g1(g[1]), 
    .p2(p[2]), 
    .g2(g[2]), 
    .p3(p[3]), 
    .g3(g[3]),
    .p4(p[4]), 
    .g4(g[4]),
    .p5(p[5]), 
    .g5(g[5]),
    .p6(p[6]), 
    .g6(g[6]),
    .p7(p[7]), 
    .g7(g[7]), 
    .ci0(1'b0), 
    .co(c[8])
);
endmodule

//------------ 5. Simulate and verify your 8-bit CLA-----------


//(testbench)


//------- 6. Modify 8-bit CLA to 8-bit CLA with OVF and UVF detection------

module cla_8bit_ovf_uvf (
input logic [7:0] a,
input logic [7:0] b,
output logic [7:0] sum,
output logic ovf, uvf
);

logic [8:0] cla_sum; //from cla_8-bit tb
cla_8bit dut (
    .a(a),
    .b(b),
    .sum(cla_sum)
);
assign sum = cla_sum[7:0]; 
assign ovf = (~a[7] & ~b[7] &  cla_sum[7]); //if both inputs are positive but result = negative then ovf
assign uvf = ( a[7] &  b[7] & ~cla_sum[7]); ///if both inputs are negative but result = positive then uvf
endmodule




//------------ 7. Add saturation mechanism----------

module cla_8bit_sat_out (
input logic [7:0] a,
input logic [7:0] b,
output logic [7:0] sum,
output logic ovf, uvf
);
//
endmodule

//testbecnh, another file



