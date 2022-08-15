module brentkung(a,b,cin,s,cout);
input[31:0] a,b;
input cin;
output[31:0] s;
output cout;
wire [32:0] c;
wire[31:0] pp1,gg1;
wire[15:0] pp2,gg2;
wire[7:0] pp3,gg3;
wire[3:0] pp4,gg4;
wire[1:0] pp5,gg5;
wire [0:0]pp6,gg6;
assign c[0]=cin;
genvar i;
generate
for(i=0;i<=31;i=i+1)
begin: a1
assign pp1[i]=a[i] ^ b[i];
assign gg1[i]=a[i] & b[i];

end
endgenerate

generate
for(i=0;i<=15;i=i+1)
begin : a2
assign pp2[i]= pp1[2*i+1] & pp1[2*i];
assign gg2[i]= gg1[2*i+1]| (pp1[2*i+1] & gg1[2*i]);
end
endgenerate

generate
for(i=0;i<=7;i=i+1)
begin: a3
assign pp3[i]= pp2[2*i+1] & pp2[2*i];
assign gg3[i]=gg2[2*i+1]| (pp2[2*i+1] & gg2[2*i]);
end
endgenerate

generate
for(i=0;i<=3;i=i+1)
begin: a4
assign pp4[i]=pp3[2*i+1] & pp3[2*i];
assign gg4[i]=gg3[2*i+1] |  (pp3[2*i+1] & gg3[2*i]);
end
endgenerate

generate
for(i=0;i<=1;i=i+1)
begin: a5
assign pp5[i]=pp4[2*i+1] & pp4[2*i];
assign gg5[i]=gg4[2*i+1] |  (pp4[2*i+1] & gg4[2*i]);
end
endgenerate

generate
for(i=0;i<=0;i=i+1)
begin: a6
assign pp6[i]=pp5[2*i+1] & pp5[2*i];
assign gg6[i]=gg5[2*i+1] |  (pp5[2*i+1] & gg5[2*i]);
end
endgenerate

assign c[1]= gg1[0] | ( pp1[0] & c[0]);
assign c[2]= gg2[0] | ( pp2[0] & c[0]);
assign c[4]= gg3[0] | ( pp3[0] & c[0]);
assign c[8]= gg4[0] | ( pp4[0] & c[0]);
assign c[16]= gg5[0] | ( pp5[0] & c[0]);
assign c[32]= gg6[0] | ( pp6[0] & c[0]);

assign c[3]=gg1[2] | (pp1[2] & c[2]);
assign c[5]= gg1[4] | ( pp1[4] & c[4]);
assign c[6]= gg2[2] | ( pp2[2] & c[4]);
assign c[9]= gg1[8] | ( pp1[8] & c[8]);
assign c[10]= gg2[4] | ( pp2[4] & c[8]);
assign c[12]= gg3[2] | ( pp3[2] & c[8]);


assign c[13]= gg1[12] | ( pp1[12] & c[12]);
assign c[7]= gg1[6] | ( pp1[6] & c[6]);
assign c[11]= gg1[10] | ( pp1[10] & c[10]);
assign c[14]= gg2[6] | ( pp2[6] & c[12]);


assign c[15]= gg1[14] | ( pp1[14] & c[14]);
assign c[17]= gg1[16] | ( pp1[16] & c[16]);
assign c[18]= gg2[8] | ( pp2[8] & c[16]);
assign c[20]= gg3[4] | ( pp3[4] & c[16]);

assign c[19]= gg1[18] | ( pp1[18] & c[18]);
assign c[21]= gg1[20] | ( pp1[20] & c[20]);
assign c[22]= gg2[10] | ( pp2[10] & c[20]);
assign c[24]= gg3[5] | ( pp3[5] & c[20]);

assign c[23]= gg1[22] | ( pp1[22] & c[22]);
assign c[25]= gg1[24] | ( pp1[24] & c[24]);
assign c[26]= gg2[12] | ( pp2[12] & c[24]);
assign c[28]= gg3[6] | ( pp3[6] & c[24]);

assign c[27]= gg1[26] | ( pp1[26] & c[26]);
assign c[29]= gg1[28] | ( pp1[28] & c[28]);
assign c[30]= gg2[14] | ( pp2[14] & c[28]);

assign c[31]= gg1[30] | ( pp1[30] & c[30]);

generate
for(i=0;i<=31;i=i+1)
begin: a9
assign s[i]= pp1[i] ^ c[i];
end
endgenerate


assign  cout=c[32];


endmodule