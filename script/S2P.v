module S2P (rst, srClock, dataIn, data);
	input rst, srClock, dataIn;
	output reg [7:0] data;
	
    reg [9:0] buffer;
	
	always @(posedge srClock or negedge rst) begin
		if (!rst) 
			begin
				buffer <= 10'b0;
			end
		else 
			begin
				data <= buffer[8:1];
				buffer <= {buffer[8:0], dataIn};
			end
	end
			
endmodule 

	
	