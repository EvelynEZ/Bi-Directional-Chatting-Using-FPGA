module startBitDetect (rst, clk, serialIn, recvStart, charRec);
	input rst, clk, serialIn, charRec;
	output reg recvStart;
	
	always @(posedge clk) begin
		if (!rst) 
			begin
				recvStart = 0;
			end
		else if(!serialIn)
			begin 
				recvStart = 1;
			end
		else if (charRec && recvStart)
			begin
				recvStart = 0;
			end
		else
			begin
				recvStart <= recvStart;
			end	
	end
endmodule
