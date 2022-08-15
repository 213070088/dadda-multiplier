module dadda(a,b,mul_out);
input [15:0]a;
input [15:0]b;
output [31:0] mul_out;
wire cout,cin;
wire [15:0] ppp1;

wire [16:1]ppp2;
wire [17:2]ppp3;
wire [18:3]ppp4;
wire [19:4]ppp5;
wire [20:5]ppp6;
wire [21:6]ppp7;
wire [22:7]ppp8;
wire [23:8]ppp9;
wire [24:9]ppp10;
wire [25:10]ppp11;
wire [26:11]ppp12;
wire [27:12]ppp13;
wire [28:13]ppp14;
wire [29:14]ppp15;
wire [30:15]ppp16;
genvar i;

wire [18:13]qq0;
wire [19:14]qq1;
wire [17:14]qq2;
wire [18:15]qq3;
wire [16:15]qq4;
wire [17:16]qq5;


wire [22:9]rr0;
wire [23:10]rr1;
wire [21:10]rr2;
wire [22:11]rr3;
wire [20:11]rr4;
wire [21:12]rr5;
wire [19:12] rr6;
wire [20:13] rr7;
//wire [23:8] r8;




wire [25:6] ss0;
wire [26:7] ss1;
wire [24:7] ss2;
wire [25:8] ss3;
wire [23:8] ss4;
wire [24:9] ss5;

wire [27:4]tt0;
wire [28:5]tt1;
wire [26:5]tt2;
wire [27:6]tt3;

wire [28:3]uu0;
wire [29:4]uu1;
wire [31:0]vv0;
wire [31:0]vv1;


//partial products :

generate 
for(i=0;i<=15;i=i+1)begin : dhanu
assign ppp1[i]= a[i] & b[0];
assign ppp2[i+1]= a[i] & b[1];
assign ppp3[i+2]= a[i] & b[2];
assign ppp4[i+3]= a[i] & b[3];
assign ppp5[i+4]= a[i] & b[4];
assign ppp6[i+5]= a[i] & b[5];
assign ppp7[i+6]= a[i] & b[6];
assign ppp8[i+7]= a[i] & b[7];
assign ppp9[i+8]= a[i] & b[8];
assign ppp10[i+9]= a[i] & b[9];
assign ppp11[i+10]= a[i] & b[10];
assign ppp12[i+11]= a[i] & b[11];
assign ppp13[i+12]= a[i] & b[12];
assign ppp14[i+13]= a[i] & b[13];
assign ppp15[i+14]= a[i] & b[14];
assign ppp16[i+15]= a[i] & b[15];
end
endgenerate


//Intializing values:

 assign vv0[0] = ppp1[0];

 assign vv1[0]= 1'b0;
 
 assign vv0[1]=ppp1[1];

 assign vv1[1]=ppp2[1];

 assign vv1[2]=ppp3[2];

 assign vv0[30]=ppp16[30];

 assign vv0[31]=1'b0;

 assign vv1[31]=1'b0;
 

//1st layer addition 

ha ha13(ppp1[13],ppp2[13],qq0[13],qq1[14]);

fa fa14(ppp1[14],ppp2[14],ppp3[14],qq0[14],qq1[15]);
ha ha14(ppp4[14],ppp5[14],qq2[14],qq3[15]);

fa fa15_1(ppp1[15],ppp2[15],ppp3[15],qq0[15],qq1[16]);
fa fa15_2(ppp4[15],ppp5[15],ppp6[15],qq2[15],qq3[16]);
ha ha15(ppp7[15],ppp8[15],qq4[15],qq5[16]);

fa fa16_1(ppp2[16],ppp3[16],ppp4[16],qq0[16],qq1[17]);
fa fa16_2(ppp5[16],ppp6[16],ppp7[16],qq2[16],qq3[17]);
ha ha16(ppp8[16],ppp9[16],qq4[16],qq5[17]);

fa fa17_1(ppp3[17],ppp4[17],ppp5[17],qq0[17],qq1[18]);
fa fa17_2(ppp6[17],ppp7[17],ppp8[17],qq2[17],qq3[18]);

fa fa18(ppp4[18],ppp5[18],ppp6[18],qq0[18],qq1[19]);

