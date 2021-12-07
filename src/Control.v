/*
	CONTROL.V

	CONTRIBUTION: AIDAN, SEAN, FATIMA

*/
module Control(
	instructionInput,
	regWrite,
	memWrite,
	useEA,
	ALUOP,
	memRead,
	linkSrc,
	memToReg,
	branchControl);
	
	
	input [3:0]			instructionInput;
	
	output reg			regWrite;
	output reg			memWrite;
	output reg			useEA;
	output reg [3:0]	ALUOP;
	output reg			memRead;
	output reg			linkSrc;
	output reg			memToReg;
	output reg [1:0]	branchControl;
	
	always@(*) begin
	
		ALUOP <= instructionInput;
	
		case(instructionInput)
			
			'b0000:	//NOP
				begin
					linkSrc <= 0;
					memWrite <= 0;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 0;
					useEA <= 0;
					branchControl <= 0;
				end
				
			4'b0001:	//ADD
				begin
					linkSrc <= 0;
					memWrite <= 0;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 1;
					useEA <= 0;
					branchControl <= 0;
				end	
			4'b0010:	//SUB
				begin
					linkSrc <= 0;
					memWrite <= 0;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 1;
					useEA <= 0;
					branchControl <= 0;
				end	
				
			4'b0011: //NAND
				begin
					linkSrc <= 0;
					memWrite <= 0;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 1;
					useEA <= 0;
					branchControl <= 0;
				end
				
			4'b0100: //SHL
				begin
					linkSrc <= 0;
					memWrite <= 0;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 1;
					useEA <= 0;
					branchControl <= 0;
				end
				
			4'b0101: //SHR
				begin
					linkSrc <= 0;
					memWrite <= 0;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 1;
					useEA <= 0;
					branchControl <= 0;
				end
				
			4'b0110: //OUT
				begin
					linkSrc <= 0;
					memWrite <= 0;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 0;
					useEA <= 0;
					branchControl <= 0;
				end
				
			4'b0111: //IN
				begin
					linkSrc <= 0;
					memWrite <= 0;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 1;
					useEA <= 0;
					branchControl <= 0;
				end	
				
			4'b1000: //MOV
				begin
					linkSrc <= 0;
					memWrite <= 0;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 1;
					useEA <= 0;
					branchControl <= 0;	
				end
				
			4'b1001: //BR
				begin
					linkSrc <= 1;
					memWrite <= 0;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 0;
					useEA <= 1;
					branchControl <= 0;
				end	
				
			4'b1010: //BR.C
				begin
					linkSrc <= 1;
					memWrite <= 0;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 0;
					useEA <= 1;
					branchControl <= 1;
				end
			4'b1011: //BR.SUB
				begin
					linkSrc <= 1;
					memWrite <= 0;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 0;
					useEA <= 1;
					branchControl <= 2;	
				end
				
			4'b1100: //RETURN
				begin
					linkSrc <= 1;
					memWrite <= 0;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 0;
					useEA <= 1;
					branchControl <= 3;
				end
				
			4'b1101: //LOAD
				begin
					linkSrc <= 0;
					memWrite <= 0;
					memRead <= 1;
					memToReg <= 1;
					regWrite <= 1;
					useEA <= 1;
					branchControl <= 0;
				end
				
			4'b1110: //STORE
				begin
					linkSrc <= 0;
					memWrite <= 1;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 0;
					useEA <= 1;
					branchControl <= 0;
				end
			
			4'b1111: //LOADIMM
				begin
					linkSrc <= 0;
					memWrite <= 0;
					memRead <= 0;
					memToReg <= 0;
					regWrite <= 1;
					useEA <= 1;
					branchControl <= 0;		
				end
		endcase
	end
endmodule