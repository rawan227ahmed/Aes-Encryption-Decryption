`include"Inv_SBox.v"
module Inv_Sub_Bytes #(parameter Width=128 )(in,out);
input [Width-1:0] in;
output [Width-1:0] out;

genvar i;
generate
for(i=0;i<Width;i=i+8) begin :Sub_Bytes 
Inv_SBox s(in[i +:8],out[i +:8]);
end
endgenerate
endmodule

