module TXRS232 (CLK,RST,D,STT,Tx,EOT);
	input CLK, RST;	
	input [7:0] D;
	input STT;
	output reg Tx;
	output EOT;
	
	wire [3:0] M;
	wire B;
	wire P;
	
	assign P = D[0]^D[1]^D[2]^D[3]^D[4]^D[5]^D[6]^D[7]; //PARIDAD
	
	always @(D,P,M)
		begin
		case (M)
			0: Tx = 1;
			1: Tx = 1;
			2: Tx = 0;
			3: Tx = D[0];
			4: Tx = D[1];
			5: Tx = D[2];
			6: Tx = D[3];
			7: Tx = D[4];
			8: Tx = D[5];
			9: Tx = D[6];
			10: Tx = D[7];
			11: Tx = P;
			//12: Tx = 1;
			default: Tx =1 ;
		endcase
		end
		
	FSM_232 FSM(B,RST,STT,M, EOT); //MAQUINA DE ESTADO 
	DIVBT DIV8333(CLK,RST,B); //DIVISOR DE FRECUENCIA

endmodule
