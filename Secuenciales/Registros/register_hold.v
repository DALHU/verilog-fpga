module register_hold (data_in,hold,clock,reset,data_out);
input [3:0] data_in;
input hold;
input clock, reset;
output [3:0] data_out;
reg [3:0] data_out;
always @ (posedge clock or negedge reset)
if (reset == 1'b0)
data_out <= 4'b0;
else if (hold)
data_out <= data_in;
else
data_out <= data_out;
endmodule