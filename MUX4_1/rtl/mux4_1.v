module mux4_1(a,
              sel,
              y);

       

input [3:0] a;
input [1:0] sel;
output reg y;
// Since this is a combinational block we will use always with case
always@(*)
begin
    case(sel)
        2'd0:y=a[0];
        2'd1:y=a[1];
        2'd2:y=a[2];
        2'd3:y=a[3];
    endcase
end

endmodule