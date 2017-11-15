// Implements a simple Nios II system for the DE-series board.
// Inputs: SW7−0 are parallel port inputs to the Nios II system
// CLOCK_50 is the system clock
// KEY0 is the active-low system reset
// Outputs: LEDR7−0 are parallel port outputs from the Nios II system
`include "startBitDetect.v"
`include "bsc.v"
`include "bicReceive.v"
`include "S2P.v"
`include "P2S.v"
`include "bicTransmit.v"

module communication (CLOCK_50, SW, KEY, load, transEn, parallelDataOut, 
				parallelDataIn, charSent, charReceived, LEDR, dataIn, dataOut);
	input CLOCK_50;
	input [7:0] SW;
	input [0:0] KEY;
	output reg [7:0] LEDR;
	
	input dataIn, load, transEn;
	input [7:0] parallelDataOut;
	output [7:0] parallelDataIn;
	output dataOut, charSent, charReceived;
	
	wire[31:0] clk;
	clock_divider Divider (CLOCK_50, clk);
	
	
	// Instantiate the Nios II system module generated by the Qsys tool:
	// nios_system nios2 (.charreceived_export(charReceived),    //    charreceived.export
								// .charsent_export(charSent),        //        charsent.export
								// .clk_clk(clk[0]),                //             clk.clk
								// .leds_export(LEDR),            //            leds.export
								// .load_export(load),            //            load.export
								// .paralleldatain_export(parallelDataIn),  //  paralleldatain.export
								// .paralleldataout_export(parallelDataOut), // paralleldataout.export
								// .reset_reset_n(KEY),          //           reset.reset_n
								// .switches_export(SW),        //        switches.export
								// .transen_export(transEn)          //         transen.export
							// );	
	wire x;
	wire SerialInStart, srClockReceive, charReceived;
	wire [7:0] parallelDataIn;
	
	startBitDetect sbd  (.rst(KEY), .serialIn(x), .recvStart(SerialInStart), .charRec(charReceived));
	bsc bscRec (.rst(KEY), .clk(clk[0]), .transEn(SerialInStart), .srClock(srClockReceive));
	bicReceive bicRec (.rst(KEY), .srClock(srClockReceive), .recEn(SerialInStart), .charRec(charReceived));
	S2P receiveBuffer (.rst(KEY), .srClock(srClockReceive), .dataIn(x), .data(parallelDataIn));
	
	wire srClockTransmit, transEn, charSent, load;
	wire [7:0] parallelDataOut;
	
	bicTransmit bisTran (.rst(KEY), .srClock(srClockTransmit), .transEn(transEn), .charSent(charSent));
	bsc bscTran (.rst(KEY), .clk(clk[0]), .transEn(transEn), .srClock(srClockTransmit));
	P2S transmitBuffer (.rst(KEY), .srClock(srClockTransmit), .data(parallelDataOut), .load(load), .dataOut(x));
endmodule 

// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ...
module clock_divider (clock, divided_clocks);
      input   clock;
      output reg [31:0]  divided_clocks;
		
      initial
         divided_clocks = 0;
      always @(posedge clock)
         divided_clocks = divided_clocks + 1;
endmodule