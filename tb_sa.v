module tb_sa();
reg [3:0] a,b;
reg clk,rst,load;
wire sum,done,co;
sa dut(clk,rst,a,b,load,co,sum,done);

initial
begin
$display("starts");
rst=1'b1;
load=1'b0;
clk=1'b0;
#10;

rst=1'b0;

@(posedge(clk));
a=4'b1100;
b=4'b0011;
load=1'b1;

@(posedge(clk));
load=1'b0;
#100;

@(posedge(clk));
a=4'b1111;
b=4'b0011;
load=1'b1;

@(posedge(clk));
load=1'b0;
#100;

@(posedge(clk));
a=4'b1111;
b=4'b1111;
load=1'b1;

@(posedge(clk));
load=1'b0;
#100;
$stop();
$display("done");
end

always #5 clk=~clk;
initial begin
$monitor("time=%0t clk=%b a=%b b=%b sum=%b done=%b rst=%b load=%b",$time,clk,a,b,sum,done,rst,load);
end
endmodule

