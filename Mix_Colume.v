module Mix_Colume(in,out);
  input [0:127]in;
  output[0:127] out;
////////////////////////////////////////// 
  function [0:7]multiply2;
    input [0:7]s;
    begin
      if(s[0]==1)
        begin
          multiply2=((s<<1)^8'h1b);
        end
      else 
        begin
          multiply2=s<<1;
        end
      end
    endfunction 
//////////////////////////////////////////
    function [0:7]multiply3;
      input [0:7]s;
    begin
      multiply3=multiply2(s)^s;
    end
    endfunction
/////////////////////////////////////////////////
  genvar i;
generate         

for (i=0; i<4; i=i+1)begin:r
 
 assign out[(32*i)+:8]= ( multiply2(in[(32*i) +:8]) ) ^ ( multiply3(in[(32*i +8) +:8]) ) ^ ( in[(32*i+16) +:8] ) ^ ( in[(32*i+24) +:8] );
 assign out[(32*i+8)+:8]= ( in[(32*i) +:8] ) ^ ( multiply2(in[(32*i +8) +:8]) )^( multiply3(in[(32*i+16) +:8]) )^( in[(32*i+24) +:8] );
 assign out[(32*i+16)+:8]= ( in[(32*i) +:8] ) ^ (in[(32*i +8) +:8]) ^( multiply2(in[(32*i+16) +:8]) )^( multiply3(in[(32*i+24) +:8] ));
 assign out[(32*i+24)+:8]= (multiply3( in[(32*i) +:8] )) ^ (in[(32*i +8) +:8]) ^(in[(32*i+16) +:8])^( multiply2(in[(32*i+24) +:8] ));

end

endgenerate
endmodule
