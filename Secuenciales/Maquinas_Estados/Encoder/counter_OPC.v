module counter_OPC (RESET, CLK, OPC, COUNTER,  Z);
		parameter SIZE = 4;	
		//input [SIZE-1:0] K;
		output [SIZE-1:0] COUNTER;
		output Z;
		input CLK, RESET;
		input [1:0] OPC;
		reg [SIZE-1:0] COUNTER;
		assign Z = (COUNTER ==0)? 1'b1 : 1'b0; //bandera zero
		always @(posedge CLK or posedge RESET)
			if (RESET)
				COUNTER = {SIZE{1'b0}};	 
			else
				case (OPC)
					0: COUNTER <= COUNTER;
					1: COUNTER <= COUNTER + 1'b1;
					2: COUNTER <= COUNTER - 1'b1;
					3: COUNTER <= 4'b0;			
				endcase			
endmodule
