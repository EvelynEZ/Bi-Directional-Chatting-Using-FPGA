`include "S2P.v"

module tester (rst, srClock, dataIn, data);
	output reg rst, srClock, dataIn;
	output reg dataIn;
	input [7:0] data;


	
	

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
		dataIn <= 1'b0;  @(posedge srClock);
		 dataIn <= 1'b0;@(posedge srClock);
		 dataIn <= 1'b1;			 @(posedge srClock);
		 dataIn <= 1'b1;		 @(posedge srClock);
		 dataIn <= 1'b0;		 @(posedge srClock);
		 dataIn <= 1'b1;			 @(posedge srClock);
		 dataIn <= 1'b1;		 @(posedge srClock);
		 dataIn <= 1'b1;		 @(posedge srClock);
	      dataIn <= 1'b0;        @(posedge srClock);
		  dataIn <= 1'b1;			@(posedge srClock);
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
	wire rst, srClock, dataIn;
	wire dataIn;
	wire [7:0] data;
	
	S2P s2(.rst, .srClock, .dataIn, .data);
	tester test(.rst, .srClock, .dataIn, .data);
	initial 
	begin
		$dumpfile("s2.vcd");
		$dumpvars(1,s2);
	end
endmodule 
