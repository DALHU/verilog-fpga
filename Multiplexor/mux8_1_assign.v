module mux8_1_assign (
input [7:0] I0,I1,I2,I3,I4,I5,I6,I7,
input [2:0] S,
output [7:0] O
);
assign O = S[2]?(S[1]?(S[0]?I7:I6):(S[0]?I5:I4)):
(S[1]?(S[0]?I3:I2):(S[0]?I1:I0));
endmodule