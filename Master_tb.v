module Master_tb();
reg Clk,En,MISO;
reg [0:127]In;
wire MOSI;
Master m(.Clk(Clk),.En(En),.MISO(MISO),.In(In),.MOSI(MOSI),.CLK_OUT(CLK_OUT));
always
#50 Clk=~Clk;

initial
begin
Clk=1'b0;
En=1'b1;
In=128'h046681e5_e0cb199a_48f8d37a_2806264c;
MISO=1'b0;
end

endmodule
