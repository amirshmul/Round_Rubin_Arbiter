`timescale 1ns / 1ns

module Static_RR(
    input clk, rst,
    input [3:0] Priority_bus,
    // For the block to be complete, another input is missing here, "input arbitration_ack",
    // Only when you get this signal you can show the next "winner", in other words, hold "next_priority" output stable until you get arbitration_ack,
    // How would it impact your block?
    output [1:0] Next_priority,
    output Data_Valid
);

reg [1:0]  prev_Priority;
wire [1:0] Shift_val; 
wire [3:0] Shifted_Bus;
wire [1:0] Shifted_Priority;

/*output value = 3 - prev priority*/
Full_Adder_2Bit Full_Adder_2Bit_inst1 (.A(2'b11), .B(~prev_Priority), .C_in(1'b1), .S(Shift_val), .C_out());
    // This is a very complicated way to write: assign shift_val = 3 - prev_priority;
    // While what I think you really want is shift_val = prev_periority + 1; no?
    
/*Shift Ring for shifting the table around*/
CC_Shift_Ring CC_Shift_Ring_inst (.In_Bus(Priority_bus), .Shift(Shift_val), .Out_Bus(Shifted_Bus));
/*LSB priority encoder*/
LSB_Priority_Encoder LSB_Priority_Encoder_inst (.In_Bus(Shifted_Bus), .Priority(Shifted_Priority), .valid(Data_Valid));
/*final correction result = 1+prev_priority+shifted_priority*/
Full_Adder_2Bit Full_Adder_2Bit_inst2 (.A(Shifted_Priority), .B(prev_Priority), .C_in(1'b1), .S(Next_priority), .C_out());

always @(posedge clk) begin
    prev_Priority = (rst==1'b1)? 2'b00: Next_priority; // here you should use the non-blocking assignment "<="
    // What happens in cycles where priority_bus is 0?
end
    // What is the difference between asyncronic and syncronic reset? How would you write a async reset flop here?
    

endmodule
