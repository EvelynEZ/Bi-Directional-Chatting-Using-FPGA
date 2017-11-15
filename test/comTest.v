`include "communication.v"

module tester (CLOCK_50, SW, KEY, load, transEn, parallelDataOut, 
				parallelDataIn, charSent, charReceived, LEDR, dataIn, dataOut);
	output reg CLOCK_50;
	output reg [7:0] SW;
	output reg [0:0] KEY;
	input [7:0] LEDR;
	
	output reg dataIn, load, transEn;
	input [7:0] parallelDataIn;
	output reg [7:0] parallelDataOut;
	input dataOut, charSent, charReceived;
	
	parameter CLOCK_PERIOD=50;
	initial CLOCK_50 = 1;
	always begin
		#(CLOCK_PERIOD/2);
		CLOCK_50 = ~CLOCK_50;
	end

	initial // Stimulus
	begin


	#CLOCK_PERIOD	KEY = 1; transEn = 0;
	#CLOCK_PERIOD	KEY = 0;
	#(20*CLOCK_PERIOD) parallelDataOut= 8'b01110010;load = 0;
	#CLOCK_PERIOD	transEn = 1;load = 1;
	#(16*CLOCK_PERIOD)  load = 0;
	#(336*CLOCK_PERIOD) 
	#(5*CLOCK_PERIOD)	transEn = 0;	// receive arrival signal
	#(10*CLOCK_PERIOD)	//SW[1] <= 0;		 @(posedge clk);
				 
		$finish;		
	   
	end
	
endmodule

module testbench;
	wire CLOCK_50;
	wire [7:0] SW;
	wire [0:0] KEY;
	wire [7:0] LEDR;
	
	wire dataIn, load, transEn;
	wire [7:0] parallelDataIn;
	wire [7:0] parallelDataOut;
	wire dataOut, charSent, charReceived;
	
	communication com(.CLOCK_50, .SW, .KEY, .load, .transEn, .parallelDataOut, 
				.parallelDataIn, .charSent, .charReceived, .LEDR, .dataIn, .dataOut);
	tester testcomcom(.CLOCK_50, .SW, .KEY, .load, .transEn, .parallelDataOut, 
				.parallelDataIn, .charSent, .charReceived, .LEDR, .dataIn, .dataOut);
	
	initial 
		begin
			$dumpfile("com.vcd");
			$dumpvars(1,com);
		end
endmodule  