`timescale 1ns / 1ns

module LSB_Priority_Encoder_tb();

reg [3:0] Bus;
wire [1:0] prty;
wire val;

LSB_Priority_Encoder LSB_Priority_Encoder_inst (.In_Bus(Bus), .Priority(prty), .valid(val));


initial begin
    Bus = 4'h0;
    for(int i=0; i<16; i=i+1) begin
    #20 Bus = Bus+1'b1;
    end
    #20 $finish;
end









endmodule
