`timescale 1ns/1ps

module cla_debug_tb;
    logic [7:0] a;
    logic [7:0] b;
    logic [8:0] sum;

    // DUT
    cla_8bit dut_cla(
        .a(a),
        .b(b),
        .sum(sum)
    );

    logic [8:0] expected;

    initial begin
        $dumpfile("cla_debug.vcd");
        $dumpvars(0, cla_debug_tb);

        $display("Starting CLA debug test...");

        // Case 1
        a = 3; b = 5; #20;
        expected = a + b;
        $display("a=%0d (%08b)  b=%0d (%08b)", a, a, b, b);
        $display("p=%08b g=%08b c=%09b sum=%09b (dec=%0d) expected=%09b",
                 dut_cla.p, dut_cla.g, dut_cla.c, sum, sum, expected);

        // Case 2
        a = 7; b = 7; #20;
        expected = a + b;
        $display("a=%0d (%08b)  b=%0d (%08b)", a, a, b, b);
        $display("p=%08b g=%08b c=%09b sum=%09b (dec=%0d) expected=%09b",
                 dut_cla.p, dut_cla.g, dut_cla.c, sum, sum, expected);

        // Case 3
        a = 0; b = 0; #20;
        expected = a + b;
        $display("a=%0d (%08b)  b=%0d (%08b)", a, a, b, b);
        $display("p=%08b g=%08b c=%09b sum=%09b (dec=%0d) expected=%09b",
                 dut_cla.p, dut_cla.g, dut_cla.c, sum, sum, expected);

        $finish;
    end
endmodule
