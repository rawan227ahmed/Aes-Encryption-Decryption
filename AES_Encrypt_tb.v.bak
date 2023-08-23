`include"AES_Encrypt.v"
`include"AES_Decrypt.v"
module AES_Encrypt_tb();
reg [127:0]in;
reg[191:0]Key;
wire [127:0]out_encrypt;
wire [127:0] out_decrypt;
//AES_Encrypt #(.Width(128),.Nk(4),.Nr(10)) aes_encrypt (in,Key,out_encrypt);
//AES_Decrypt #(.Width(128),.Nk(4),.Nr(10)) aes_decrypt (out_encrypt,Key,out_decrypt);
AES_Encrypt #(.Width(192),.Nk(6),.Nr(12)) aes_encrypt2 (in,Key,out_encrypt);
AES_Decrypt #(.Width(192),.Nk(6),.Nr(12)) aes_decrypt2 (out_encrypt,Key,out_decrypt);
initial
begin
in=128'h00112233445566778899aabbccddeeff;
//Key=128'h000102030405060708090a0b0c0d0e0f;
Key=192'h000102030405060708090a0b0c0d0e0f1011121314151617;
end
endmodule 