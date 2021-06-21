`timescale 1ns / 1ns
// Some general coding style remarks:
// Name of module Capital latters with no "_" in this example "CcShiftRing"
// No capital letters in signals names, only lower-case with _, for example "in_bus"

module CC_Shift_Ring(
    input  [3:0] In_Bus,
    input  [1:0] Shift,
    output reg [3:0] Out_Bus
);

  always @(Shift or In_Bus) begin: Shift_comb // in SystemVerilog (SV) we can use always_comb instead of always @(signals list)
    case(Shift)
        2'b00: Out_Bus <= In_Bus; // Combintorical logic should use "blocking" assignments ("=" and not "<=") see more details here: http://cs.haifa.ac.il/courses/verilog/1996-CUG-presentation_nonblocking_assigns.pdf
        
    2'b01: Out_Bus <= {In_Bus[2:0],In_Bus[3]};
    2'b10: Out_Bus <= {In_Bus[1:0],In_Bus[3:2]};
    2'b11: Out_Bus <= {In_Bus[0],In_Bus[3:1]};
    default: Out_Bus <= In_Bus;
    endcase
end
    
    // In general, more generic and simple way to right a "shift" operation is by using ">>" (or ">>>") operators 
    // 1. what is the difference between the two?
    // 2. How would you write this block using ">>"/">>>" operator?
    // 3. How would you write this block to be "generic"? where the input/output vector width is "W_DATA"?
endmodule
