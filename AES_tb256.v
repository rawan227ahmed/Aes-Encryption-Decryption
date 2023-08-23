module AES_tb256();
reg [127:0]in;
reg[255:0]Key;
wire [127:0] out_encrypt;
wire [127:0] out_decrypt;
AES_Encrypt #(.Width(256),.Nk(8),.Nr(14)) aes_encrypt (in,Key,out_encrypt);
AES_Decrypt #(.Width(256),.Nk(8),.Nr(14)) aes_decrypt (out_encrypt,Key,out_decrypt);
initial
begin
in=128'h00112233445566778899aabbccddeeff;
Key=256'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
end
endmodule 
