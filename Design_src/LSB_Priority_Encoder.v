`timescale 1ns / 1ns

module LSB_Priority_Encoder(
    input [3:0] In_Bus,
    output reg [1:0] Priority,
    output reg valid
    );

    always @(In_Bus) begin: Priority_Comb
        casez(In_Bus)
            4'b???1: begin
                valid <= 1'b1; // Use blocking assignment
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
    
//    Generally speaking, 
//1. It is best to avoid the use of casex/casez if not necessary.
//2. On the other hand, try to use SystemVerilog Priority/Unique cases when possible.
//3. Never ever use Verilog obsolete "full_case" "parallel_case".

//casex/casez:
//http://www.verilogpro.com/verilog-case-casez-casex/ 
//unique/priority:
//https://www.verilogpro.com/systemverilog-unique-priority/  
//"full_case parallel_case", the Evil Twins of Verilog Synthesis:
//http://www.sunburst-design.com/papers/CummingsSNUG1999Boston_FullParallelCase_rev1_1.pdf 


    // How would you write a generic design here? (input width "W_DATA")?
    
endmodule
