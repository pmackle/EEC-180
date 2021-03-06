module counter2(
	input wire			reset,
	input wire			enable1,
	input wire			enable2,
	input wire			up_down,
	input wire			free_run,
	input					clk,

	output reg 			[23:0] display

);
	reg					[23:0] count2 = 24'b000000000000000000000000;
	reg					[23:0] count2_c = 24'b000000000000000000000000;
	
	


always @(enable2 or reset) begin
	if (enable2 == 1'b1)begin
		count2_c = count2;
		if (up_down == 1'b1) begin
			count2_c = count2 + 24'b000000000000000000000001;
		end
	
		if (up_down == 1'b0) begin
			count2_c = count2 - 24'b000000000000000000000001;
		end
	
		if (free_run == 1'b1 && count2 == 24'b111111111111111111111111) begin
			count2_c = 24'b000000000000000000000000;
		end	
	
		if (free_run == 1'b0 && count2 == 24'b100000000000000000000000)begin
			count2_c = count2;
		end
	

		//account for all if statements
	end

		if (reset == 1'b1) begin
		count2_c = 24'b000000000000000000000000;	
		end
end

always @(posedge clk) begin
	count2 <= #1 count2_c;
	display <= #1 count2_c;
end
// <= see this in always block posedge, sequential
endmodule