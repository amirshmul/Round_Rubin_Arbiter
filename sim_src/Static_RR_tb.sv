`timescale 1ns / 1ns

module Static_RR_tb();

reg Clk, Rst;
reg [3:0] Interrupts;
wire [1:0] Priority;
wire Valid;

Static_RR Static_RR_inst (.clk(Clk), .rst(Rst), .Priority_bus(Interrupts), .Next_priority(Priority), .Data_Valid(Valid)); 


always #10 Clk=!Clk;
initial begin
    Clk=1'b0;
    Rst=1'b1;
    Interrupts=4'h0;
    #30;
    Rst=1'b0;
    for (int i=0; i<15; i=i+1) begin
    #20 Interrupts = Interrupts+1'b1;
    end
    
    #80 $finish;   
end
endmodule
