module addRoundKey(data,key,out);
input[127:0]data;
input[127:0]key;
output [127:0]out;
assign out[127:0]=data[127:0]^key[127:0];
endmodule
