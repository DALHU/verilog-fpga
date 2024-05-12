module encoder(RST,CLK,A,B,SEG7);
	input CLK,RST;
	input A,B;
	output[6:0] SEG7;
	wire [1:0] OPC;
	wire A, B;
	wire [3:0] COUNTER;
    FSM_encoder FSM1(RST,CLK,A,B,OPC); // Maquina de Estados
	counter_OPC COUNTER1(RST, CLK, OPC, COUNTER,  Z); //Contador con OPC
	hex_7s HEX7S(COUNTER,SEG7); //Hexadecimal a Siete Segmentos
endmodule
