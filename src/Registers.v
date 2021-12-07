/*
	REGISTERS.V

	CONTRIBUTION: AIDAN, SEAN, FATIMA

*/
module Registers(
	clock,
	reset,
	ra,
	rb,
	writeReg,
	writeData,
	regWrite,
	readData1,
	readData2);
	
	input					clock;
	input					reset;
	input [1:0]			ra;
	input [1:0]			rb;
	input [1:0]			writeReg;
	input	[7:0]			writeData;
	input					regWrite;
	
	output wire [7:0]	readData1;
	output wire [7:0]	readData2;
	
	//LOCAL REGISTERS
	reg [7:0] 		register [0:3];
	
	assign readData1 = register[ra];
	assign readData2 = register[rb];
		
	initial begin
	
		for(integer i = 0; i < 4; i = i + 1)
			register[i] = 8'b0;
	
	end
	
	always@(posedge clock or posedge reset) begin
		
		if (reset) begin
			for(integer i = 0; i < 4; i = i + 1)
					register[i] = 8'b0;
		end
		
		else if (regWrite) begin
			
				register[writeReg] = writeData; 
			
		end
	
	end
endmodule