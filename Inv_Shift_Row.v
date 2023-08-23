module Inv_Shift_Row(
input [127:0]in,output [127:0]ou);
assign ou[127:120]=in[127:120];
assign ou[95:88]=in[95:88];
assign ou[63:56]=in[63:56];
assign ou[31:24]=in[31:24];
assign ou[119:112]=in[23:16];
assign ou[87:80]=in[119:112];
assign ou[55:48]=in[87:80];
assign ou[23:16]=in[55:48];
assign ou[111:104]=in[47:40];
assign ou[79:72]=in[15:8];
assign ou[47:40]=in[111:104];
assign ou[15:8]=in[79:72];
assign ou[103:96]=in[71:64];
assign ou[71:64]=in[39:32];
assign ou[39:32]=in[7:0];
assign ou[7:0]=in[103:96];
endmodule

