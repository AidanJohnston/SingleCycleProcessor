/*
	INSTRUCTIONMEMORY.V

	CONTRIBUTION: AIDAN, SEAN, FATIMA

*/
module InstructionMemory(
	pcAddress,
	instruction);

	input [7:0]			pcAddress;
	
	output reg [15:0]	instruction;
	
	reg [7:0] insturctionMemory [0:255];
	

	initial begin
		
		//PUT INSTRUCTION FROM subroutine.coe INTO INSTRUCTION MEMORY
		$readmemb("subroutine.coe", insturctionMemory);
	
	end
	
	
	always@(*) begin
	
		instruction[7:0] <= insturctionMemory[pcAddress];
		instruction[15:8] <= insturctionMemory[pcAddress + 1];
	
	end

endmodule