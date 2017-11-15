`include "bsc.v"

module tester (rst, clk, transEn, srClock);
	output reg rst, clk, transEn;
	input srClock;

	
	

	parameter CLOCK_PERIOD=50;
	initial clk=1;
	always begin
		#(CLOCK_PERIOD/2);
		clk = ~clk;
	end
	
	initial
	begin
		$display("\t\t rst transEn\t srClock \t\t Time ");
		$monitor("\t\t %b\t %b \t %b \t      %b \t", rst, transEn, srClock, $time );
		
	end
	
	initial // Stimulus
	begin

	   				 @(posedge clk);
		rst <= 1;@(posedge clk);
		rst <= 0;@(posedge clk);
		transEn <= 1;@(posedge clk);
		 @(posedge clk);
					 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
					 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
	             @(posedge clk);
					@(posedge clk);
				@(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				  @(posedge clk);
				@(posedge clk);
					 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
					 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
	             @(posedge clk);
					@(posedge clk);
				@(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				 @(posedge clk);
				  @(posedge clk);
		$finish;		 
	   
	end
	
	
endmodule
module testbench;
	wire rst, clk, transEn;
	wire srClock;
	
	bsc bsc1(.rst, .clk, .transEn, .srClock);
	tester test(.rst, .clk, .transEn, .srClock);
	initial 
	begin
		$dumpfile("bsc.vcd");
		$dumpvars(1,bsc1);
	end
endmodule 
