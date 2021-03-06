module tb_lab4;
	reg [1:0] KEY;
	wire [9:0] LEDR;
	reg [9:0] SW;
	wire [9:0] d_o;
	
	// these are all the key1 test cases, switches can only be in these 3 sequences
	// if key 1 is active, display one of these cases
	
lab4 UUT (.KEY(KEY), .LEDR(LEDR), .SW(SW), .d_o(d_o));
	
	initial begin
	#50 KEY[0] = 1'b0; #50 KEY[0] = 1'b1;
	SW[9:0] = 10'b0000000000; KEY[1] = 1'b0;
	// 1st TEST CASE
		repeat (15) begin
			#50 KEY[0] = 1'b0; #50 KEY[0] = 1'b1; 
			KEY[1] = 1'b1;
		end
	
	// 2nd TEST CASE
		#50 KEY[0] = 1'b0; #50 KEY[0] = 1'b1;
		SW[9:0] = 10'b1111111111;	KEY[1] = 1'b0;
		repeat (15) begin
			#50 KEY[0] = 1'b0; #50 KEY[0] = 1'b1; 
			KEY[1] = 1'b1;
		end
		
	// 3rd TEST CASE
	#50 KEY[0] = 1'b0; #50 KEY[0] = 1'b1;
	SW[9:0] = 10'b1010101010; KEY[1] = 1'b0;
		repeat (25) begin
			#50 KEY[0] = 1'b0; #50 KEY[0] = 1'b1; 
			KEY[1] = 1'b1;
		end
	end
	
endmodule