//2nd layer addition(ha9_2 implies 9th clmn and its is for layerr2)

ha ha9_2(ppp1[9],ppp2[9],rr0[9],rr1[10]);

fa fa10_2(ppp1[10],ppp2[10],ppp3[10],rr0[10],rr1[11]);
ha ha10_2(ppp4[10],ppp5[10],rr2[10],rr3[11]);

fa fa11a_2(ppp1[11],ppp2[11],ppp3[11],rr0[11],rr1[12]);
fa fa11b_2(ppp4[11],ppp5[11],ppp6[11],rr2[11],rr3[12]);
ha ha11_2(ppp7[11],ppp8[11],rr4[11],rr5[12]);

fa fa12a_2(ppp1[12],ppp2[12],ppp3[12],rr0[12],rr1[13]);
fa fa12b_2(ppp4[12],ppp5[12],ppp6[12],rr2[12],rr3[13]);
fa fa12c_2(ppp7[12],ppp8[12],ppp9[12],rr4[12],rr5[13]);
ha ha12_2(ppp10[12],ppp11[12],rr6[12],rr7[13]);


fa fa13a_2(ppp3[13],ppp4[13],ppp5[13],rr0[13],rr1[14]);
fa fa13b_2(ppp6[13],ppp7[13],ppp8[13],rr2[13],rr3[14]);
fa fa13c_2(ppp9[13],ppp10[13],ppp11[13],rr4[13],rr5[14]);
fa fa13d_2(ppp12[13],ppp13[13],ppp14[13],rr6[13],rr7[14]);


fa fa14a_2(qq0[14],qq2[14],ppp6[14],rr0[14],rr1[15]);
fa fa14b_2(ppp7[14],ppp8[14],ppp9[14],rr2[14],rr3[15]);
fa fa14c_2(ppp10[14],ppp11[14],ppp12[14],rr4[14],rr5[15]);
fa fa14d_2(ppp13[14],ppp14[14],ppp15[14],rr6[14],rr7[15]);


fa fa15a_2(qq0[15],qq1[15],qq2[15],rr0[15],rr1[16]);
fa fa15b_2(ppp10[15],ppp9[15],qq4[15],rr2[15],rr3[16]);
fa fa15c_2(ppp12[15],ppp13[15],ppp11[15],rr4[15],rr5[16]);
fa fa15d_2(ppp14[15],ppp15[15],ppp16[15],rr6[15],rr7[16]);

fa fa16a_2(qq0[16],qq1[16],qq2[16],rr0[16],rr1[17]);
fa fa16b_2(ppp10[16],qq4[16],qq5[16],rr2[16],rr3[17]);
fa fa16c_2(ppp12[16],ppp13[16],ppp11[16],rr4[16],rr5[17]);
fa fa16d_2(ppp14[16],ppp15[16],ppp16[16],rr6[16],rr7[17]);





fa fa17a_2(qq0[17],qq1[17],qq2[17],rr0[17],rr1[18]);
fa fa17b_2(ppp9[17],ppp10[17],qq5[17],rr2[17],rr3[18]);
fa fa17c_2(ppp11[17],ppp12[17],ppp13[17],rr4[17],rr5[18]);
fa fa17d_2(ppp14[17],ppp15[17],ppp16[17],rr6[17],rr7[18]);





fa fa18a_2(qq0[18],qq1[18],ppp7[18],rr0[18],rr1[19]);
fa fa18b_2(ppp8[18],ppp9[18],ppp10[18],rr2[18],rr3[19]);
fa fa18c_2(ppp11[18],ppp12[18],ppp13[18],rr4[18],rr5[19]);
fa fa18d_2(ppp14[18],ppp15[18],ppp16[18],rr6[18],rr7[19]);


fa fa19a_2(ppp5[19],ppp6[19],ppp7[19],rr0[19],rr1[20]);
fa fa19b_2(ppp8[19],ppp9[19],ppp10[19],rr2[19],rr3[20]);
fa fa19c_2(ppp11[19],ppp12[19],ppp13[19],rr4[19],rr5[20]);
fa fa19d_2(ppp14[19],ppp15[19],ppp16[19],rr6[19],rr7[20]);

