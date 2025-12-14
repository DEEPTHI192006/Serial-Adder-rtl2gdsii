module fa(a,b,c,s,cy);
input a,b,c;
output s,cy;
assign s=a^b^c;
assign cy=(a&b)|(c&b)|(c&a);
endmodule

module sa(clk,rst,a,b,load,co,sum,done);
input [3:0] a,b;
input load,clk,rst;
output reg sum,done;
output reg co;
reg [3:0]a_reg,b_reg;
wire s,cy;
reg [2:0] count;

fa f1(.a(a_reg[0]),.b(b_reg[0]),.c(co),.s(s),.cy(cy));

always@(posedge(clk))
begin
if(rst)
begin
a_reg<=0;
b_reg<=0;
count<=0;
sum<=0;
done<=0;
co<=0;
end

else if(load)
begin
a_reg<=a;
b_reg<=b;
co<=0;
count<=3'b000;
sum<=0;
done<=0;

end
else if(count<3'b100)
begin
sum<=s;
co<=cy;
a_reg<={1'b0,a_reg[3:1]};
b_reg<={1'b0,b_reg[3:1]};
count<=count+1;
done<=0;
end
else 
done<=(count==3'b100);
end
endmodule
