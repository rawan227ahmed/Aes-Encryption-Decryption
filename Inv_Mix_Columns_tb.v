`include"Inv_Mix_Columns.v"
module Inv_Mix_Columns_tb();
reg [0:127]in;
wire [0:127]out;
Inv_Mix_Columns inv(in,out);
initial 
begin
in=128'h046681e5_e0cb199a_48f8d37a_2806264c;
end
endmodule 