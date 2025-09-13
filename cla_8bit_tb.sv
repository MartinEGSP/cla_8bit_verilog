//------------ 5. Simulate and verify your 8-bit CLA-----------
`timescale 1ns / 1ps // interpret time units

module cla_8bit_tb;
logic [7:0] a; //can not handle negative numbers
logic [7:0] b;
logic [8:0] sum;

// Instantiate the Device Under Test (DUT)
cla_8bit dut_cla(
    .a(a),
    .b(b),
    .sum(sum)
);

initial begin
    $display("Starting Testbench step 5");
    
    //Apply test vectors
    for (int x = 0; x <= 7; x++)
    begin
        for (int y = 0; y <= 7; y++) 
        begin
            a = x;
            b = y;
            #5; //signals propagate
            $display("a = %0d, b = %0d, sum = %0d", a, b, sum);
        end
    end
    $display("Test completed");
    $stop;
end

endmodule
