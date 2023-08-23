module Master#(parameter lenght=128)(Clk,MISO,En,In,MOSI,CLK_OUT);
input MISO;
input En;
input[0:lenght-1] In;
input Clk;
output MOSI;
output CLK_OUT;
reg Out;
integer i=0; 
assign CLK_OUT=Clk;

always@(posedge Clk)
begin
if(En)
begin
Out=In[i];
i=i+1;
end
end

assign MOSI=Out;
endmodule
