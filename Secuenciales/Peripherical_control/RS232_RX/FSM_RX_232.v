module FSM_RX_232(CLK,RST,Rx,S,EOR);
	input CLK,RST;
	input Rx;
	output reg S;
	output reg EOR;
	reg [3:0] Qp;

	always @(posedge CLK or posedge RST)
		begin
		if (RST)
		Qp <= 0;
		else
		case (Qp)
		0,11: Qp <= (Rx)? 0:1;
		1,2,3,4,5,6,7,8,9,10: Qp <=  (Qp + 1);
		//11: Qp <= 0;
		default: Qp <= 0;
		endcase
		end

	always @(Qp)
		begin
		case (Qp)
		0: begin EOR=1; S=0;end
		1,2,3,4,5,6,7,8,9: begin EOR=0; S=1;end
		default: begin EOR=1; S=0;end
		endcase
		end
endmodule
