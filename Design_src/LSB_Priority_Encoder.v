`timescale 1ns / 1ns

module LSB_Priority_Encoder(
    input [3:0] In_Bus,
    output reg [1:0] Priority,
    output reg valid
    );

    always @(In_Bus) begin: Priority_Comb
        casez(In_Bus)
            4'b???1: begin
                valid <= 1'b1;
                Priority <= 2'b00;
                end
                
            4'b??10: begin
                valid <= 1'b1;
                Priority <= 2'b01;
                end
                
            4'b?100: begin
                valid <= 1'b1;
                Priority <= 2'b10;
                end
                
             4'b1000: begin
                valid <= 1'b1;
                Priority <= 2'b11;
                end
                
            default: begin
                valid <=1'b0;
                Priority <= 2'b00;
                end
        endcase
    end
    
endmodule