fa fa20a_2(ppp6[20],ppp7[20],ppp8[20],rr0[20],rr1[21]);
fa fa20b_2(ppp9[20],ppp10[20],ppp11[20],rr2[20],rr3[21]);
fa fa20c_2(ppp12[20],ppp13[20],ppp14[20],rr4[20],rr5[21]);

fa fa21a_2(ppp9[21],ppp7[21],ppp8[21],rr0[21],rr1[22]);
fa fa21b_2(ppp12[21],ppp10[21],ppp11[21],rr2[21],rr3[22]);


fa fa22a_2(ppp10[22],ppp8[22],ppp9[22],rr0[22],rr1[23]);


//3rd addition

ha ha6_3(ppp1[6],ppp2[6],ss0[6],ss1[7]);

fa fa7a_3(ppp1[7],ppp2[7],ppp3[7],ss0[7],ss1[8]);
ha ha7b_3(ppp4[7],ppp5[7],ss2[7],ss3[8]);


fa fa8a_3(ppp1[8],ppp2[8],ppp3[8],ss0[8],ss1[9]);
fa fa8b_3(ppp4[8],ppp5[8],ppp6[8],ss2[8],ss3[9]);
ha ha8c_3(ppp7[8],ppp8[8],ss4[8],ss5[9]);

fa fa9a_3(ppp3[9],ppp4[9],rr0[9],ss0[9],ss1[10]);
fa fa9b_3(ppp5[9],ppp6[9],ppp7[9],ss2[9],ss3[10]);
fa fa9c_3(ppp8[9],ppp9[9],ppp10[9],ss4[9],ss5[10]);

fa fa10a_3(rr0[10],rr1[10],rr2[10],ss0[10],ss1[11]);
fa fa10b_3(ppp8[10],ppp6[10],ppp7[10],ss2[10],ss3[11]);
fa fa10c_3(ppp11[10],ppp9[10],ppp10[10],ss4[10],ss5[11]);

fa fa11a_3(rr0[11],rr1[11],rr2[11],ss0[11],ss1[12]);
fa fa11b_3(rr3[11],rr4[11],ppp9[11],ss2[11],ss3[12]);
fa fa11c_3(ppp10[11],ppp11[11],ppp12[11],ss4[11],ss5[12]);

fa fa12a_3(rr0[12],rr1[12],rr2[12],ss0[12],ss1[13]);
fa fa12b_3(rr3[12],rr4[12],rr5[12],ss2[12],ss3[13]);
fa fa12c_3(rr6[12],ppp12[12],ppp13[12],ss4[12],ss5[13]);



fa fa13a_3(rr0[13],rr1[13],rr2[13],ss0[13],ss1[14]);
fa fa13b_3(rr3[13],rr4[13],rr5[13],ss2[13],ss3[14]);
fa fa13c_3(rr6[13],rr7[13],qq0[13],ss4[13],ss5[14]);

fa fa14a_3(rr0[14],rr1[14],rr2[14],ss0[14],ss1[15]);
fa fa14b_3(rr3[14],rr4[14],rr5[14],ss2[14],ss3[15]);
fa fa14c_3(rr6[14],rr7[14],qq1[14],ss4[14],ss5[15]);

fa fa15a_3(rr0[15],rr1[15],rr2[15],ss0[15],ss1[16]);
fa fa15b_3(rr3[15],rr4[15],rr5[15],ss2[15],ss3[16]);
fa fa15c_3(rr6[15],rr7[15],qq3[15],ss4[15],ss5[16]);



fa fa16a_3(rr0[16],rr1[16],rr2[16],ss0[16],ss1[17]);
fa fa16b_3(rr3[16],rr4[16],rr5[16],ss2[16],ss3[17]);
fa fa16c_3(rr6[16],rr7[16],qq3[16],ss4[16],ss5[17]);

fa fa17a_3(rr0[17],rr1[17],rr2[17],ss0[17],ss1[18]);
fa fa17b_3(rr3[17],rr4[17],rr5[17],ss2[17],ss3[18]);
fa fa17c_3(rr6[17],rr7[17],qq3[17],ss4[17],ss5[18]);


