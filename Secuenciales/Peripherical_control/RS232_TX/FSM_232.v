module FSM_232(CLK,RST,STT,Qp, EOT);
	input CLK,RST;
	input STT; //COMIENZO DE LA TRANSMISION
	output reg EOT; //FIN DE LA TRANSMISION
	output reg [3:0] Qp;
	always @(posedge CLK or posedge RST)
		begin
		if (RST)
		Qp <= 0; //START O STOP
		else
		case (Qp)
		0: Qp <= (STT)? 1:0; 
		1,2,3,4,5,6,7,8,9,10: Qp <= Qp + 1;
		11: Qp <= 0; 
		default: Qp <=0;
		endcase
		end
	always @(Qp)
		begin 
		case (Qp) 
		0,12,13,14,15: EOT = 1;
		default: EOT = 0;
		endcase
		end	   
endmodule
