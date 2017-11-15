`include "bicReceive.v"

module tester (rst, srClock, recEn, charRec);
	output reg rst, srClock, recEn;
	input charRec;

	
	

	parameter CLOCK_PERIOD=50;
	initial srClock=1;
	always begin
		#(CLOCK_PERIOD/2);
		srClock = ~srClock;
	end
	
	initial
	begin
		$display("\t\t rst recEn\t charRec\t Time ");
		$monitor("\t\t %b\t %b \t %b \t      %b \t", rst, recEn, charRec, $time );
		
	end
	
	initial // Stimulus
	begin

	   				 @(posedge srClock);
		rst <= 1;@(posedge srClock);
		rst <= 0;@(posedge srClock);
		recEn <= 1;@(posedge srClock);
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
		recEn <= 0;		 @(posedge srClock);
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
	wire rst, srClock, recEn;
	wire charRec;
	
	bicReceive br(.rst, .srClock, .recEn, .charRec);
	tester test(.rst, .srClock, .recEn, .charRec);
	initial 
	begin
		$dumpfile("br.vcd");
		$dumpvars(1,br);
	end
endmodule 
