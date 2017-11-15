module bicTransmit (rst, srClock, transEn, charSent, load, clk);
	input rst, srClock, transEn, load, clk;
	output reg charSent;
	reg [3:0] bitIDCount;

	//assign charSent = bitIDCount[3] & ~bitIDCount[2] & ~bitIDCount[1] & bitIDCount[0] & transEn;
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			bitIDCount <= 4'b0000;
			charSent <= 0;
			end
		else if (transEn && !load && srClock)
			begin	
				bitIDCount <= bitIDCount + 1'b1;
				charSent <= bitIDCount[3] & ~bitIDCount[2] & bitIDCount[1] & ~bitIDCount[0];
			end
		else if (!transEn && charSent)
			begin
				bitIDCount <= 4'b0000;
				charSent <= 0;
			end
		else 
			begin
				bitIDCount <= bitIDCount;
				charSent <= charSent;
			end
	end
	
	
endmodule
