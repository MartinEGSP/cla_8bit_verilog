//------------ 5. Simulate and verify your 8-bit CLA-----------
`timescale 1ns / 1ps // interpret time units

module cla_8bit_tb;
    logic [7:0] a; // can not handle negative numbers
    logic [7:0] b;
    logic [8:0] sum;

    // Instantiate the Device Under Test (DUT)
    cla_8bit dut_cla(
        .a(a),
        .b(b),
        .sum(sum)
    );

    logic [8:0] expected; // put this at module scope

    initial begin
        $display("Starting Testbench step 5");
        
        // VCD dump for GTKWave
        $dumpfile("cla_8bit.vcd");
        $dumpvars(0, cla_8bit_tb);
        
        // Apply test vectors
        for (int x = 0; x <= 7; x++) begin
            for (int y = 0; y <= 7; y++) begin
                a = x;
                b = y;
                #20; // allow time for propagation

                expected = a + b;

                $display("a=%02d (%08b)  b=%02d (%08b)  sum=%02d (%09b)  expected=%02d (%09b)  c=%09b",
                         a, a, b, b, sum, sum, expected, expected, dut_cla.c);

                if (sum !== expected) begin
                    $display("MISMATCH: a=%0d b=%0d  sum=%09b  expected=%09b",
                             a, b, sum, expected);
                end
            end
        end

        $display("Test completed");
        $finish;
    end
endmodule