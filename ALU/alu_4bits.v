module alu_4bits(CI,SEL,A,B,R7S,CO,OV,Z,S);
input [3:0] A, B; //INPUT A,B
input [3:0] SEL; //SELECT
input CI; //CARRY IN
wire [3:0] R; //RESULT
B[3..0]
A[3..0]

R[3..0]

Co OV S Z
S[3..0]

RS7[6..0]

Hex_7s.v
alu_core_4bit.v

alu_4bits.v

Ci

output [6:0] R7S; //RESULT EN 7SEGMENTOS
output CO; //CARRY OUT
output OV; //OVERFLOW
output Z; //ZERO
output S; //SIGN
alu_core_4bits ALU (CI,SEL,A,B,R,CO,OV,Z,S);
hex_7s HEX7S (R,R7S) ;
endmodule