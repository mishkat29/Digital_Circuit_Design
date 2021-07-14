module dff_tb();

parameter cycle=10;        
     
  reg clk,
      reset,
      d;
  wire q,
       qb;

     
dff DUT(.clk(clk),.reset(reset),.d(d),.q(q),.qb(qb));

 always
  begin
    #(cycle/2);
      clk = 1'b0;
    #(cycle/2);
      clk=~clk;
  end
	  

  task rst_dut();
  begin
    reset=1'b1;
    #10;
    reset=1'b0;
  end
  endtask

  task din(input i);
  begin
    @(negedge clk);
    d=i;
  end
  endtask
           
  initial 
  begin
    rst_dut;
    din(0);
    din(1);
    din(0);
    din(1);
    din(1);
    rst_dut;
    din(0);
    din(1);
    #10;
    $finish;
  end


initial
$monitor("d=%d--q=%d--qb=%d",d,q,qb);
endmodule