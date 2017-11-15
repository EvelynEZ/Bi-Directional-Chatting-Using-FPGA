module bicReceive (rst, srClock, recEn, charRec, clk);
	input rst, srClock, recEn, clk;
	output reg charRec;
	reg[3:0] bitIDCount;


	always @(posedge clk or negedge rst) begin
		if (!rst) begin
				bitIDCount <= 4'b0000;
				charRec <= 0;
			end
		else if (recEn && srClock)
			begin	
				bitIDCount <= bitIDCount + 1'b1;
				charRec <= bitIDCount[3] & ~bitIDCount[2] & bitIDCount[1] & ~bitIDCount[0];
			end
		else if (!recEn)
			begin
				bitIDCount <= 4'b0000;
				charRec <= 0;
			end
		else 
			begin
				bitIDCount <= bitIDCount;
				charRec <= charRec;
			end
	end

	
endmodule
