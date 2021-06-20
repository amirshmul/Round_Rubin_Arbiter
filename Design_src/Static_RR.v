`timescale 1ns / 1ns

module Static_RR(
    input clk, rst,
    input [3:0] Priority_bus,
    output [1:0] Next_priority,
    output Data_Valid
);

reg [1:0]  prev_Priority;
wire [1:0] Shift_val; 
wire [3:0] Shifted_Bus;
wire [1:0] Shifted_Priority;

/*output value = 3 - prev priority*/
Full_Adder_2Bit Full_Adder_2Bit_inst1 (.A(2'b11), .B(~prev_Priority), .C_in(1'b1), .S(Shift_val), .C_out());
/*Shift Ring for shifting the table around*/
CC_Shift_Ring CC_Shift_Ring_inst (.In_Bus(Priority_bus), .Shift(Shift_val), .Out_Bus(Shifted_Bus));
/*LSB priority encoder*/
LSB_Priority_Encoder LSB_Priority_Encoder_inst (.In_Bus(Shifted_Bus), .Priority(Shifted_Priority), .valid(Data_Valid));
/*final correction result = 1+prev_priority+shifted_priority*/
Full_Adder_2Bit Full_Adder_2Bit_inst2 (.A(Shifted_Priority), .B(prev_Priority), .C_in(1'b1), .S(Next_priority), .C_out());

always @(posedge clk) begin
    prev_Priority = (rst==1'b1)? 2'b00: Next_priority;
end

endmodule
