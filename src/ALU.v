/*
	ALU.V

	CONTRIBUTION: AIDAN, SEAN, FATIMA

*/
module ALU(
	clock,
	readData1,
	ALUInput2,
	ALUOP,
	inPort,
	ALUResult,
	zero,
	negative,
	outPort);
	
	input clock;
	input [7:0]	readData1;
	input [7:0] ALUInput2;
	input [3:0] ALUOP;
	input [7:0]	inPort;
	
	output reg [7:0]	ALUResult;
	output reg 			zero;
	output reg			negative;
	output reg [7:0]	outPort;
	
	
	always@(*) begin
	
		case(ALUOP)
	
			4'b0000: //NOP
				begin
					//DO NOTHING
				end
			
			4'b0001: //ADD
				begin
				
					ALUResult = readData1 + ALUInput2;
				
				end
			
			4'b0010: //SUB
				begin
				
					ALUResult = readData1 - ALUInput2;
				
				end
			
			4'b0011: //NAND
				begin
				
					ALUResult = ~(readData1 & ALUInput2);
					
				
				end
			
			4'b0100: //SHL
				begin
				
					ALUResult = readData1 << 1;

				end
			
			4'b0101: //SHR
				begin
			
					ALUResult = readData1 >> 1;
					
				end
			
			4'b0111: //IN
				begin
			
					ALUResult = inPort;
				
				end
			
			4'b1000: //MOV
				begin
			
					ALUResult = ALUInput2;
			
				end
			
			
			4'b1001: //BR
				begin
					
					//DO NOTHING
					
				end
			
			4'b1010: //BR.C
				begin
					
					//DO NOTHING
					
				end
			
			4'b1011: //BR.SUB
				begin
					
					//DO NOTHING
					
				end
			
			4'b1100: //RETURN
				begin
					
					//DO NOTHING
					
				end
			
			4'b1101: //LOAD
				begin
			
					ALUResult = ALUInput2;
			
				end
			
			4'b1110: //STORE
				begin
			
					ALUResult = ALUInput2;
			
				end
			
			4'b1111: //LOADIMM
				begin
			
					ALUResult = ALUInput2;
			
				end
	
		endcase
	end
	
	always@(posedge clock) begin
	
		case(ALUOP)
		
			4'b0110: //OUT
			begin
		
				outPort = readData1;
			
			end
			4'b0001: //ADD
				begin
				
					zero = (ALUResult == 0);
				
					negative = ALUResult[7];
				
				end
			
			4'b0010: //SUB
				begin
				
					zero = (ALUResult == 0);
				
					negative = ALUResult[7];
				
				end
			
			4'b0011: //NAND
				begin
				
					zero = (ALUResult == 0);
				
					negative = ALUResult[7];
						
				end
			
			4'b0100: //SHL
				begin
				
					zero = readData1[7];

				end
			
			4'b0101: //SHR
				begin
			
					zero = readData1[0];
					
				end
			
		endcase
		
	end

endmodule