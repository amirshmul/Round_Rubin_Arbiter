`timescale 1ns / 1ns

module CC_Shift_Ring_tb();

reg [3:0] Data;
reg [1:0] Shifter;
wire [3:0] Data_out;

CC_Shift_Ring CC_Shift_Ring_inst (.In_Bus(Data), .Shift(Shifter), .Out_Bus(Data_out));

initial begin 
    Data = 4'h0;
    Shifter = 2'b00;
    #20 Data = 4'b1000;
    for (int i=0; i<3; i=i+1) begin
        #20 Shifter += 1'b1;
    end
    #20 $finish;
end

endmodule