fa fa18a_3(rr0[18],rr1[18],rr2[18],ss0[18],ss1[19]);
fa fa18b_3(rr3[18],rr4[18],rr5[18],ss2[18],ss3[19]);
fa fa18c_3(rr6[18],rr7[18],qq3[18],ss4[18],ss5[19]);

fa fa19a_3(rr0[19],rr1[19],rr2[19],ss0[19],ss1[20]);
fa fa19b_3(rr3[19],rr4[19],rr5[19],ss2[19],ss3[20]);
fa fa19c_3(rr6[19],rr7[19],qq1[19],ss4[19],ss5[20]);


fa fa20a_3(rr0[20],rr1[20],rr2[20],ss0[20],ss1[21]);
fa fa20b_3(rr3[20],rr4[20],rr5[20],ss2[20],ss3[21]);
fa fa20c_3(rr7[20],ppp15[20],ppp16[20],ss4[20],ss5[21]);

fa fa21a_3(rr0[21],rr1[21],rr2[21],ss0[21],ss1[22]);
fa fa21b_3(rr3[21],rr5[21],ppp13[21],ss2[21],ss3[22]);
fa fa21c_3(ppp14[21],ppp15[21],ppp16[21],ss4[21],ss5[22]);


fa fa22a_3(rr0[22],rr1[22],ppp11[22],ss0[22],ss1[23]);
fa fa22b_3(rr3[22],ppp12[22],ppp13[22],ss2[22],ss3[23]);
fa fa22c_3(ppp14[22],ppp15[22],ppp16[22],ss4[22],ss5[23]);

fa fa23a_3(rr1[23],ppp9[23],ppp10[23],ss0[23],ss1[24]);
fa fa23b_3(ppp11[23],ppp12[23],ppp13[23],ss2[23],ss3[24]);
fa fa23c_3(ppp14[23],ppp15[23],ppp16[23],ss4[23],ss5[24]);

fa fa24a_3(ppp10[24],ppp11[24],ppp12[24],ss0[24],ss1[25]);
//doubt 2 times ppp14 used

fa fa24b_3(ppp13[24],ppp14[24],ppp15[24],ss2[24],ss3[25]);

fa fa25_3(ppp11[25],ppp12[25],ppp13[25],ss0[25],ss1[26]);


//4th stage addition

ha ha4a_4(ppp1[4],ppp2[4],tt0[4],tt1[5]);

fa fa5a_4(ppp1[5],ppp2[5],ppp3[5],tt0[5],tt1[6]);
ha ha5b_4(ppp4[5],ppp5[5],tt2[5],tt3[6]);

fa fa6a_4(ss0[6],ppp3[6],ppp4[6],tt0[6],tt1[7]);
fa fa6b_4(ppp5[6],ppp6[6],ppp7[6],tt2[6],tt3[7]);

fa fa7a_4(ss0[7],ss1[7],ss2[7],tt0[7],tt1[8]);
fa fa7b_4(ppp6[7],ppp7[7],ppp8[7],tt2[7],tt3[8]);


fa fa8a_4(ss0[8],ss1[8],ss2[8],tt0[8],tt1[9]);
fa fa8b_4(ss3[8],ss4[8],ppp9[8],tt2[8],tt3[9]);


fa fa9a_4(ss0[9],ss1[9],ss2[9],tt0[9],tt1[10]);
fa fa9b_4(ss3[9],ss4[9],ss5[9],tt2[9],tt3[10]);

fa fa10a_4(ss0[10],ss1[10],ss2[10],tt0[10],tt1[11]);
fa fa10b_4(ss3[10],ss4[10],ss5[10],tt2[10],tt3[11]);

fa fa11a_4(ss0[11],ss1[11],ss2[11],tt0[11],tt1[12]);
fa fa11b_4(ss3[11],ss4[11],ss5[11],tt2[11],tt3[12]);

fa fa12a_4(ss0[12],ss1[12],ss2[12],tt0[12],tt1[13]);
fa fa12b_4(ss3[12],ss4[12],ss5[12],tt2[12],tt3[13]);


fa fa13a_4(ss0[13],ss1[13],ss2[13],tt0[13],tt1[14]);
fa fa13b_4(ss3[13],ss4[13],ss5[13],tt2[13],tt3[14]);

