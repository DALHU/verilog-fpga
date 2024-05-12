module register (data_in,clock,reset,data_out);
input [3:0] data_in;
input clock, reset;
output [3:0] data_out;
reg [3:0] data_out;
always @ (posedge clock or negedge reset)
if (reset == 1'b0)
data_out <= 4'b0;
else
data_out <= data_in;
endmodule