/*
	DATAMEMORY.V

	CONTRIBUTION: AIDAN, SEAN, FATIMA

*/
module DataMemory(
	clock,
	reset,
	ALUResult,
	dataWrite,
	memWrite,
	memRead,
	readData);
	
	input					clock;
	input					reset;
	input [7:0]			ALUResult;
	input [7:0]			dataWrite;
	input					memWrite;
	input					memRead;
	
	output wire [7:0]	readData;
	
	reg [7:0]			dataMemory [0:255];
	
	initial begin
	
		for(integer i = 0; i < 256; i = i + 1)
			dataMemory[i] = 8'b0;
	
	end
	
	assign readData = dataMemory[ALUResult];	
	
	always@(posedge clock or posedge reset) begin
	
	if (reset) begin
	
		for(integer i = 0; i < 256; i = i + 1)
				dataMemory[i] = 8'b0;
				
	end
	
	else if (memWrite) begin 
			dataMemory[ALUResult] = dataWrite;
		end
	end
endmodule 