fa fa14a_4(ss0[14],ss1[14],ss2[14],tt0[14],tt1[15]);
fa fa14b_4(ss3[14],ss4[14],ss5[14],tt2[14],tt3[15]);

fa fa15a_4(ss0[15],ss1[15],ss2[15],tt0[15],tt1[16]);
fa fa15b_4(ss3[15],ss4[15],ss5[15],tt2[15],tt3[16]);

fa fa16a_4(ss0[16],ss1[16],ss2[16],tt0[16],tt1[17]);
fa fa16b_4(ss3[16],ss4[16],ss5[16],tt2[16],tt3[17]);

fa fa17a_4(ss0[17],ss1[17],ss2[17],tt0[17],tt1[18]);
fa fa17b_4(ss3[17],ss4[17],ss5[17],tt2[17],tt3[18]);

fa fa18a_4(ss0[18],ss1[18],ss2[18],tt0[18],tt1[19]);
fa fa18b_4(ss3[18],ss4[18],ss5[18],tt2[18],tt3[19]);

fa fa19a_4(ss0[19],ss1[19],ss2[19],tt0[19],tt1[20]);
fa fa19b_4(ss3[19],ss4[19],ss5[19],tt2[19],tt3[20]);

fa fa20a_4(ss0[20],ss1[20],ss2[20],tt0[20],tt1[21]);
fa fa20b_4(ss3[20],ss4[20],ss5[20],tt2[20],tt3[21]);


fa fa21a_4(ss0[21],ss1[21],ss2[21],tt0[21],tt1[22]);
fa fa21b_4(ss3[21],ss4[21],ss5[21],tt2[21],tt3[22]);

fa fa22a_4(ss0[22],ss1[22],ss2[22],tt0[22],tt1[23]);
fa fa22_4(ss3[22],ss4[22],ss5[22],tt2[22],tt3[23]);

fa fa23a_4(ss0[23],ss1[23],ss2[23],tt0[23],tt1[24]);
fa fa23_4(ss3[23],ss4[23],ss5[23],tt2[23],tt3[24]);

fa fa24a_4(ss0[24],ss1[24],ss2[24],tt0[24],tt1[25]);
fa fa24_4(ss3[24],ppp16[24],ss5[24],tt2[24],tt3[25]);


fa fa25a_4(ss0[25],ss1[25],ppp14[25],tt0[25],tt1[26]);
fa fa25_4(ss3[25],ppp15[25],ppp16[25],tt2[25],tt3[26]);


fa fa26a_4(ss1[26],ppp12[26],ppp13[26],tt0[26],tt1[27]);
fa fa26_4(ppp14[26],ppp15[26],ppp16[26],tt2[26],tt3[27]);



fa fa27_4(ppp13[27],ppp14[27],ppp15[27],tt0[27],tt1[28]);


//fifth stage addition

ha ha3a_5(ppp1[3],ppp2[3],uu0[3],uu1[4]);

fa fa4a_5(ppp3[4],ppp4[4],ppp5[4],uu0[4],uu1[5]);

fa fa5a_5(tt1[5],tt2[5],ppp6[5],uu0[5],uu1[6]);

fa fa6a_5(tt0[6],tt1[6],tt2[6],uu0[6],uu1[7]);

fa fa7_5(tt0[7],tt1[7],tt2[7],uu0[7],uu1[8]);
fa fa8_5(tt0[8],tt1[8],tt2[8],uu0[8],uu1[9]);
fa fa9_5(tt0[9],tt1[9],tt2[9],uu0[9],uu1[10]);
fa fa10_5(tt0[10],tt1[10],tt2[10],uu0[10],uu1[11]);
fa fa11_5(tt0[11],tt1[11],tt2[11],uu0[11],uu1[12]);
fa fa12_5(tt0[12],tt1[12],tt2[12],uu0[12],uu1[13]);
fa fa13_5(tt0[13],tt1[13],tt2[13],uu0[13],uu1[14]);
fa fa14_5(tt0[14],tt1[14],tt2[14],uu0[14],uu1[15]);
fa fa15_5(tt0[15],tt1[15],tt2[15],uu0[15],uu1[16]);
fa fa16_5(tt0[16],tt1[16],tt2[16],uu0[16],uu1[17]);
fa fa17_5(tt0[17],tt1[17],tt2[17],uu0[17],uu1[18]);
fa fa18_5(tt0[18],tt1[18],tt2[18],uu0[18],uu1[19]);
fa fa19_5(tt0[19],tt1[19],tt2[19],uu0[19],uu1[20]);
fa fa20_5(tt0[20],tt1[20],tt2[20],uu0[20],uu1[21]);
fa fa21_5(tt0[21],tt1[21],tt2[21],uu0[21],uu1[22]);
fa fa22_5(tt0[22],tt1[22],tt2[22],uu0[22],uu1[23]);
fa fa23_5(tt0[23],tt1[23],tt2[23],uu0[23],uu1[24]);
fa fa24_5(tt0[24],tt1[24],tt2[24],uu0[24],uu1[25]);
fa fa25_5(tt0[25],tt1[25],tt2[25],uu0[25],uu1[26]);
fa fa26_5(tt0[26],tt1[26],tt2[26],uu0[26],uu1[27]);
fa fa27_5(tt0[27],tt1[27],ppp16[27],uu0[27],uu1[28]);

