
module busT0 ( ck, rst, A, B, C );
  input [7:0] A;
  output [8:0] B;
  output [7:0] C;
  input ck, rst;
  wire   N14, N15, N16, N17, N18, N19, N20, N21, N24, N25, N26, N27, N28, N29,
         N30, N31, n27, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73;
  wire   [7:0] Aold;
  wire   [7:2] add_49_carry;
  wire   [7:2] add_39_carry;

  DFFR_X1 Aold_reg_7_ ( .D(N21), .CK(ck), .RN(n72), .Q(Aold[7]) );
  DFFR_X1 Aold_reg_6_ ( .D(N20), .CK(ck), .RN(n72), .Q(Aold[6]) );
  DFFR_X1 Aold_reg_5_ ( .D(N19), .CK(ck), .RN(n72), .Q(Aold[5]) );
  DFFR_X1 Aold_reg_4_ ( .D(N18), .CK(ck), .RN(n72), .Q(Aold[4]) );
  DFFR_X1 Aold_reg_3_ ( .D(N17), .CK(ck), .RN(n72), .Q(Aold[3]) );
  DFFR_X1 Aold_reg_2_ ( .D(N16), .CK(ck), .RN(n72), .Q(Aold[2]) );
  DFFR_X1 Aold_reg_1_ ( .D(N15), .CK(ck), .RN(n72), .Q(Aold[1]) );
  DFFR_X1 Aold_reg_0_ ( .D(N14), .CK(ck), .RN(n72), .Q(Aold[0]) );
  DFFR_X1 T0_reg ( .D(n73), .CK(ck), .RN(n72), .Q(B[8]), .QN(n27) );
  DFFR_X1 buss_reg_3_ ( .D(n49), .CK(ck), .RN(n72), .Q(B[3]) );
  DFFR_X1 buss_reg_2_ ( .D(n50), .CK(ck), .RN(n72), .Q(B[2]) );
  DFFR_X1 buss_reg_1_ ( .D(n51), .CK(ck), .RN(n72), .Q(B[1]) );
  DFFR_X1 buss_reg_0_ ( .D(n52), .CK(ck), .RN(n72), .Q(B[0]) );
  DFFR_X1 buss_reg_7_ ( .D(n45), .CK(ck), .RN(n72), .Q(B[7]) );
  DFFR_X1 buss_reg_6_ ( .D(n46), .CK(ck), .RN(n72), .Q(B[6]) );
  DFFR_X1 buss_reg_5_ ( .D(n47), .CK(ck), .RN(n72), .Q(B[5]) );
  DFFR_X1 buss_reg_4_ ( .D(n48), .CK(ck), .RN(n72), .Q(B[4]) );
  DFFR_X1 count_reg_0_ ( .D(n44), .CK(ck), .RN(n72), .Q(C[0]) );
  DFFR_X1 count_reg_1_ ( .D(n43), .CK(ck), .RN(n72), .Q(C[1]) );
  DFFR_X1 count_reg_2_ ( .D(n42), .CK(ck), .RN(n72), .Q(C[2]) );
  DFFR_X1 count_reg_3_ ( .D(n41), .CK(ck), .RN(n72), .Q(C[3]) );
  DFFR_X1 count_reg_4_ ( .D(n40), .CK(ck), .RN(n72), .Q(C[4]) );
  DFFR_X1 count_reg_5_ ( .D(n39), .CK(ck), .RN(n72), .Q(C[5]) );
  DFFR_X1 count_reg_6_ ( .D(n38), .CK(ck), .RN(n72), .Q(C[6]) );
  DFFR_X1 count_reg_7_ ( .D(n37), .CK(ck), .RN(n72), .Q(C[7]) );
  DFFR_X1 Abus_reg_7_ ( .D(n45), .CK(ck), .RN(n72), .Q(n64) );
  DFFR_X1 Abus_reg_6_ ( .D(n46), .CK(ck), .RN(n72), .Q(n65) );
  DFFR_X1 Abus_reg_5_ ( .D(n47), .CK(ck), .RN(n72), .Q(n66) );
  DFFR_X1 Abus_reg_4_ ( .D(n48), .CK(ck), .RN(n72), .Q(n67) );
  DFFR_X1 Abus_reg_3_ ( .D(n49), .CK(ck), .RN(n72), .Q(n68) );
  DFFR_X1 Abus_reg_2_ ( .D(n50), .CK(ck), .RN(n72), .Q(n69) );
  DFFR_X1 Abus_reg_1_ ( .D(n51), .CK(ck), .RN(n72), .Q(n70) );
  DFFR_X1 Abus_reg_0_ ( .D(n52), .CK(ck), .RN(n72), .Q(n71) );
  INV_X2 U38 ( .A(rst), .ZN(n72) );
  MUX2_X1 U39 ( .A(n71), .B(A[0]), .S(n73), .Z(n52) );
  MUX2_X1 U40 ( .A(n70), .B(A[1]), .S(n73), .Z(n51) );
  MUX2_X1 U41 ( .A(n69), .B(A[2]), .S(n73), .Z(n50) );
  MUX2_X1 U42 ( .A(n68), .B(A[3]), .S(n73), .Z(n49) );
  MUX2_X1 U43 ( .A(n67), .B(A[4]), .S(n73), .Z(n48) );
  MUX2_X1 U44 ( .A(n66), .B(A[5]), .S(n73), .Z(n47) );
  MUX2_X1 U45 ( .A(n65), .B(A[6]), .S(n73), .Z(n46) );
  MUX2_X1 U46 ( .A(n64), .B(A[7]), .S(n73), .Z(n45) );
  NAND2_X1 U47 ( .A1(n54), .A2(n55), .ZN(n73) );
  NOR4_X1 U48 ( .A1(n56), .A2(n57), .A3(n58), .A4(n59), .ZN(n55) );
  XOR2_X1 U49 ( .A(Aold[7]), .B(A[7]), .Z(n59) );
  XOR2_X1 U50 ( .A(Aold[2]), .B(A[2]), .Z(n58) );
  XOR2_X1 U51 ( .A(Aold[1]), .B(A[1]), .Z(n57) );
  XOR2_X1 U52 ( .A(Aold[0]), .B(A[0]), .Z(n56) );
  NOR4_X1 U53 ( .A1(n60), .A2(n61), .A3(n62), .A4(n63), .ZN(n54) );
  XOR2_X1 U54 ( .A(Aold[6]), .B(A[6]), .Z(n63) );
  XOR2_X1 U55 ( .A(Aold[5]), .B(A[5]), .Z(n62) );
  XOR2_X1 U56 ( .A(Aold[4]), .B(A[4]), .Z(n61) );
  XOR2_X1 U57 ( .A(Aold[3]), .B(A[3]), .Z(n60) );
  MUX2_X1 U58 ( .A(B[0]), .B(N24), .S(n27), .Z(n44) );
  MUX2_X1 U59 ( .A(B[1]), .B(N25), .S(n27), .Z(n43) );
  MUX2_X1 U60 ( .A(B[2]), .B(N26), .S(n27), .Z(n42) );
  MUX2_X1 U61 ( .A(B[3]), .B(N27), .S(n27), .Z(n41) );
  MUX2_X1 U62 ( .A(B[4]), .B(N28), .S(n27), .Z(n40) );
  MUX2_X1 U63 ( .A(B[5]), .B(N29), .S(n27), .Z(n39) );
  MUX2_X1 U64 ( .A(B[6]), .B(N30), .S(n27), .Z(n38) );
  MUX2_X1 U65 ( .A(B[7]), .B(N31), .S(n27), .Z(n37) );
  XOR2_X1 add_49_U2 ( .A(add_49_carry[7]), .B(C[7]), .Z(N31) );
  INV_X1 add_49_U1 ( .A(C[0]), .ZN(N24) );
  HA_X1 add_49_U1_1_1 ( .A(C[1]), .B(C[0]), .CO(add_49_carry[2]), .S(N25) );
  HA_X1 add_49_U1_1_2 ( .A(C[2]), .B(add_49_carry[2]), .CO(add_49_carry[3]), 
        .S(N26) );
  HA_X1 add_49_U1_1_3 ( .A(C[3]), .B(add_49_carry[3]), .CO(add_49_carry[4]), 
        .S(N27) );
  HA_X1 add_49_U1_1_4 ( .A(C[4]), .B(add_49_carry[4]), .CO(add_49_carry[5]), 
        .S(N28) );
  HA_X1 add_49_U1_1_5 ( .A(C[5]), .B(add_49_carry[5]), .CO(add_49_carry[6]), 
        .S(N29) );
  HA_X1 add_49_U1_1_6 ( .A(C[6]), .B(add_49_carry[6]), .CO(add_49_carry[7]), 
        .S(N30) );
  XOR2_X1 add_39_U2 ( .A(add_39_carry[7]), .B(A[7]), .Z(N21) );
  INV_X1 add_39_U1 ( .A(A[0]), .ZN(N14) );
  HA_X1 add_39_U1_1_1 ( .A(A[1]), .B(A[0]), .CO(add_39_carry[2]), .S(N15) );
  HA_X1 add_39_U1_1_2 ( .A(A[2]), .B(add_39_carry[2]), .CO(add_39_carry[3]), 
        .S(N16) );
  HA_X1 add_39_U1_1_3 ( .A(A[3]), .B(add_39_carry[3]), .CO(add_39_carry[4]), 
        .S(N17) );
  HA_X1 add_39_U1_1_4 ( .A(A[4]), .B(add_39_carry[4]), .CO(add_39_carry[5]), 
        .S(N18) );
  HA_X1 add_39_U1_1_5 ( .A(A[5]), .B(add_39_carry[5]), .CO(add_39_carry[6]), 
        .S(N19) );
  HA_X1 add_39_U1_1_6 ( .A(A[6]), .B(add_39_carry[6]), .CO(add_39_carry[7]), 
        .S(N20) );
endmodule

