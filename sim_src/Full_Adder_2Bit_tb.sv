`timescale 1ns / 1ns

module Full_Adder_2Bit_tb();

reg [4:0] Data;
reg [1:0] num1, num2;
reg Carry;
wire [1:0] s;
wire overflow;

Full_Adder_2Bit Full_Adder_2Bit_inst (.A(num1), .B(num2), .C_in(Carry), .S(s), .C_out(overflow));


initial begin 
    Data = 5'h00;
    num1 = 2'b00;
    num2 = 2'b00;
    Carry = 1'b0;

    for (int i=0; i<32; i=i+1) begin
        #20 Data = Data+1'b1;
        num1 = Data[1:0];
        num2 = Data[3:2];
        Carry = Data[4];
    end
    #20 $finish;
end


endmodule
