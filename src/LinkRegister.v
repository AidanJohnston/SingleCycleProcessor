/*
	LINKREGISTER.V

	CONTRIBUTION: AIDAN, SEAN, FATIMA

*/
module LinkRegister(
	clock,
	ea,
	PCRegIncreament,
	branchControl,
	brx,
	zero,
	negative,
	linkRegOut);
	
	input 				clock;
	input [7:0]			ea;
	input [7:0] 		PCRegIncreament;
	input [1:0]			branchControl;
	input					brx;
	input					zero;
	input					negative;
	
	output reg [7:0]	linkRegOut;
	
	reg [7:0]			linkReg;
	
	//BRANCH COMPARE MUX
	wire compare;
	assign compare = (brx) ? zero : negative;
	
	
	always@(*) begin
	
		case(branchControl)
		
			2'b00:  //BR
				begin
				
					linkRegOut = ea;
					
				end
				
			2'b01:  //BR.C
				begin
				
					if (compare) begin
					
						linkRegOut = ea;
					
					end
					else begin
					
						linkRegOut = PCRegIncreament;
					
					end
				
				end
			
			2'b10:  //BR.SUB
				begin
				
					linkRegOut = ea;
				
				end
			
			2'b11:
				begin
				
					linkRegOut = linkReg;
					
				
				end
		endcase	
	end
	
	always@(posedge clock) begin
	
		case(branchControl)
			2'b10:  //BR.SUB
				begin
				
					linkReg = PCRegIncreament;
				
				end
		endcase	
	end

endmodule