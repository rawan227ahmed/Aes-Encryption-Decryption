module AES_Decrypt#(parameter Width=128,parameter Nk=4,parameter Nr=10)(in,Key,out);
input [127:0]in;
input[(Width)-1:0]Key;
output [127:0]out;
wire [128*(Nr+1)-1:0]Word;
wire [127:0]State[Nr:0];
wire [127:0]c0[Nr-1:0];
wire [127:0]c1[Nr-1:0];
wire [127:0]c2[Nr-1:0];
wire [127:0]c3;
wire [127:0]c4;
wire [127:0]c5;
wire [127:0]c6;

Key_Expansion #(.Nk(Nk),.Nr(Nr)) j(Key,Word);

addRoundKey w(in,Word[127:0],State[0]);

genvar i;
generate
for(i=1;i<=Nr;i=i+1)
begin:loop
Inv_Shift_Row row(State[i-1],c0[i-1]);
Inv_Sub_Bytes sub(c0[i-1],c1[i-1]);
addRoundKey add(c1[i-1],Word[(128*i)+:128],c2[i-1]);
Inv_Mix_Colume column(c2[i-1],State[i]);
end
endgenerate
Inv_Shift_Row shift(State[Nr-1],c3);
Inv_Sub_Bytes subbytes(c3,c4);
addRoundKey key(c4,Word[(128*(Nr+1)-1)-:128],c5);
assign out=c5;
endmodule 