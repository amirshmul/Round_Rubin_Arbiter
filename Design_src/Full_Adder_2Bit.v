`timescale 1ns / 1ns

module Full_Adder_2Bit(
    input [1:0] A, B,
    input C_in,
    output [1:0] S,
    output C_out
);

wire Carry;

Full_Adder Full_Adder_inst1(.a(A[0]), .b(B[0]), .c_in(C_in), .s(S[0]), .c_out(Carry));
Full_Adder Full_Adder_inst2(.a(A[1]), .b(B[1]), .c_in(Carry), .s(S[1]), .c_out(C_out));

endmodule