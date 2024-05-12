module RXRS232 (CLK,RST,Rx,EOR,D,DVD);
	parameter SIZE = 16;
	parameter K = 16'd5625;
	input CLK, RST;	
	input Rx;
	output [7:0] D;
	output EOR,DVD;
	
	
	reg Rx_t,Rx_sync;
	
	wire S,EOR;
	wire BT;
	wire P;
		
	always @(posedge CLK or posedge RST)
		begin
		if (RST)
			begin
			Rx_t <= 1;
			Rx_sync <= 1;
			end
		else
			begin
			Rx_t <= Rx;
			Rx_sync <=Rx_t;
			end
		end
	
	register_serial_parallel_right RSPR1(Rx_sync,{P,D},BT,RST,S);
	FSM_RX_232 FSM_RX(BT,RST,Rx_sync,S,EOR);
	DIVBT #(SIZE,K) DIVBT1(CLK, RST, BT); //baud 4800
	//DIVBT #(4,8) DIVBT1(CLK, RST, BT); //simulacion
	
	assign DVD = ~(P^D[0]^D[1]^D[2]^D[3]^D[4]^D[5]^D[6]^D[7]);
	
endmodule
