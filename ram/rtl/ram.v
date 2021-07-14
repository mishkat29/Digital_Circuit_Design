module ram(data,
           we,
           enable,
           addr);
      
  input we,
        enable;
  input [3:0] addr;
  inout [7:0] data;

 reg [7:0]mem[15:0];


  always@(data,we,enable,addr)
    if (we && !enable)
       mem[addr]=data;


  assign data= (enable && !we) ? mem[addr] : 8'hzz;
endmodule 