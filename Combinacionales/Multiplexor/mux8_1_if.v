module mux8_1_if (
input [7:0] I0,I1,I2,I3,I4,I5,I6,I7,
input [2:0] S,
output reg [7:0] O
);
always@(I0,I1,I2,I3,I4,I5,I6,I7,S)
begin
if (S[2])
begin
if (S[1])
begin
if (S[0]) O=I7;
else O=I6;
end
else
begin
if (S[0]) O=I5;
else O=I4;
end
end
else
begin
if (S[1])
begin
if (S[0]) O=I3;
else O=I2;
end
else
begin
if (S[0]) O=I1;
else O=I0;
end
end
end
endmodule