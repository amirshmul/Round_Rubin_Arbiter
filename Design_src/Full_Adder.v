`timescale 1ns / 1ns

module Full_Adder(
    input a, b, c_in,
    output s, c_out
    );
    
    assign s = a^b^c_in;
    assign c_out = a&b | c_in&(a^b);
    // This is good for the practise, but ofcourse we are using the "+" operator in such a case...
    
endmodule
