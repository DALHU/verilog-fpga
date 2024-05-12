module register_shift_left (data_in,data_out,clock,reset,h);
input data_in,clock,reset,h;
//input data_out;
output data_out;
reg [3:0] data_reg;
assign data_out = data_reg[3];
always @(negedge reset or posedge clock)
if (reset == 1'b0)
data_reg <= 4'b0;
else if (h)
data_reg <= {data_reg[2:0],data_in}; //corrimiento de bits
else
data_reg <= data_reg;
endmodule