`include"Key_Expansion.v"
module Key_Expansion_tb();
reg [0:255]Key;
wire[0:1919]Word;

reg [0:127] k2;
wire[0:1407] out2;
Key_Expansion #(.Nk(8),.Nr(14))r(Key,Word);
Key_Expansion #(.Nk(4),.Nr(10))ks2(k2,out2);
initial
begin
Key=256'h603deb10_15ca71be_2b73aef0_857d7781_1f352c07_3b6108d7_2d9810a3_0914dff4;
k2=128'h046681e5_e0cb199a_48f8d37a_2806264c;
end
endmodule 