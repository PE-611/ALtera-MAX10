module Test (clk, a,b,c,d,e,f,g);
input clk;
output a,b,c,d,e,f,g;

blink #(.q(50'd50000000)) bl1(.clk1(clk), .i(a));
blink #(.q(50'd25000000)) bl2(.clk1(clk), .i(b));


endmodule

////////////////////////////////////////

module blink #(parameter q = 50'd50000000)(clk1,i);
input clk1;
output reg i;

initial i <= 1'b0;

reg[49:0] counter;
initial counter <= 50'd0;


always @(posedge clk1) begin
	counter <= counter + 1'b1;
	if (counter == q) begin
	counter <= counter - q;
	i <= ~i;
	end
end
endmodule

//////////////////////////////////////////////////////
//blink2 (.clk2(clk), .j(b)); Соединение между модулями, модули разные
//blink3 (.clk3(clk), .k(c));

//blink1 bl1(.clk1(clk), .i(a)); Соединение между модулями, модули идентичны, создание экземпляров
//blink1 bl2(.clk1(clk), .i(b));



//blink #(.q(50'd50000000)) bl1(.clk1(clk), .i(a)); Соединение между модулями, модули идентичны, создание экземпляров, передача параметра, у идентичных модулей разные параметры.
//blink #(.q(25'd50000000)) bl2(.clk1(clk), .i(a));
