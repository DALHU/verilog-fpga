module counter_down_h (COUNTER, h, K, CLK, RESET, Z);
		parameter SIZE = 16; //implementacion
		//parameter SIZE = 2; //simulacion active                  
		input [SIZE-1:0] K;
		output [SIZE-1:0] COUNTER;
		output Z;
		input CLK, RESET;
		input h;
		reg [SIZE-1:0] COUNTER;
		assign Z = (COUNTER ==0)? 1’b1 : 1’b0; //bandera zero
		always @(posedge CLK or posedge RESET)
			if (RESET)
				COUNTER = {SIZE{1’b0}};	 
			else
				case (h)
					0: COUNTER <= COUNTER – 1’b1;
					1: COUNTER <= K;	
				endcase
				
endmodule
