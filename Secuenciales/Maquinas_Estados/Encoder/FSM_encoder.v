module FSM_encoder(RST,CLK,A,B,OPC);
	input CLK,RST;
	input A,B;
	output reg [1:0] OPC;
	reg [3:0] Qp;
	wire [1:0] AB;
	assign AB = {A,B};
	always @(posedge RST or posedge CLK)
		begin
		if (RST)
			begin
			Qp <= 0;
			end
		else
			begin
			// Estado de Error es el 13
				case (Qp)
				0: begin 
					case (AB)
					0: Qp<=4; 1: Qp<=3; 2: Qp<=1; 3: Qp<=2;
					endcase
					end
				1: begin 
					case (AB)
					0: Qp<=9; 1: Qp<=13; 2: Qp<=1; 3: Qp<=5;
					endcase
					end
				2: begin
					case (AB)
					0: Qp<=13; 1: Qp<=6; 2: Qp<=12; 3: Qp<=2;
					endcase
					end
				3: begin
					case (AB)
					0: Qp<=7; 1: Qp<=3; 2: Qp<=13; 3: Qp<=11;
					endcase
					end
				4: begin 
					case (AB)
					0: Qp<=4; 1: Qp<=10; 2: Qp<=8; 3: Qp<=13;
					endcase
					end
				5: begin 
					Qp<=2; 
					end
				6: begin 
					Qp<=3; 
					end	
				7: begin 
					Qp<=4; 
					end
				8: begin 
					Qp<=1; 
					end
				9: begin 
					Qp<=4; 
					end
				10: begin 
					Qp<=3;
					end	
				11: begin 
					Qp<=2; 
					end	
				12: begin 
					Qp<=1; 
					end	
				13: begin 
					Qp<=13; //Se queda en estado error
					end
			   default: begin
					Qp<=13; //Se queda en estado error
					end
				endcase
				end
				end
				
	always @(Qp)
			begin
			case (Qp)
				0: begin OPC=2'b11; //error=1'b0;
					end
				1: begin OPC=2'b00; //error=1'b0;
					end
				2: begin OPC=2'b00; //error=1'b0;
					end
				3: begin OPC=2'b00; //error=1'b0;
					end
				4: begin OPC=2'b00; //error=1'b0;
					end
				5: begin OPC=2'b01; //error=1'b0;
					end
				6: begin OPC=2'b01; //error=1'b0;
					end	
				7: begin OPC=2'b01; //error=1'b0;
					end
				8: begin OPC=2'b01; //error=1'b0;
					end
				9: begin OPC=2'b10; //error=1'b0;
					end
				10: begin OPC=2'b10; //error=1'b0;
					end	
				11: begin OPC=2'b10; //error=1'b0;
					end	
				12: begin OPC=2'b10; //error=1'b0;
					end	
				default: begin OPC=2'bZZ;	//error=1'b1;
					end					
				endcase
end

endmodule
