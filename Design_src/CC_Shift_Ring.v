`timescale 1ns / 1ns

module CC_Shift_Ring(
    input  [3:0] In_Bus,
    input  [1:0] Shift,
    output reg [3:0] Out_Bus
);

always @(Shift or In_Bus) begin: Shift_comb
    case(Shift)
    2'b00: Out_Bus <= In_Bus;
    2'b01: Out_Bus <= {In_Bus[2:0],In_Bus[3]};
    2'b10: Out_Bus <= {In_Bus[1:0],In_Bus[3:2]};
    2'b11: Out_Bus <= {In_Bus[0],In_Bus[3:1]};
    default: Out_Bus <= In_Bus;
    endcase
end
endmodule
