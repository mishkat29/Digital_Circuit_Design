 module df_f(clk,
           reset,
           d,
           q,
           qb);

 input clk, reset, d;
 output reg q;
 output qb;
 
 always@(posedge clk)
 begin
     if(reset)
        q=0;
     else
        q=d;
 end
 
 assign qb=~q;
       
endmodule         