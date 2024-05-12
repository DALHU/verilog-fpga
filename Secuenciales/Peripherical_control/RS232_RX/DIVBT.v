module DIVBT (CLK, RESET, Z);
	parameter SIZE = 16; //implementacion 
	parameter K = 16'd5625; //implementacion BAUD 4800 a CLK de 27MHz
	//parameter SIZE = 2; //simulacion active
	//parameter K = 2’d3; //simulacion active
	output Z;
	input CLK, RESET;
	wire [SIZE-1:0] COUNTER;
	counter_down_h #(SIZE) CDH(COUNTER, Z, K, CLK, RESET, Z);	
endmodule
