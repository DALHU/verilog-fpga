`timescale 10ns / 1ps
module tb_mux8_1_assign();
reg I0,I1,I2,I3,I4,I5,I6,I7;
reg [2:0] S;
integer k,j;
wire O;
mux8_1_assign U1(I0,I1,I2,I3,I4,I5,I6,I7,S,O);
initial
begin
fork
begin
I0 =1; I1=1; I2=1; I3=1; I4 =0; I5=0; I6=0; I7=0;
for (j=0;j<256;j++)
begin

#3 I0=I0+1;#2 I4=~I0;
#3 I1=I1+1;#2 I5=~I1;
#3 I2=I2+1;#2 I6=~I2;
#3 I3=I3+1;#2 I7=~I3;
end
end
begin
S = 0; #3;
for (k=0;k<256;k++)
begin
#20 S=S+1;
end
end
join
end
endmodule