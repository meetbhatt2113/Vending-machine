module singleVendMch(clk,rst,money,product,change);
input clk,rst;
input [1:0] money; //money can be 0(00), 25(01), 50(10) paise
output reg product=1'b0; //Product shows the output
output reg [1:0] change=2'b00;
parameter [1:0]s0 = 2'b00;
parameter [1:0]s25 = 2'b01;
parameter [1:0]s50 = 2'b10;
reg [1:0]cst=s0,nst=s0; // cst- current state nst- next state
always@(posedge clk)
begin
cst=nst;
if(rst)
begin
cst = s0;
nst = s0;
product=1'b0;
change=2'b00;
end
else
  begin case(cst) s0:
if(money == 2'b01) begin
nst = s25; product = 1'b0; change=2'b00; end
else if (money == 2'b10) begin
nst = s50; product = 1'b0; change = 2'b00; end
s25:
if(money == 2'b01)
begin
nst = s50; product = 1'b0; change=1'b00; 
end
else if (money == 2'b10) begin
nst = s0; product =1'b1; change = 2'b00; end
s50:
else

begin nst=s0;
product=1'b0; change = 2'b01; end

if(money == 2'b01)
begin
   nst = s0;
product = 1'b1; change=2'b00; end
else if (money == 2'b10) begin
nst = s0; product = 1'b1; change = 2'b01;


