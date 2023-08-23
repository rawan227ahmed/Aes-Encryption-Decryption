`include"AES_Encrypt.v"
`include"AES_Decrypt.v"
module TestWrapper
(
input rst,
input [1:0]TestCase,
input Ec_Dec,
output reg flag_Encrypt,
output reg flag_Decrypt
);

wire [127:0] in;
assign in=128'h00112233445566778899aabbccddeeff;
wire [191:0] Key192;
assign Key192=192'h000102030405060708090a0b0c0d0e0f1011121314151617;
wire [127:0] out0;
wire [127:0] out1;
wire [127:0]Expected192;
assign Expected192=128'hdda97ca4864cdfe06eaf70a0ec0d7191;
wire [127:0] Key128;
assign Key128=128'h000102030405060708090a0b0c0d0e0f;
wire [127:0] out2;
wire [127:0] out3;
wire [255:0] Key256;
assign Key256=256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
wire [127:0] out4;
wire [127:0] out5;
wire [127:0]Expected256;
assign Expected256=128'h8ea2b7ca516745bfeafc49904b496089;
wire [127:0]Expected128;
assign Expected128=128'h69c4e0d86a7b0430d8cdb78070b4c55a;

AES_Encrypt #(.Width(192),.Nk(6),.Nr(12)) aes_encrypt192 (in,Key192,out0);
AES_Decrypt #(.Width(192),.Nk(6),.Nr(12)) aes_decrypt192 (out0,Key192,out1);

AES_Encrypt #(.Width(128),.Nk(4),.Nr(10)) aes_encrypt128 (in,Key128,out2);
AES_Decrypt #(.Width(128),.Nk(4),.Nr(10)) aes_decrypt128 (out2,Key128,out3);


AES_Encrypt #(.Width(256),.Nk(8),.Nr(14)) aes_encrypt256 (in,Key256,out4);
AES_Decrypt #(.Width(256),.Nk(8),.Nr(14)) aes_decrypt256 (out4,Key256,out5);

always@(*)
begin
if(rst)
begin
flag_Encrypt=0;
flag_Decrypt=0;
end
else
begin
case(TestCase)
01:
begin
if(Ec_Dec==1&&out0==Expected192)
begin
flag_Encrypt=1;
flag_Decrypt=0;
end
else
if(Ec_Dec==0&&out1==in)
begin
flag_Decrypt=1;
flag_Encrypt=0;
end
else
begin
flag_Encrypt=0;
flag_Decrypt=0;
end
end
////////////////////////////////////////////////
2'b10:
begin
if(Ec_Dec==1 && out2==Expected128)
begin
flag_Encrypt = 1;
flag_Decrypt = 0;
end
else
if(Ec_Dec==0&&out3==in)
begin
flag_Decrypt=1;
flag_Encrypt=0;
end
else
begin
flag_Encrypt=0;
flag_Decrypt=0;
end
end
////////////////////////////////////////////////
2'b11:
begin
if(Ec_Dec==1&&out4==Expected256)
begin
flag_Encrypt=1;
flag_Decrypt=0;
end
else
if(Ec_Dec==0&&out5==in)
begin
flag_Decrypt=1;
flag_Encrypt=0;
end
else
begin
flag_Encrypt=0;
flag_Decrypt=0;
end
end
////////////////////////////////////////////////
default:
begin
flag_Encrypt=0;
flag_Decrypt=0;
end
endcase
end
end

endmodule 