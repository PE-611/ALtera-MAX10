module Test (clk, a,b,c,d,e,f,g);
input clk;
output a,b,c,d,e,f,g;



blink1 (.clk1(clk), .i(a));
blink2 (.clk2(clk), .j(b));
endmodule

////////////////////////////////////////

module blink1 (clk1,i);
input clk1;
output reg i;

initial i <= 1'b0;

reg[24:0] counter1;
initial counter1 <= 25'd0;


always @(posedge clk1) begin
	counter1 <= counter1 + 1'b1;
	if (counter1 == 25'd25000000) begin
	counter1 <= counter1 - 25'd25000000;
	i <= ~i;
	end
end
endmodule

////////////////////////////////////////

module blink2 (clk2,j);
input clk2;
output reg j;

initial j <= 1'b1;

reg[24:0] counter2;
initial counter2 <= 25'd0;


always @(posedge clk2) begin
	counter2 <= counter2 + 1'b1;
	if (counter2 == 25'd8000000) begin
	counter2 <= counter2 - 25'd25000000;
	j <= ~j;
	end
end
endmodule




/*
module Test 
(
input CLK, 
output DS_C, 
output DS_EN1, DS_EN2, DS_EN3, DS_EN4
);

assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = 4'b1111;

blink_gen (.clk(CLK));
blink_gen (.clk2(DS_C));

endmodule


module blink_gen 
(
input clk, 
output clk2
);


reg [25:0]cnt = 0;

assign clk2 = cnt[25];

always @(posedge clk) begin
	cnt <= cnt + 26'b1;
end


endmodule
*/
