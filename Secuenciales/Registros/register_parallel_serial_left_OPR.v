module register_parallel_serial_left_OPR (data_in,OPR,l,clock,reset,data_out);
input [3:0] data_in;
input [1:0] OPR;
input l; //entrada de desplazamiento
input clock, reset;
output data_out;
reg [3:0] data_reg;
assign data_out = data_reg[3];
always @ (posedge clock or negedge reset)
if (reset == 1'b0)
data_reg <= 4'b0;
else
case (OPR)
0: data_reg <= data_reg; //hold
1: data_reg <= data_in; //load
2: data_reg <= {data_reg[2:0], l}; //left shift
3: data_reg <= 4'b0; //clear
endcase
endmodule