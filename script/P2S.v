module P2S (rst, srClock, data, load, dataOut, transEn, clk, charSent);
	input rst, srClock,load, transEn, clk, charSent;
	input [7:0]  data;
	output reg dataOut;
    reg [9:0] buffer;
	
	
	//assign dataOut = buffer[9];
	initial begin 
		dataOut = 1'b1;
		buffer <= 10'b1111111111;
	end
	
	always @(posedge clk or negedge rst) begin
		 if (!rst) 
			 begin
				 buffer <= 10'b0;
			 end
		 else if (load && !charSent) 
			begin
				buffer <= {1'b0, data, 1'b1};
			end
		else if(transEn && srClock)
			begin
				dataOut <= buffer[9];
				buffer <= { buffer[8:0], 1'b1};
			end
		else if(charSent) 
			begin
				dataOut <= 1;
				buffer <= 10'b1111111111;
			end
		else
			begin 
				dataOut <= dataOut;
				buffer <= buffer;
			
			end
	end
			
endmodule 
	