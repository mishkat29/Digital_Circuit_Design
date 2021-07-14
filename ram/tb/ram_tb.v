module ram_tb;

  wire [7:0] data;
  reg  [3:0] addr;
  reg  we,enable;
  reg  [7:0] tempd;

  integer l;


  ram DUT(data,we,enable,addr);

  assign data=(we && !enable) ? tempd : 8'hzz;

  task initialize();
  begin
    we=1'b0; enable=1'b0; tempd=8'h00;
  end
  endtask

  

  task stimulus(input [3:0]i, input [7:0]j);
  begin	
    addr=i;
		tempd=j;
  end
  endtask

  task write();
  begin
    we=1'b1;
    enable=1'b0;
  end
  endtask

  task read();
  begin
    we=1'b0;
    enable=1'b1;
  end
  endtask

  task delay;
  begin
    #10;
  end
  endtask

  initial
  begin
    initialize;
    delay;
    write;
    for(l=0;l<16;l=l+1)
    begin
      stimulus(l,l);
      delay;
    end
    initialize;
    delay;
    read;
    for(l=0;l<16;l=l+1)
    begin
      stimulus(l,l);
      delay;
    end
    delay;
    $finish;
   end

endmodule