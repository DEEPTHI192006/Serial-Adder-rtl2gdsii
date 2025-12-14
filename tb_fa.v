module tb_fa();
reg a,b,c;
wire s,cy;
fa dut(a,b,c,s,cy);

initial 
begin
a=1'b0; b=1'b0; c=1'b0; #10;
a=1'b0; b= 1'b0; c=1'b1; #10;
a=1'b1; b=1'b0; c=1'b0; #10;
a=1'b1; b= 1'b0; c=1'b1; #10;
$stop();
end
endmodule