fa fa28_5(tt1[28],ppp14[28],ppp15[28],uu0[28],uu1[29]);


//6th stage addition

ha ha2_6(ppp1[2],ppp2[2],vv0[2],vv1[3]);

fa fa3_6(uu0[3],ppp3[3],ppp4[3],vv0[3],vv1[4]);

fa fa4_6(uu0[4],uu1[4],tt0[4],vv0[4],vv1[5]);

fa fa5_6(uu0[5],uu1[5],tt0[5],vv0[5],vv1[6]);

fa fa6_6(uu0[6],uu1[6],tt3[6],vv0[6],vv1[7]);

fa fa7_6(uu0[7],uu1[7],tt3[7],vv0[7],vv1[8]);
fa fa8_6(uu0[8],uu1[8],tt3[8],vv0[8],vv1[9]);
fa fa9_6(uu0[9],uu1[9],tt3[9],vv0[9],vv1[10]);
fa fa10_6(uu0[10],uu1[10],tt3[10],vv0[10],vv1[11]);
fa fa11_6(uu0[11],uu1[11],tt3[11],vv0[11],vv1[12]);
fa fa12_6(uu0[12],uu1[12],tt3[12],vv0[12],vv1[13]);
fa fa13_6(uu0[13],uu1[13],tt3[13],vv0[13],vv1[14]);
fa fa14_6(uu0[14],uu1[14],tt3[14],vv0[14],vv1[15]);
fa fa15_6(uu0[15],uu1[15],tt3[15],vv0[15],vv1[16]);
fa fa16_6(uu0[16],uu1[16],tt3[16],vv0[16],vv1[17]);
fa fa17_6(uu0[17],uu1[17],tt3[17],vv0[17],vv1[18]);
fa fa18_6(uu0[18],uu1[18],tt3[18],vv0[18],vv1[19]);
fa fa19_6(uu0[19],uu1[19],tt3[19],vv0[19],vv1[20]);
fa fa20_6(uu0[20],uu1[20],tt3[20],vv0[20],vv1[21]);
fa fa21_6(uu0[21],uu1[21],tt3[21],vv0[21],vv1[22]);
fa fa22_6(uu0[22],uu1[22],tt3[22],vv0[22],vv1[23]);
fa fa23_6(uu0[23],uu1[23],tt3[23],vv0[23],vv1[24]);
fa fa24_6(uu0[24],uu1[24],tt3[24],vv0[24],vv1[25]);
fa fa25_6(uu0[25],uu1[25],tt3[25],vv0[25],vv1[26]);
fa fa26_6(uu0[26],uu1[26],tt3[26],vv0[26],vv1[27]);
fa fa27_6(uu0[27],uu1[27],tt3[27],vv0[27],vv1[28]);
fa fa28_6(uu0[28],uu1[28],ppp16[28],vv0[28],vv1[29]);
fa fa29_6(ppp15[29],uu1[29],ppp16[29],vv0[29],vv1[30]);


brentkung adder(vv0,vv1,1'b0,mul_out,cout);

//brent_kung16bit adderr1(vv0[15:0],vv1[15:0],b,sum,cin,carry);

 
 endmodule
 
 
 
 
 