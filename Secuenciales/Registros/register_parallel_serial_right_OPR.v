module register_parallel_serial_right_OPR (data_in,OPR,r,clock,reset,data_out);
input [3:0] data_in;
input [1:0] OPR;
input r;//entrada de desplazamiento
input clock, reset;
output data_out;
reg [3:0] data_reg;
assign data_out = data_reg[0];
always @ (posedge clock or negedge reset)
if (reset == 1'b0)
data_reg <= 4'b0;
else
case (OPR)
0: data_reg <= data_reg; //hold
1: data_reg <= data_in; //load
2: data_reg <= {r, data_reg[3:1]}; //right shift
3: data_reg <= 4'b0; //clear
endcase
endmodule