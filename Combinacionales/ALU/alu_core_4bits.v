module alu_core_4bits(CI,SEL,A,B,R,CO,OV,Z,S);
input [3:0] A, B; //INPUT A,B
input [3:0] SEL; //SELECT
input CI; //CARRY IN
output reg [3:0] R; //RESULT
output reg CO; //CARRY OUT
output reg OV; //OVERFLOW
output Z; //ZERO
output S; //SIGN
always @(CI,A,B,SEL)
begin
casex (SEL)
4'bx000: begin
{CO, R} = (A + B);
OV = (~R[3]&A[3]&B[3])|(R[3]&~A[3]&~B[3]) ;
end
4'bx001:begin
{CO, R} = (A - B);
OV = (~R[3]&A[3]&~B[3])|(R[3]&~A[3]&B[3]);
end
4'bx010:begin
{CO, R} = (A + B + CI);
OV = (~R[3]&A[3]&B[3])|(R[3]&~A[3]&~B[3]);
end
4'bx011:begin
{CO, R} = A - B - CI;
OV = (~R[3]&A[3]&~B[3])|(R[3]&~A[3]&B[3]);
end
4'b0100:begin
R = A & B; // AND
CO = 1'b0;
OV = 1'b0;
end
4'b0101:begin
R = A | B; // OR
CO = 1'b0;
OV = 1'b0;
end
4'b0110:begin
R = A ^ B; // XOR
CO = 1'b0;
OV = 1'b0;
end
4'b1100:begin
R = ~(A & B); // NAND
CO = 1'b0;
OV = 1'b0;
end
4'b1101:begin
R = ~(A | B); // NOR
CO = 1'b0;

OV = 1'b0;
end
4'b1110:begin
R = ~(A ^ B); // XNOR
CO = 1'b0;
OV = 1'b0;
end
4'bx111:begin
R = ~B; // NOT
CO = 1'b1; // PARA ALGUNAS ALU COMO AVR
OV = 1'b0;
end
endcase
end
assign S = R[3] ^ OV; // SIGN = R[3] XOR OVERFLOW
assign Z = (R == 4'b0)? 1'b1: 1'b0; // ZERO = 0 SOLO SI R = 0
endmodule