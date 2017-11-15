`include "startBitDetect.v"

module tester (rst, serialIn, recvStart, charRec);
	output reg rst, serialIn, charRec;
	input recvStart;

	
	

	parameter CLOCK_PERIOD=50;
	initial serialIn=1;
	always begin
		#(CLOCK_PERIOD/2);
		serialIn = ~serialIn;
	end
	
	initial
	begin
		$display("\t\t rst recvStart\t charRec \t\t Time ");
		$monitor("\t\t %b\t %b \t %b \t      %b \t", rst, recvStart, charRec, $time );
		
	end
	
	initial // Stimulus
	begin

	   				 @(posedge serialIn);
		rst <= 1;@(posedge serialIn);
		rst <= 0;@(posedge serialIn);
		@(posedge serialIn);
		 @(posedge serialIn);
					 @(posedge serialIn);
				 @(posedge serialIn);
				 @(posedge serialIn);
					 @(posedge serialIn);
				 @(posedge serialIn);
				 @(posedge serialIn);
	             @(posedge serialIn);
		charRec <= 1;			@(posedge serialIn);
				@(posedge serialIn);
				 @(posedge serialIn);
				 @(posedge serialIn);
				 @(posedge serialIn);
				 @(posedge serialIn);
				 @(posedge serialIn);
				 @(posedge serialIn);
				 @(posedge serialIn);
				 @(posedge serialIn);
				  @(posedge serialIn);
			
		$finish;		 
	   
	end
	
	
endmodule
module testbench;
	wire rst, serialIn, charRec;
	wire recvStart;
	
	startBitDetect startBitDetect1 (.rst, .serialIn, .recvStart, .charRec);
	tester test(.rst, .serialIn, .recvStart, .charRec);
	initial 
	begin
		$dumpfile("detect.vcd");
		$dumpvars(1,startBitDetect1);
	end
endmodule 
