//S/R Clock control will be 1 after 8 clock cycles.
module bsc (rst, clk, enable, srClock);
	input rst, clk, enable;
	output reg srClock;
	reg[3:0] bitSampleCount;
	
	always @(posedge clk) begin
		if(!rst)
			begin
				bitSampleCount = 4'b0000;
			end
		else if(enable) 
			begin
				bitSampleCount = bitSampleCount + 1'b1;
				srClock = bitSampleCount[3] & ~bitSampleCount[2] & ~bitSampleCount[1] & ~bitSampleCount[0];
			end
		else 	
			begin
				bitSampleCount = 4'b0000;
			end
	end
endmodule 
