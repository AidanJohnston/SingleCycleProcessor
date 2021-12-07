/*
	CPU.V

	CONTRIBUTION: AIDAN, SEAN, FATIMA

*/
module CPU(
	input				clock,
	input [7:0] 	inPort,
	input				reset,
	output[7:0]		outPort);
	
	//====================================
	//PROGRAM COUNTER INPUT
	//CLOCK
	//RESET
	reg [15:0]		instruction;
	//BRX
	reg				linkSrc;
	reg [1:0]		branchControl;
	reg zero;
	reg negative;
	
	//PROGRAM COUNTER OUTPUT
	
	reg [7:0]		PCReg;
	
	wire [7:0]		PCNext;
	wire [7:0]		PCRegIncreament;
	wire [7:0]		linkRegOut;
	
	initial begin
	
		PCReg = 8'b0;
	
	end
	
	always@(posedge clock or posedge reset) begin
	
		if (reset) begin 
		
			PCReg <= 8'b0;
		
		end
		else begin
		
			PCReg <= PCNext;
		
		end
	end
	
	assign PCRegIncreament = PCReg + 2;
	
	
	//====================================
	//INSTRUCTION MEMORY INPUT
	//CLOCK
	//PCREG
	
	//INSTRUCTION MEMORY OUTPUT
	//INSTRUCTION
	
	InstructionMemory instructionMemory(PCReg, instruction);
	
	//====================================
	//CONTROL INPUT
	//INSTRUCTION[7:4]
	//CLOCK
	
	//CONTROL OUTPUT
	wire			regWrite;
	wire			memWrite;
	wire			useEA;
	wire [3:0]	ALUOP;
	wire			memRead;
	//LINKSRC
	wire			memToReg;
	//BRNACHCONTROL[1:0]
	
	Control control(instruction[7:4], regWrite, memWrite, useEA, ALUOP, memRead, linkSrc, memToReg, branchControl);
	
	//====================================
	//LINKREGISTER INPUT
	//CLOCK
	//EA
	//PCINCREAMENT
	//BRANCHCONTROL
	//BRX
	//ZERO
	//NEGATIVE
	
	//LINKREGISTER OUTPUT
	
	
	LinkRegister linkRegister(clock, instruction[15:8], PCRegIncreament, branchControl, instruction[5], zero, negative, linkRegOut);
	
	assign PCNext = (linkSrc) ?  linkRegOut : PCRegIncreament;
	
	//====================================
	//REGISTERS INPUT
	//CLOCK
	//INSTRUCTION[3:2]
	//INSTRUCTION[1:0]
	//INSTRUCTION[3:2]
	reg [7:0]	writeData;
	//REGWRITE
	
	//REGISTER OUTPUT
	wire [7:0]	readData1;
	wire [7:0]	readData2;
	
	Registers registers(clock, reset, instruction[3:2], instruction[1:0], instruction[3:2], writeData, regWrite, readData1, readData2);
	
	//====================================
	//ALU INPUT
	//CLOCK
	//READDATA1
	wire [7:0]	ALUInput2;
	assign ALUInput2 = (useEA) ? instruction[15:8] : readData2;
	//ALUOP
	//inPort
	
	reg [7:0]	outPortReg;
	wire [7:0]	ALUResult;
	//ZERO
	//NEGATIVE
	
	//OUTPORT
	
	ALU alu(clock, readData1, ALUInput2, ALUOP, inPort, ALUResult, zero, negative, outPort);
	
	//====================================
	//DATA MEMORY INPUT
	//CLOCK
	//ALUReuslt
	//DATAWRITE
	//MEMWRITE
	//MEMREAD
	
	//DATA MEMORY OUTPUT
	wire [7:0]	readData;
	DataMemory dataMemory(clock, reset, ALUResult, readData1, memWrite, memRead, readData);
	
	//MEMTOREG MUX
	assign writeData = (memToReg) ? readData : ALUResult; 
	
	
endmodule