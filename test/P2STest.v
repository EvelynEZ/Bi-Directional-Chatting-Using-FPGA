`include "P2S.v"

module tester (rst, srClock, data, load, dataOut);
	output reg rst, srClock,load;
	output reg [7:0]  data;
	input dataOut;

	
	

	parameter CLOCK_PERIOD=50;
	initial srClock=1;
	always begin
		#(CLOCK_PERIOD/2);
		srClock = ~srClock;
	end
	

	
	initial // Stimulus
	begin

	   				 @(posedge srClock);
		rst <= 1;@(posedge srClock);
		rst <= 0;@(posedge srClock);
		load <= 1; data <= 8'b10101011; @(posedge srClock);
		load <= 0; @(posedge srClock);
					 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
					 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
	             @(posedge srClock);
					@(posedge srClock);
				@(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
			load <= 1; data <= 8'b00001111;	  @(posedge srClock);
			load <= 0;	@(posedge srClock);
					 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
					 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
	             @(posedge srClock);
					@(posedge srClock);
				@(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
				 @(posedge srClock);
				  @(posedge srClock);
		$finish;		 
	   
	end
	
	
endmodule
module testbench;
	wire rst, srClock,load;
	wire [7:0]  data;
	wire dataOut;
	
	P2S p2(.rst, .srClock, .data, .load, .dataOut);
	tester test(.rst, .srClock, .data, .load, .dataOut);
	initial 
	begin
		$dumpfile("p2.vcd");
		$dumpvars(1,p2);
	end
endmodule 
