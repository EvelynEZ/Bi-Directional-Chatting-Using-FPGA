`include "bicTransmit.v"

module tester (rst, srClock, transEn, charSent);
	output reg rst, srClock, transEn;
	input charSent;

	
	

	parameter CLOCK_PERIOD=50;
	initial srClock=1;
	always begin
		#(CLOCK_PERIOD/2);
		srClock = ~srClock;
	end
	
	initial
	begin
		$display("\t\t rst transEn\t charSent\t Time ");
		$monitor("\t\t %b\t %b \t %b \t      %b \t", rst, transEn, charSent, $time );
		
	end
	
	initial // Stimulus
	begin

	   				 @(posedge srClock);
		rst <= 1;@(posedge srClock);
		rst <= 0;@(posedge srClock);
		transEn <= 1;@(posedge srClock);
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
		transEn <= 0;		 @(posedge srClock);
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
	wire rst, srClock, transEn;
	wire charSent;
	
	bicTransmit bt(.rst, .srClock, .transEn, .charSent);
	tester test(.rst, .srClock, .transEn, .charSent);
	initial 
	begin
		$dumpfile("bt.vcd");
		$dumpvars(1,bt);
	end
endmodule 
