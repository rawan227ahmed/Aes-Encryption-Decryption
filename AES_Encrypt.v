`include"Key_Expansion.v"
`include"addRoundKey.v"
`include"Mix_Colume.v"
`include"Shift_Row.v"
`include"Sub_Bytes.v"
module AES_Encrypt#(parameter Width=128,parameter Nk=4,parameter Nr=10)(in,Key,out);
input [127:0]in;
input[(Width)-1:0]Key;
output [127:0]out;
wire [128*(Nr+1)-1:0]Word;
wire [127:0]State[Nr:0];
wire [127:0]c0[Nr-1:1];
wire [127:0]c1[Nr-1:1];
wire [127:0]c2[Nr-1:1];
wire [127:0]c3;
wire [127:0]c4;
wire [127:0]c5;
wire [127:0]c6;
Key_Expansion #(.Nk(Nk),.Nr(Nr)) j(Key,Word);
addRoundKey w(in,Word[(128*(Nr+1)-1)-:128],State[0]);

genvar i;
generate
for(i=1;i<Nr;i=i+1)
begin:loop
Sub_Bytes sub(State[i-1],c0[i]);
Shift_Row row(c0[i],c1[i]);
Mix_Colume column(c1[i],c2[i]);
addRoundKey add(c2[i],Word[(128*(Nr+1)-1)-(128*i)-:128],State[i]);
end
endgenerate
Sub_Bytes subbytes(State[Nr-1],c3);
Shift_Row shift(c3,c4);
addRoundKey key(c4,Word[127:0],c5);
assign out=c5;
endmodule 