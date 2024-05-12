module register_async(data_in,hold,clock,reset,data_out);
input [3:0] data_in;
input hold;
input clock, reset;
wire clock_wire;
output reg [3:0] data_out;
assign clock_wire = clock & hold;
always @ (posedge clock_wire or negedge reset)
if (reset == 1'b0)
data_out <= 4'b0;
else
data_out <= data_in;
endmodule