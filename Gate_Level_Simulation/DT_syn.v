
module initialize_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module initialize_DW01_inc_1 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module initialize ( clk, rstn, sti_rd, sti_addr, sti_di, res_wr, res_addr, 
        res_do, initialize_done );
  output [9:0] sti_addr;
  input [15:0] sti_di;
  output [13:0] res_addr;
  output [7:0] res_do;
  input clk, rstn;
  output sti_rd, res_wr, initialize_done;
  wire   N21, N22, N23, N24, N49, N50, N51, N52, N54, N75, N76, N77, N79, N80,
         N81, N82, N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94,
         N95, N96, N97, N122, N123, N124, N125, N137, N138, N139, N140, N141,
         N142, N143, N144, N145, N146, N147, N148, N149, N150, N167, N168,
         N169, N170, N171, N172, N173, N174, N175, N176, n6, n7, n8, n12, n13,
         n14, n15, n16, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n1,
         n2, n3, n4, n5, n9, n10, n11, n17, n18, n19, n72, n73, n74, n75, n76,
         n77, n78, n79;
  wire   [2:0] state;
  wire   [2:0] nstate;
  wire   [0:15] buff;
  assign res_do[7] = 1'b0;
  assign res_do[6] = 1'b0;
  assign res_do[5] = 1'b0;
  assign res_do[4] = 1'b0;
  assign res_do[3] = 1'b0;
  assign res_do[2] = 1'b0;
  assign res_do[1] = 1'b0;

  DFFRX4 \state_reg[1]  ( .D(nstate[1]), .CK(clk), .RN(rstn), .Q(state[1]), 
        .QN(n7) );
  initialize_DW01_inc_0 add_270 ( .A(sti_addr), .SUM({N176, N175, N174, N173, 
        N172, N171, N170, N169, N168, N167}) );
  initialize_DW01_inc_1 r308 ( .A(res_addr), .SUM({N150, N149, N148, N147, 
        N146, N145, N144, N143, N142, N141, N140, N139, N138, N137}) );
  EDFFX1 \buff_reg[1]  ( .D(N96), .E(n3), .CK(clk), .Q(buff[1]) );
  EDFFX1 \buff_reg[5]  ( .D(N92), .E(n3), .CK(clk), .Q(buff[5]) );
  EDFFX1 \buff_reg[9]  ( .D(N88), .E(n3), .CK(clk), .Q(buff[9]) );
  EDFFX1 \buff_reg[13]  ( .D(N84), .E(n3), .CK(clk), .Q(buff[13]) );
  EDFFX1 \buff_reg[3]  ( .D(N94), .E(n3), .CK(clk), .Q(buff[3]) );
  EDFFX1 \buff_reg[7]  ( .D(N90), .E(n3), .CK(clk), .Q(buff[7]) );
  EDFFX1 \buff_reg[11]  ( .D(N86), .E(n3), .CK(clk), .Q(buff[11]) );
  EDFFX1 \buff_reg[15]  ( .D(N82), .E(n3), .CK(clk), .Q(buff[15]) );
  EDFFX1 \buff_reg[0]  ( .D(N97), .E(n3), .CK(clk), .Q(buff[0]) );
  EDFFX1 \buff_reg[4]  ( .D(N93), .E(n3), .CK(clk), .Q(buff[4]) );
  EDFFX1 \buff_reg[8]  ( .D(N89), .E(n3), .CK(clk), .Q(buff[8]) );
  EDFFX1 \buff_reg[12]  ( .D(N85), .E(n3), .CK(clk), .Q(buff[12]) );
  EDFFX1 \buff_reg[2]  ( .D(N95), .E(n3), .CK(clk), .Q(buff[2]) );
  EDFFX1 \buff_reg[6]  ( .D(N91), .E(n3), .CK(clk), .Q(buff[6]) );
  EDFFX1 \buff_reg[10]  ( .D(N87), .E(n3), .CK(clk), .Q(buff[10]) );
  EDFFX1 \buff_reg[14]  ( .D(N83), .E(n3), .CK(clk), .Q(buff[14]) );
  TLATX1 res_wr_reg ( .G(N76), .D(n1), .Q(res_wr) );
  TLATX1 \res_do_reg[0]  ( .G(N79), .D(N80), .Q(res_do[0]) );
  TLATX1 sti_rd_reg ( .G(N75), .D(n71), .Q(sti_rd) );
  TLATNX1 initialize_done_reg ( .D(n70), .GN(n34), .Q(initialize_done) );
  DFFQX1 \res_addr_reg[13]  ( .D(n46), .CK(clk), .Q(res_addr[13]) );
  DFFQX1 \buf_state_reg[2]  ( .D(N124), .CK(clk), .Q(N23) );
  DFFQX1 \buf_state_reg[3]  ( .D(N125), .CK(clk), .Q(N24) );
  DFFX1 \sti_addr_reg[7]  ( .D(n61), .CK(clk), .Q(sti_addr[7]), .QN(n12) );
  DFFX1 \sti_addr_reg[3]  ( .D(n65), .CK(clk), .Q(sti_addr[3]), .QN(n16) );
  DFFX1 \sti_addr_reg[4]  ( .D(n64), .CK(clk), .Q(sti_addr[4]), .QN(n15) );
  DFFX1 \sti_addr_reg[5]  ( .D(n63), .CK(clk), .Q(sti_addr[5]), .QN(n14) );
  DFFX1 \sti_addr_reg[6]  ( .D(n62), .CK(clk), .Q(sti_addr[6]), .QN(n13) );
  DFFQX1 \res_addr_reg[6]  ( .D(n53), .CK(clk), .Q(res_addr[6]) );
  DFFQX1 \res_addr_reg[7]  ( .D(n52), .CK(clk), .Q(res_addr[7]) );
  DFFQX1 \res_addr_reg[8]  ( .D(n51), .CK(clk), .Q(res_addr[8]) );
  DFFQX1 \res_addr_reg[9]  ( .D(n50), .CK(clk), .Q(res_addr[9]) );
  DFFQX1 \res_addr_reg[10]  ( .D(n49), .CK(clk), .Q(res_addr[10]) );
  DFFQX1 \res_addr_reg[11]  ( .D(n48), .CK(clk), .Q(res_addr[11]) );
  DFFQX1 \res_addr_reg[12]  ( .D(n47), .CK(clk), .Q(res_addr[12]) );
  DFFQX1 \sti_addr_reg[9]  ( .D(n68), .CK(clk), .Q(sti_addr[9]) );
  DFFQX2 \buf_state_reg[0]  ( .D(N122), .CK(clk), .Q(N21) );
  DFFQX1 \res_addr_reg[1]  ( .D(n58), .CK(clk), .Q(res_addr[1]) );
  DFFQX1 \res_addr_reg[2]  ( .D(n57), .CK(clk), .Q(res_addr[2]) );
  DFFQX1 \res_addr_reg[3]  ( .D(n56), .CK(clk), .Q(res_addr[3]) );
  DFFQX1 \res_addr_reg[4]  ( .D(n55), .CK(clk), .Q(res_addr[4]) );
  DFFQX1 \res_addr_reg[5]  ( .D(n54), .CK(clk), .Q(res_addr[5]) );
  DFFQX1 \res_addr_reg[0]  ( .D(n59), .CK(clk), .Q(res_addr[0]) );
  DFFRX2 \state_reg[0]  ( .D(nstate[0]), .CK(clk), .RN(rstn), .Q(state[0]), 
        .QN(n8) );
  TLATX1 \nstate_reg[1]  ( .G(N49), .D(N51), .Q(nstate[1]) );
  TLATX1 \nstate_reg[0]  ( .G(N49), .D(N50), .Q(nstate[0]) );
  TLATX1 \nstate_reg[2]  ( .G(N49), .D(N52), .Q(nstate[2]) );
  DFFQX1 \sti_addr_reg[8]  ( .D(n60), .CK(clk), .Q(sti_addr[8]) );
  DFFQX1 \buf_state_reg[1]  ( .D(N123), .CK(clk), .Q(N22) );
  DFFQX1 \sti_addr_reg[1]  ( .D(n67), .CK(clk), .Q(sti_addr[1]) );
  DFFQX1 \sti_addr_reg[2]  ( .D(n66), .CK(clk), .Q(sti_addr[2]) );
  DFFQX1 \sti_addr_reg[0]  ( .D(n69), .CK(clk), .Q(sti_addr[0]) );
  DFFRX1 \state_reg[2]  ( .D(nstate[2]), .CK(clk), .RN(rstn), .Q(state[2]), 
        .QN(n6) );
  NAND2X1 U10 ( .A(n33), .B(n72), .Y(N79) );
  INVX3 U11 ( .A(N79), .Y(n19) );
  NAND3X1 U12 ( .A(n34), .B(n74), .C(n75), .Y(N75) );
  CLKINVX1 U13 ( .A(n1), .Y(n72) );
  NAND2X2 U14 ( .A(n33), .B(n73), .Y(n20) );
  CLKINVX1 U15 ( .A(n2), .Y(n73) );
  CLKINVX1 U16 ( .A(n35), .Y(n18) );
  CLKBUFX3 U17 ( .A(n22), .Y(n4) );
  NAND2X1 U18 ( .A(n18), .B(n2), .Y(n22) );
  NOR2BX2 U19 ( .AN(n33), .B(n70), .Y(n34) );
  CLKINVX1 U20 ( .A(n71), .Y(n74) );
  CLKINVX1 U21 ( .A(n3), .Y(n75) );
  CLKBUFX3 U22 ( .A(N77), .Y(n1) );
  OAI31XL U23 ( .A0(n6), .A1(state[1]), .A2(state[0]), .B0(n36), .Y(N77) );
  OAI211X1 U24 ( .A0(n76), .A1(n20), .B0(n31), .C0(n4), .Y(n68) );
  CLKINVX1 U25 ( .A(sti_addr[9]), .Y(n76) );
  NAND2X1 U26 ( .A(N176), .B(n2), .Y(n31) );
  NAND3X1 U27 ( .A(state[1]), .B(n6), .C(state[0]), .Y(n36) );
  AO22X1 U28 ( .A0(res_addr[13]), .A1(n19), .B0(N150), .B1(n1), .Y(n46) );
  AO22X1 U29 ( .A0(res_addr[0]), .A1(n19), .B0(N137), .B1(n1), .Y(n59) );
  AO22X1 U30 ( .A0(res_addr[12]), .A1(n19), .B0(N149), .B1(n1), .Y(n47) );
  AO22X1 U31 ( .A0(res_addr[11]), .A1(n19), .B0(N148), .B1(n1), .Y(n48) );
  AO22X1 U32 ( .A0(res_addr[10]), .A1(n19), .B0(N147), .B1(n1), .Y(n49) );
  AO22X1 U33 ( .A0(res_addr[9]), .A1(n19), .B0(N146), .B1(n1), .Y(n50) );
  AO22X1 U34 ( .A0(res_addr[8]), .A1(n19), .B0(N145), .B1(n1), .Y(n51) );
  AO22X1 U35 ( .A0(res_addr[7]), .A1(n19), .B0(N144), .B1(n1), .Y(n52) );
  AO22X1 U36 ( .A0(res_addr[6]), .A1(n19), .B0(N143), .B1(n1), .Y(n53) );
  AO22X1 U37 ( .A0(res_addr[5]), .A1(n19), .B0(N142), .B1(n1), .Y(n54) );
  AO22X1 U38 ( .A0(res_addr[4]), .A1(n19), .B0(N141), .B1(n1), .Y(n55) );
  AO22X1 U39 ( .A0(res_addr[3]), .A1(n19), .B0(N140), .B1(n1), .Y(n56) );
  AO22X1 U40 ( .A0(res_addr[2]), .A1(n19), .B0(N139), .B1(n1), .Y(n57) );
  AO22X1 U41 ( .A0(res_addr[1]), .A1(n19), .B0(N138), .B1(n1), .Y(n58) );
  NAND2X1 U42 ( .A(n3), .B(n7), .Y(n33) );
  NAND2X1 U43 ( .A(N24), .B(n42), .Y(n38) );
  OAI211X1 U44 ( .A0(n79), .A1(n20), .B0(n21), .C0(n4), .Y(n60) );
  CLKINVX1 U45 ( .A(sti_addr[8]), .Y(n79) );
  NAND2X1 U46 ( .A(N175), .B(n2), .Y(n21) );
  OAI211X1 U47 ( .A0(n78), .A1(n20), .B0(n29), .C0(n4), .Y(n66) );
  CLKINVX1 U48 ( .A(sti_addr[2]), .Y(n78) );
  NAND2X1 U49 ( .A(N169), .B(n2), .Y(n29) );
  OAI211X1 U50 ( .A0(n77), .A1(n20), .B0(n30), .C0(n4), .Y(n67) );
  CLKINVX1 U51 ( .A(sti_addr[1]), .Y(n77) );
  NAND2X1 U52 ( .A(N168), .B(n2), .Y(n30) );
  OAI211X1 U53 ( .A0(n17), .A1(n20), .B0(n32), .C0(n4), .Y(n69) );
  CLKINVX1 U54 ( .A(sti_addr[0]), .Y(n17) );
  NAND2X1 U55 ( .A(N167), .B(n2), .Y(n32) );
  OAI211X1 U56 ( .A0(n12), .A1(n20), .B0(n24), .C0(n4), .Y(n61) );
  NAND2X1 U57 ( .A(N174), .B(n2), .Y(n24) );
  OAI211X1 U58 ( .A0(n13), .A1(n20), .B0(n25), .C0(n4), .Y(n62) );
  NAND2X1 U59 ( .A(N173), .B(n2), .Y(n25) );
  OAI211X1 U60 ( .A0(n14), .A1(n20), .B0(n26), .C0(n4), .Y(n63) );
  NAND2X1 U61 ( .A(N172), .B(n2), .Y(n26) );
  OAI211X1 U62 ( .A0(n15), .A1(n20), .B0(n27), .C0(n4), .Y(n64) );
  NAND2X1 U63 ( .A(N171), .B(n2), .Y(n27) );
  OAI211X1 U64 ( .A0(n16), .A1(n20), .B0(n28), .C0(n4), .Y(n65) );
  NAND2X1 U65 ( .A(N170), .B(n2), .Y(n28) );
  NAND4X1 U66 ( .A(sti_addr[9]), .B(sti_addr[8]), .C(n39), .D(n40), .Y(n35) );
  NOR3X1 U67 ( .A(n12), .B(n14), .C(n13), .Y(n39) );
  NOR3X1 U68 ( .A(n41), .B(n16), .C(n15), .Y(n40) );
  NAND3X1 U69 ( .A(sti_addr[1]), .B(sti_addr[0]), .C(sti_addr[2]), .Y(n41) );
  NOR2BX1 U70 ( .AN(N23), .B(n44), .Y(n42) );
  NOR2BX1 U71 ( .AN(sti_di[0]), .B(n7), .Y(N82) );
  NOR2BX1 U72 ( .AN(sti_di[1]), .B(n7), .Y(N83) );
  NOR2BX1 U73 ( .AN(sti_di[2]), .B(n7), .Y(N84) );
  NOR2BX1 U74 ( .AN(sti_di[3]), .B(n7), .Y(N85) );
  NOR2BX1 U75 ( .AN(sti_di[4]), .B(n7), .Y(N86) );
  NOR2BX1 U76 ( .AN(sti_di[5]), .B(n7), .Y(N87) );
  NOR2BX1 U77 ( .AN(sti_di[6]), .B(n7), .Y(N88) );
  NOR2BX1 U78 ( .AN(sti_di[7]), .B(n7), .Y(N89) );
  NOR2BX1 U79 ( .AN(sti_di[8]), .B(n7), .Y(N90) );
  NOR2BX1 U80 ( .AN(sti_di[9]), .B(n7), .Y(N91) );
  NOR2BX1 U81 ( .AN(sti_di[10]), .B(n7), .Y(N92) );
  NOR2BX1 U82 ( .AN(sti_di[11]), .B(n7), .Y(N93) );
  NOR2BXL U83 ( .AN(sti_di[12]), .B(n7), .Y(N94) );
  NOR2BXL U84 ( .AN(sti_di[13]), .B(n7), .Y(N95) );
  NOR2BXL U85 ( .AN(sti_di[14]), .B(n7), .Y(N96) );
  NOR2BXL U86 ( .AN(sti_di[15]), .B(n7), .Y(N97) );
  NAND2X1 U87 ( .A(N22), .B(N21), .Y(n44) );
  AOI21X1 U88 ( .A0(n43), .A1(n38), .B0(n72), .Y(N124) );
  XOR2X1 U89 ( .A(n44), .B(N23), .Y(n43) );
  AOI21X1 U90 ( .A0(n45), .A1(n38), .B0(n72), .Y(N123) );
  XNOR2X1 U91 ( .A(N22), .B(N21), .Y(n45) );
  AOI21X1 U92 ( .A0(N21), .A1(n38), .B0(n72), .Y(N122) );
  CLKBUFX3 U93 ( .A(N81), .Y(n3) );
  NOR2X1 U94 ( .A(state[0]), .B(state[2]), .Y(N81) );
  CLKBUFX3 U95 ( .A(n23), .Y(n2) );
  NOR3X1 U96 ( .A(n6), .B(state[1]), .C(n8), .Y(n23) );
  OA21XL U97 ( .A0(n42), .A1(N24), .B0(n1), .Y(N125) );
  OAI221XL U98 ( .A0(n73), .A1(n35), .B0(state[0]), .B1(n7), .C0(n74), .Y(N51)
         );
  OAI221XL U99 ( .A0(n73), .A1(n35), .B0(state[0]), .B1(n6), .C0(n36), .Y(N52)
         );
  OAI211X1 U100 ( .A0(n18), .A1(n73), .B0(n37), .C0(n75), .Y(N50) );
  NAND3BXL U101 ( .AN(n38), .B(n8), .C(n7), .Y(n37) );
  NOR3X1 U102 ( .A(n7), .B(state[0]), .C(n6), .Y(n70) );
  NOR3X1 U103 ( .A(state[1]), .B(state[2]), .C(n8), .Y(n71) );
  NAND3X1 U104 ( .A(state[2]), .B(n73), .C(state[0]), .Y(N49) );
  MX4X1 U105 ( .A(buff[4]), .B(buff[5]), .C(buff[6]), .D(buff[7]), .S0(N21), 
        .S1(N22), .Y(n10) );
  MX4X1 U106 ( .A(buff[0]), .B(buff[1]), .C(buff[2]), .D(buff[3]), .S0(N21), 
        .S1(N22), .Y(n11) );
  NAND3X1 U107 ( .A(state[1]), .B(n34), .C(state[2]), .Y(N76) );
  AND2X2 U108 ( .A(N54), .B(n1), .Y(N80) );
  MX4X1 U109 ( .A(n11), .B(n9), .C(n10), .D(n5), .S0(N24), .S1(N23), .Y(N54)
         );
  MX4X1 U110 ( .A(buff[8]), .B(buff[9]), .C(buff[10]), .D(buff[11]), .S0(N21), 
        .S1(N22), .Y(n9) );
  MX4X1 U111 ( .A(buff[12]), .B(buff[13]), .C(buff[14]), .D(buff[15]), .S0(N21), .S1(N22), .Y(n5) );
endmodule


module forward_pass_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module forward_pass_DW01_inc_1 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module forward_pass ( clk, rstn, initialize_done, res_rd, res_wr, res_addr, 
        res_do, res_di, fp_done );
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, rstn, initialize_done;
  output res_rd, res_wr, fp_done;
  wire   n134, n135, n136, N102, N103, N104, N105, N106, N107, N108, N109,
         N110, N111, N112, N113, N114, N115, N116, N117, N118, N119, N120,
         N121, N122, N123, N124, N125, N126, N127, N128, N143, N153, N155,
         N156, N157, N158, N159, N160, N161, N162, N163, N164, N165, N166,
         N206, N207, N208, N209, N210, N211, N212, N213, N214, N215, N216,
         N217, N218, N219, N313, N314, N315, N316, N317, N318, N319, N320,
         N321, N322, N324, N325, N326, N327, N328, N329, N330, N331, N332,
         N333, n104, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, \add_366/carry[2] , \add_366/carry[3] ,
         \add_366/carry[4] , \add_366/carry[5] , \add_366/carry[6] ,
         \add_366/carry[7] , \add_366/carry[8] , \add_366/carry[9] ,
         \add_366/carry[10] , \add_366/carry[11] , \add_366/carry[12] ,
         \add_366/carry[13] , \add_351/carry[13] , \add_351/carry[12] ,
         \add_351/carry[11] , \add_351/carry[10] , \add_351/carry[9] ,
         \add_351/carry[8] , \add_351/carry[7] , \add_351/carry[6] ,
         \add_351/carry[5] , \add_351/carry[4] , \add_351/carry[3] ,
         \sub_337/carry[2] , \sub_337/carry[3] , \sub_337/carry[4] ,
         \sub_337/carry[5] , \sub_337/carry[6] , \sub_337/carry[7] ,
         \sub_337/carry[8] , \sub_337/carry[9] , \sub_337/carry[10] ,
         \sub_337/carry[11] , \sub_337/carry[12] , \sub_337/carry[13] , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n105, n128, n129, n130, n131, n132, n133;
  wire   [3:0] state;
  wire   [3:0] nstate;
  wire   [7:0] data;
  assign res_addr[0] = N153;

  forward_pass_DW01_inc_0 add_418 ( .A(data), .SUM({N320, N319, N318, N317, 
        N316, N315, N314, N313}) );
  forward_pass_DW01_inc_1 r327 ( .A({res_addr[13:1], N153}), .SUM({N128, N127, 
        N126, N125, N124, N123, N122, N121, N120, N119, N118, N117, N116, N115}) );
  TLATX1 res_rd_reg ( .G(N321), .D(N322), .Q(res_rd) );
  TLATNX1 res_wr_reg ( .D(n12), .GN(n104), .Q(res_wr) );
  TLATXL \res_do_reg[0]  ( .G(N325), .D(N326), .Q(res_do[0]) );
  TLATXL \res_do_reg[7]  ( .G(N325), .D(N333), .Q(res_do[7]) );
  TLATXL \res_do_reg[6]  ( .G(N325), .D(N332), .Q(res_do[6]) );
  TLATXL \res_do_reg[5]  ( .G(N325), .D(N331), .Q(res_do[5]) );
  TLATXL \res_do_reg[4]  ( .G(N325), .D(N330), .Q(res_do[4]) );
  TLATXL \res_do_reg[3]  ( .G(N325), .D(N329), .Q(res_do[3]) );
  TLATXL \res_do_reg[2]  ( .G(N325), .D(N328), .Q(res_do[2]) );
  TLATXL \res_do_reg[1]  ( .G(N325), .D(N327), .Q(res_do[1]) );
  DFFQX1 \data_reg[7]  ( .D(n106), .CK(clk), .Q(data[7]) );
  DFFQX2 \res_addr_reg[5]  ( .D(n121), .CK(clk), .Q(res_addr[5]) );
  DFFQX2 \res_addr_reg[12]  ( .D(n114), .CK(clk), .Q(res_addr[12]) );
  DFFQX2 \res_addr_reg[8]  ( .D(n118), .CK(clk), .Q(res_addr[8]) );
  DFFQX2 \res_addr_reg[9]  ( .D(n117), .CK(clk), .Q(res_addr[9]) );
  DFFQX2 \res_addr_reg[11]  ( .D(n115), .CK(clk), .Q(res_addr[11]) );
  DFFQX2 \res_addr_reg[10]  ( .D(n116), .CK(clk), .Q(res_addr[10]) );
  DFFQX2 \res_addr_reg[6]  ( .D(n120), .CK(clk), .Q(res_addr[6]) );
  DFFQX1 \data_reg[6]  ( .D(n107), .CK(clk), .Q(data[6]) );
  DFFQX2 \res_addr_reg[13]  ( .D(n126), .CK(clk), .Q(res_addr[13]) );
  DFFX1 \res_addr_reg[3]  ( .D(n123), .CK(clk), .Q(n134) );
  DFFX1 \res_addr_reg[2]  ( .D(n124), .CK(clk), .Q(n135) );
  DFFQX1 \data_reg[5]  ( .D(n108), .CK(clk), .Q(data[5]) );
  DFFQX1 \data_reg[3]  ( .D(n110), .CK(clk), .Q(data[3]) );
  DFFQX1 \data_reg[1]  ( .D(n112), .CK(clk), .Q(data[1]) );
  DFFQX1 \data_reg[0]  ( .D(n113), .CK(clk), .Q(data[0]) );
  DFFQX1 \data_reg[4]  ( .D(n109), .CK(clk), .Q(data[4]) );
  DFFQX1 \data_reg[2]  ( .D(n111), .CK(clk), .Q(data[2]) );
  DFFQX2 \res_addr_reg[4]  ( .D(n122), .CK(clk), .Q(res_addr[4]) );
  DFFX1 \res_addr_reg[1]  ( .D(n125), .CK(clk), .Q(n136), .QN(n5) );
  DFFRX2 \state_reg[3]  ( .D(nstate[3]), .CK(clk), .RN(rstn), .Q(state[3]), 
        .QN(n1) );
  DFFRX1 \state_reg[2]  ( .D(nstate[2]), .CK(clk), .RN(rstn), .Q(state[2]), 
        .QN(n4) );
  DFFRX1 \state_reg[0]  ( .D(nstate[0]), .CK(clk), .RN(rstn), .Q(state[0]), 
        .QN(n3) );
  DFFQX2 \res_addr_reg[7]  ( .D(n119), .CK(clk), .Q(res_addr[7]) );
  DFFQX2 \res_addr_reg[0]  ( .D(n127), .CK(clk), .Q(N153) );
  TLATXL fp_done_reg ( .G(N324), .D(n133), .Q(fp_done) );
  DFFRX1 \state_reg[1]  ( .D(nstate[1]), .CK(clk), .RN(rstn), .Q(state[1]), 
        .QN(n2) );
  OAI2BB1X1 U3 ( .A0N(n1), .A1N(n100), .B0(n82), .Y(N324) );
  AOI21X1 U4 ( .A0(nstate[0]), .A1(nstate[2]), .B0(n11), .Y(n92) );
  NOR4X1 U5 ( .A(nstate[0]), .B(nstate[1]), .C(nstate[2]), .D(nstate[3]), .Y(
        n39) );
  OAI21X2 U6 ( .A0(state[3]), .A1(n96), .B0(n97), .Y(nstate[2]) );
  AND3XL U7 ( .A(nstate[2]), .B(n80), .C(nstate[1]), .Y(n40) );
  OAI31X1 U8 ( .A0(n3), .A1(state[3]), .A2(state[1]), .B0(n95), .Y(nstate[1])
         );
  OAI21X2 U9 ( .A0(N143), .A1(n92), .B0(n79), .Y(n91) );
  NAND2XL U10 ( .A(n92), .B(n93), .Y(n79) );
  OAI21X2 U11 ( .A0(n92), .A1(n94), .B0(n93), .Y(n90) );
  OAI21X4 U12 ( .A0(state[3]), .A1(n128), .B0(n81), .Y(N325) );
  INVXL U13 ( .A(nstate[1]), .Y(n76) );
  AO22XL U14 ( .A0(n90), .A1(res_di[1]), .B0(data[1]), .B1(n91), .Y(n112) );
  AO22XL U15 ( .A0(n90), .A1(res_di[2]), .B0(data[2]), .B1(n91), .Y(n111) );
  AO22XL U16 ( .A0(n90), .A1(res_di[3]), .B0(data[3]), .B1(n91), .Y(n110) );
  AO22XL U17 ( .A0(n90), .A1(res_di[4]), .B0(data[4]), .B1(n91), .Y(n109) );
  AO22XL U18 ( .A0(n90), .A1(res_di[5]), .B0(data[5]), .B1(n91), .Y(n108) );
  AO22XL U19 ( .A0(n90), .A1(res_di[6]), .B0(data[6]), .B1(n91), .Y(n107) );
  AO22XL U20 ( .A0(n90), .A1(res_di[7]), .B0(data[7]), .B1(n91), .Y(n106) );
  AO22XL U21 ( .A0(n90), .A1(res_di[0]), .B0(data[0]), .B1(n91), .Y(n113) );
  CLKBUFX3 U22 ( .A(n41), .Y(n9) );
  NOR4BX1 U23 ( .AN(n70), .B(n79), .C(n39), .D(n10), .Y(n41) );
  CLKBUFX3 U24 ( .A(n40), .Y(n11) );
  CLKBUFX3 U25 ( .A(n37), .Y(n8) );
  OAI31XL U26 ( .A0(n70), .A1(n73), .A2(n74), .B0(n75), .Y(n37) );
  CLKBUFX3 U27 ( .A(n42), .Y(n10) );
  NOR3XL U28 ( .A(n76), .B(nstate[2]), .C(n80), .Y(n42) );
  CLKBUFX3 U29 ( .A(n38), .Y(n7) );
  NOR3X1 U30 ( .A(n72), .B(n73), .C(n70), .Y(n38) );
  CLKBUFX3 U31 ( .A(n45), .Y(n6) );
  NOR2X1 U32 ( .A(n70), .B(n71), .Y(n45) );
  CLKBUFX3 U33 ( .A(n136), .Y(res_addr[1]) );
  CLKINVX1 U34 ( .A(data[7]), .Y(n34) );
  CLKINVX1 U35 ( .A(data[5]), .Y(n33) );
  CLKINVX1 U36 ( .A(data[3]), .Y(n32) );
  CLKINVX1 U37 ( .A(data[1]), .Y(n31) );
  CLKBUFX3 U38 ( .A(n135), .Y(res_addr[2]) );
  CLKBUFX3 U39 ( .A(n134), .Y(res_addr[3]) );
  CLKBUFX3 U40 ( .A(n132), .Y(n12) );
  NOR4X1 U41 ( .A(n4), .B(n2), .C(n3), .D(state[3]), .Y(n132) );
  CLKINVX1 U42 ( .A(N153), .Y(N206) );
  CLKINVX1 U43 ( .A(res_di[6]), .Y(n30) );
  XOR2X1 U44 ( .A(res_addr[13]), .B(\add_366/carry[13] ), .Y(N219) );
  AND2X1 U45 ( .A(\add_366/carry[12] ), .B(res_addr[12]), .Y(
        \add_366/carry[13] ) );
  XOR2X1 U46 ( .A(res_addr[12]), .B(\add_366/carry[12] ), .Y(N218) );
  AND2X1 U47 ( .A(\add_366/carry[11] ), .B(res_addr[11]), .Y(
        \add_366/carry[12] ) );
  XOR2X1 U48 ( .A(res_addr[11]), .B(\add_366/carry[11] ), .Y(N217) );
  AND2X1 U49 ( .A(\add_366/carry[10] ), .B(res_addr[10]), .Y(
        \add_366/carry[11] ) );
  XOR2X1 U50 ( .A(res_addr[10]), .B(\add_366/carry[10] ), .Y(N216) );
  AND2X1 U51 ( .A(\add_366/carry[9] ), .B(res_addr[9]), .Y(\add_366/carry[10] ) );
  XOR2X1 U52 ( .A(res_addr[9]), .B(\add_366/carry[9] ), .Y(N215) );
  AND2X1 U53 ( .A(\add_366/carry[8] ), .B(res_addr[8]), .Y(\add_366/carry[9] )
         );
  XOR2X1 U54 ( .A(res_addr[8]), .B(\add_366/carry[8] ), .Y(N214) );
  AND2X1 U55 ( .A(\add_366/carry[7] ), .B(res_addr[7]), .Y(\add_366/carry[8] )
         );
  XOR2X1 U56 ( .A(res_addr[7]), .B(\add_366/carry[7] ), .Y(N213) );
  AND2X1 U57 ( .A(\add_366/carry[6] ), .B(res_addr[6]), .Y(\add_366/carry[7] )
         );
  XOR2X1 U58 ( .A(res_addr[6]), .B(\add_366/carry[6] ), .Y(N212) );
  AND2X1 U59 ( .A(\add_366/carry[5] ), .B(res_addr[5]), .Y(\add_366/carry[6] )
         );
  XOR2X1 U60 ( .A(res_addr[5]), .B(\add_366/carry[5] ), .Y(N211) );
  AND2X1 U61 ( .A(\add_366/carry[4] ), .B(res_addr[4]), .Y(\add_366/carry[5] )
         );
  XOR2X1 U62 ( .A(res_addr[4]), .B(\add_366/carry[4] ), .Y(N210) );
  AND2X1 U63 ( .A(\add_366/carry[3] ), .B(res_addr[3]), .Y(\add_366/carry[4] )
         );
  XOR2X1 U64 ( .A(res_addr[3]), .B(\add_366/carry[3] ), .Y(N209) );
  AND2X1 U65 ( .A(\add_366/carry[2] ), .B(res_addr[2]), .Y(\add_366/carry[3] )
         );
  XOR2X1 U66 ( .A(res_addr[2]), .B(\add_366/carry[2] ), .Y(N208) );
  OR2X1 U67 ( .A(res_addr[1]), .B(N153), .Y(\add_366/carry[2] ) );
  XNOR2X1 U68 ( .A(N153), .B(res_addr[1]), .Y(N207) );
  XNOR2X1 U69 ( .A(res_addr[13]), .B(\sub_337/carry[13] ), .Y(N114) );
  OR2X1 U70 ( .A(res_addr[12]), .B(\sub_337/carry[12] ), .Y(
        \sub_337/carry[13] ) );
  XNOR2X1 U71 ( .A(\sub_337/carry[12] ), .B(res_addr[12]), .Y(N113) );
  OR2X1 U72 ( .A(res_addr[11]), .B(\sub_337/carry[11] ), .Y(
        \sub_337/carry[12] ) );
  XNOR2X1 U73 ( .A(\sub_337/carry[11] ), .B(res_addr[11]), .Y(N112) );
  OR2X1 U74 ( .A(res_addr[10]), .B(\sub_337/carry[10] ), .Y(
        \sub_337/carry[11] ) );
  XNOR2X1 U75 ( .A(\sub_337/carry[10] ), .B(res_addr[10]), .Y(N111) );
  OR2X1 U76 ( .A(res_addr[9]), .B(\sub_337/carry[9] ), .Y(\sub_337/carry[10] )
         );
  XNOR2X1 U77 ( .A(\sub_337/carry[9] ), .B(res_addr[9]), .Y(N110) );
  OR2X1 U78 ( .A(res_addr[8]), .B(\sub_337/carry[8] ), .Y(\sub_337/carry[9] )
         );
  XNOR2X1 U79 ( .A(\sub_337/carry[8] ), .B(res_addr[8]), .Y(N109) );
  AND2X1 U80 ( .A(\sub_337/carry[7] ), .B(res_addr[7]), .Y(\sub_337/carry[8] )
         );
  XOR2X1 U81 ( .A(res_addr[7]), .B(\sub_337/carry[7] ), .Y(N108) );
  OR2X1 U82 ( .A(res_addr[6]), .B(\sub_337/carry[6] ), .Y(\sub_337/carry[7] )
         );
  XNOR2X1 U83 ( .A(\sub_337/carry[6] ), .B(res_addr[6]), .Y(N107) );
  OR2X1 U84 ( .A(res_addr[5]), .B(\sub_337/carry[5] ), .Y(\sub_337/carry[6] )
         );
  XNOR2X1 U85 ( .A(\sub_337/carry[5] ), .B(res_addr[5]), .Y(N106) );
  OR2X1 U86 ( .A(res_addr[4]), .B(\sub_337/carry[4] ), .Y(\sub_337/carry[5] )
         );
  XNOR2X1 U87 ( .A(\sub_337/carry[4] ), .B(res_addr[4]), .Y(N105) );
  OR2X1 U88 ( .A(res_addr[3]), .B(\sub_337/carry[3] ), .Y(\sub_337/carry[4] )
         );
  XNOR2X1 U89 ( .A(\sub_337/carry[3] ), .B(res_addr[3]), .Y(N104) );
  OR2X1 U90 ( .A(res_addr[2]), .B(\sub_337/carry[2] ), .Y(\sub_337/carry[3] )
         );
  XNOR2X1 U91 ( .A(\sub_337/carry[2] ), .B(res_addr[2]), .Y(N103) );
  OR2X1 U92 ( .A(res_addr[1]), .B(N153), .Y(\sub_337/carry[2] ) );
  XNOR2X1 U93 ( .A(N153), .B(res_addr[1]), .Y(N102) );
  XOR2X1 U94 ( .A(res_addr[13]), .B(\add_351/carry[13] ), .Y(N166) );
  AND2X1 U95 ( .A(\add_351/carry[12] ), .B(res_addr[12]), .Y(
        \add_351/carry[13] ) );
  XOR2X1 U96 ( .A(res_addr[12]), .B(\add_351/carry[12] ), .Y(N165) );
  AND2X1 U97 ( .A(\add_351/carry[11] ), .B(res_addr[11]), .Y(
        \add_351/carry[12] ) );
  XOR2X1 U98 ( .A(res_addr[11]), .B(\add_351/carry[11] ), .Y(N164) );
  AND2X1 U99 ( .A(\add_351/carry[10] ), .B(res_addr[10]), .Y(
        \add_351/carry[11] ) );
  XOR2X1 U100 ( .A(res_addr[10]), .B(\add_351/carry[10] ), .Y(N163) );
  AND2X1 U101 ( .A(\add_351/carry[9] ), .B(res_addr[9]), .Y(
        \add_351/carry[10] ) );
  XOR2X1 U102 ( .A(res_addr[9]), .B(\add_351/carry[9] ), .Y(N162) );
  AND2X1 U103 ( .A(\add_351/carry[8] ), .B(res_addr[8]), .Y(\add_351/carry[9] ) );
  XOR2X1 U104 ( .A(res_addr[8]), .B(\add_351/carry[8] ), .Y(N161) );
  AND2X1 U105 ( .A(\add_351/carry[7] ), .B(res_addr[7]), .Y(\add_351/carry[8] ) );
  XOR2X1 U106 ( .A(res_addr[7]), .B(\add_351/carry[7] ), .Y(N160) );
  OR2X1 U107 ( .A(res_addr[6]), .B(\add_351/carry[6] ), .Y(\add_351/carry[7] )
         );
  XNOR2X1 U108 ( .A(\add_351/carry[6] ), .B(res_addr[6]), .Y(N159) );
  OR2X1 U109 ( .A(res_addr[5]), .B(\add_351/carry[5] ), .Y(\add_351/carry[6] )
         );
  XNOR2X1 U110 ( .A(\add_351/carry[5] ), .B(res_addr[5]), .Y(N158) );
  OR2X1 U111 ( .A(res_addr[4]), .B(\add_351/carry[4] ), .Y(\add_351/carry[5] )
         );
  XNOR2X1 U112 ( .A(\add_351/carry[4] ), .B(res_addr[4]), .Y(N157) );
  OR2X1 U113 ( .A(res_addr[3]), .B(\add_351/carry[3] ), .Y(\add_351/carry[4] )
         );
  XNOR2X1 U114 ( .A(\add_351/carry[3] ), .B(res_addr[3]), .Y(N156) );
  OR2X1 U115 ( .A(res_addr[2]), .B(res_addr[1]), .Y(\add_351/carry[3] ) );
  XNOR2X1 U116 ( .A(res_addr[1]), .B(res_addr[2]), .Y(N155) );
  NAND2BX1 U117 ( .AN(res_di[4]), .B(data[4]), .Y(n16) );
  OAI222XL U118 ( .A0(res_di[5]), .A1(n33), .B0(res_di[5]), .B1(n16), .C0(n33), 
        .C1(n16), .Y(n17) );
  OAI222XL U119 ( .A0(data[6]), .A1(n17), .B0(n30), .B1(n17), .C0(data[6]), 
        .C1(n30), .Y(n28) );
  NAND2BX1 U120 ( .AN(res_di[2]), .B(data[2]), .Y(n20) );
  OAI22XL U121 ( .A0(res_di[3]), .A1(n32), .B0(res_di[3]), .B1(n20), .Y(n26)
         );
  NOR2BX1 U122 ( .AN(res_di[2]), .B(data[2]), .Y(n18) );
  OA22X1 U123 ( .A0(n18), .A1(res_di[3]), .B0(n18), .B1(n32), .Y(n22) );
  AOI21X1 U124 ( .A0(res_di[1]), .A1(n31), .B0(res_di[0]), .Y(n19) );
  AOI2BB2X1 U125 ( .B0(n19), .B1(data[0]), .A0N(res_di[1]), .A1N(n31), .Y(n21)
         );
  OAI22XL U126 ( .A0(n22), .A1(n21), .B0(n20), .B1(n32), .Y(n25) );
  NOR2BX1 U127 ( .AN(res_di[4]), .B(data[4]), .Y(n23) );
  OAI22XL U128 ( .A0(n23), .A1(n33), .B0(res_di[5]), .B1(n23), .Y(n24) );
  OAI221XL U129 ( .A0(data[6]), .A1(n30), .B0(n26), .B1(n25), .C0(n24), .Y(n27) );
  AO22X1 U130 ( .A0(n34), .A1(res_di[7]), .B0(n28), .B1(n27), .Y(n29) );
  OAI21XL U131 ( .A0(res_di[7]), .A1(n34), .B0(n29), .Y(N143) );
  NAND2X1 U132 ( .A(n35), .B(n36), .Y(n127) );
  AOI221XL U133 ( .A0(N115), .A1(n8), .B0(N206), .B1(n7), .C0(n39), .Y(n36) );
  AOI222XL U134 ( .A0(N153), .A1(n11), .B0(n9), .B1(N153), .C0(N206), .C1(n10), 
        .Y(n35) );
  NAND2X1 U135 ( .A(n43), .B(n44), .Y(n126) );
  AOI221XL U136 ( .A0(N128), .A1(n8), .B0(N219), .B1(n7), .C0(n6), .Y(n44) );
  AOI222XL U137 ( .A0(N166), .A1(n11), .B0(n9), .B1(res_addr[13]), .C0(N114), 
        .C1(n10), .Y(n43) );
  NAND2X1 U138 ( .A(n46), .B(n47), .Y(n125) );
  AOI221XL U139 ( .A0(N116), .A1(n8), .B0(N207), .B1(n7), .C0(n6), .Y(n47) );
  AOI222XL U140 ( .A0(n5), .A1(n11), .B0(n9), .B1(res_addr[1]), .C0(N102), 
        .C1(n10), .Y(n46) );
  NAND2X1 U141 ( .A(n48), .B(n49), .Y(n124) );
  AOI221XL U142 ( .A0(N117), .A1(n8), .B0(N208), .B1(n7), .C0(n6), .Y(n49) );
  AOI222XL U143 ( .A0(N155), .A1(n11), .B0(n9), .B1(res_addr[2]), .C0(N103), 
        .C1(n10), .Y(n48) );
  NAND2X1 U144 ( .A(n50), .B(n51), .Y(n123) );
  AOI221XL U145 ( .A0(N118), .A1(n8), .B0(N209), .B1(n7), .C0(n6), .Y(n51) );
  AOI222XL U146 ( .A0(N156), .A1(n11), .B0(n9), .B1(res_addr[3]), .C0(N104), 
        .C1(n10), .Y(n50) );
  NAND2X1 U147 ( .A(n52), .B(n53), .Y(n122) );
  AOI221XL U148 ( .A0(N119), .A1(n8), .B0(N210), .B1(n7), .C0(n6), .Y(n53) );
  AOI222XL U149 ( .A0(N157), .A1(n11), .B0(n9), .B1(res_addr[4]), .C0(N105), 
        .C1(n10), .Y(n52) );
  NAND2X1 U150 ( .A(n54), .B(n55), .Y(n121) );
  AOI221XL U151 ( .A0(N120), .A1(n8), .B0(N211), .B1(n7), .C0(n6), .Y(n55) );
  AOI222XL U152 ( .A0(N158), .A1(n11), .B0(n9), .B1(res_addr[5]), .C0(N106), 
        .C1(n10), .Y(n54) );
  NAND2X1 U153 ( .A(n56), .B(n57), .Y(n120) );
  AOI221XL U154 ( .A0(N121), .A1(n8), .B0(N212), .B1(n7), .C0(n6), .Y(n57) );
  AOI222XL U155 ( .A0(N159), .A1(n11), .B0(n9), .B1(res_addr[6]), .C0(N107), 
        .C1(n10), .Y(n56) );
  NAND2X1 U156 ( .A(n58), .B(n59), .Y(n119) );
  AOI221XL U157 ( .A0(N122), .A1(n8), .B0(N213), .B1(n7), .C0(n39), .Y(n59) );
  AOI222XL U158 ( .A0(N160), .A1(n11), .B0(res_addr[7]), .B1(n9), .C0(N108), 
        .C1(n10), .Y(n58) );
  NAND2X1 U159 ( .A(n60), .B(n61), .Y(n118) );
  AOI221XL U160 ( .A0(N123), .A1(n8), .B0(N214), .B1(n7), .C0(n6), .Y(n61) );
  AOI222XL U161 ( .A0(N161), .A1(n11), .B0(n9), .B1(res_addr[8]), .C0(N109), 
        .C1(n10), .Y(n60) );
  NAND2X1 U162 ( .A(n62), .B(n63), .Y(n117) );
  AOI221XL U163 ( .A0(N124), .A1(n8), .B0(N215), .B1(n7), .C0(n6), .Y(n63) );
  AOI222XL U164 ( .A0(N162), .A1(n11), .B0(n9), .B1(res_addr[9]), .C0(N110), 
        .C1(n10), .Y(n62) );
  NAND2X1 U165 ( .A(n64), .B(n65), .Y(n116) );
  AOI221XL U166 ( .A0(N125), .A1(n8), .B0(N216), .B1(n7), .C0(n6), .Y(n65) );
  AOI222XL U167 ( .A0(N163), .A1(n11), .B0(n9), .B1(res_addr[10]), .C0(N111), 
        .C1(n10), .Y(n64) );
  NAND2X1 U168 ( .A(n66), .B(n67), .Y(n115) );
  AOI221XL U169 ( .A0(N126), .A1(n8), .B0(N217), .B1(n7), .C0(n6), .Y(n67) );
  AOI222XL U170 ( .A0(N164), .A1(n11), .B0(n9), .B1(res_addr[11]), .C0(N112), 
        .C1(n10), .Y(n66) );
  NAND2X1 U171 ( .A(n68), .B(n69), .Y(n114) );
  AOI221XL U172 ( .A0(N127), .A1(n8), .B0(N218), .B1(n7), .C0(n6), .Y(n69) );
  OAI21XL U173 ( .A0(nstate[0]), .A1(n76), .B0(nstate[2]), .Y(n75) );
  CLKINVX1 U174 ( .A(n72), .Y(n74) );
  NAND4BX1 U175 ( .AN(N153), .B(res_addr[1]), .C(res_addr[2]), .D(n77), .Y(n72) );
  AND3X1 U176 ( .A(res_addr[6]), .B(res_addr[3]), .C(n78), .Y(n77) );
  CLKINVX1 U177 ( .A(n71), .Y(n73) );
  AOI222XL U178 ( .A0(N165), .A1(n11), .B0(n9), .B1(res_addr[12]), .C0(N113), 
        .C1(n10), .Y(n68) );
  NAND2X1 U179 ( .A(nstate[3]), .B(n80), .Y(n70) );
  NAND3X1 U180 ( .A(n81), .B(n82), .C(n83), .Y(nstate[3]) );
  OA22X1 U181 ( .A0(n84), .A1(n85), .B0(n71), .B1(n86), .Y(n83) );
  NAND4BX1 U182 ( .AN(n87), .B(res_addr[10]), .C(res_addr[11]), .D(n88), .Y(
        n71) );
  AND4X1 U183 ( .A(res_addr[12]), .B(res_addr[13]), .C(res_addr[8]), .D(
        res_addr[9]), .Y(n88) );
  OAI222XL U184 ( .A0(res_addr[7]), .A1(res_addr[6]), .B0(res_addr[7]), .B1(
        n78), .C0(n89), .C1(res_addr[7]), .Y(n87) );
  AND4X1 U185 ( .A(N153), .B(res_addr[1]), .C(res_addr[2]), .D(res_addr[3]), 
        .Y(n89) );
  AND2X1 U186 ( .A(res_addr[5]), .B(res_addr[4]), .Y(n78) );
  NAND3X1 U187 ( .A(n80), .B(n76), .C(nstate[2]), .Y(n93) );
  CLKINVX1 U188 ( .A(N143), .Y(n94) );
  CLKINVX1 U189 ( .A(nstate[0]), .Y(n80) );
  NAND4X1 U190 ( .A(n95), .B(n98), .C(n99), .D(n86), .Y(nstate[0]) );
  NAND3BX1 U191 ( .AN(state[3]), .B(n3), .C(state[2]), .Y(n99) );
  NAND2X1 U192 ( .A(initialize_done), .B(n100), .Y(n98) );
  OA21XL U193 ( .A0(n101), .A1(n85), .B0(n97), .Y(n95) );
  NAND2X1 U194 ( .A(n102), .B(state[2]), .Y(n97) );
  NAND2X1 U195 ( .A(n102), .B(n4), .Y(n85) );
  NOR3X1 U196 ( .A(state[0]), .B(state[3]), .C(n2), .Y(n102) );
  CLKINVX1 U197 ( .A(n84), .Y(n101) );
  NAND2X1 U198 ( .A(n103), .B(n105), .Y(n84) );
  NOR4X1 U199 ( .A(res_di[7]), .B(res_di[6]), .C(res_di[5]), .D(res_di[4]), 
        .Y(n105) );
  NOR4X1 U200 ( .A(res_di[3]), .B(res_di[2]), .C(res_di[1]), .D(res_di[0]), 
        .Y(n103) );
  AND2X1 U201 ( .A(N320), .B(n12), .Y(N333) );
  AND2X1 U202 ( .A(N319), .B(n12), .Y(N332) );
  AND2X1 U203 ( .A(N318), .B(n12), .Y(N331) );
  AND2X1 U204 ( .A(N317), .B(n12), .Y(N330) );
  AND2X1 U205 ( .A(N316), .B(n12), .Y(N329) );
  AND2X1 U206 ( .A(N315), .B(n12), .Y(N328) );
  AND2X1 U207 ( .A(N314), .B(n12), .Y(N327) );
  AND2X1 U208 ( .A(N313), .B(n12), .Y(N326) );
  CLKINVX1 U209 ( .A(n12), .Y(n81) );
  AOI21X1 U210 ( .A0(n129), .A1(n96), .B0(state[3]), .Y(N322) );
  MXI2X1 U211 ( .A(n2), .B(n130), .S0(n4), .Y(n96) );
  NOR2X1 U212 ( .A(n3), .B(n2), .Y(n130) );
  MXI2X1 U213 ( .A(n131), .B(state[2]), .S0(n3), .Y(n129) );
  NAND2X1 U214 ( .A(n104), .B(state[3]), .Y(N321) );
  NOR3X1 U215 ( .A(n12), .B(N324), .C(n100), .Y(n104) );
  CLKINVX1 U216 ( .A(n133), .Y(n82) );
  NOR2X1 U217 ( .A(n3), .B(n86), .Y(n133) );
  NAND2X1 U218 ( .A(state[3]), .B(n131), .Y(n86) );
  NOR2X1 U219 ( .A(n128), .B(state[0]), .Y(n100) );
  CLKINVX1 U220 ( .A(n131), .Y(n128) );
  NOR2X1 U221 ( .A(state[1]), .B(state[2]), .Y(n131) );
endmodule


module backward_pass_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module backward_pass_DW01_inc_1 ( A, SUM );
  input [8:0] A;
  output [8:0] SUM;

  wire   [8:2] carry;

  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module backward_pass_DW01_dec_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;

  CLKINVX1 U1 ( .A(n16), .Y(n1) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
  CLKINVX1 U3 ( .A(A[11]), .Y(n3) );
  CLKINVX1 U4 ( .A(A[10]), .Y(n4) );
  AO21X1 U5 ( .A0(n5), .A1(A[9]), .B0(n6), .Y(SUM[9]) );
  OAI2BB1X1 U6 ( .A0N(n7), .A1N(A[8]), .B0(n5), .Y(SUM[8]) );
  OAI2BB1X1 U7 ( .A0N(n8), .A1N(A[7]), .B0(n7), .Y(SUM[7]) );
  OAI2BB1X1 U8 ( .A0N(n9), .A1N(A[6]), .B0(n8), .Y(SUM[6]) );
  OAI2BB1X1 U9 ( .A0N(n10), .A1N(A[5]), .B0(n9), .Y(SUM[5]) );
  OAI2BB1X1 U10 ( .A0N(n11), .A1N(A[4]), .B0(n10), .Y(SUM[4]) );
  OAI2BB1X1 U11 ( .A0N(n12), .A1N(A[3]), .B0(n11), .Y(SUM[3]) );
  OAI2BB1X1 U12 ( .A0N(n13), .A1N(A[2]), .B0(n12), .Y(SUM[2]) );
  OAI2BB1X1 U13 ( .A0N(A[0]), .A1N(A[1]), .B0(n13), .Y(SUM[1]) );
  XOR2X1 U14 ( .A(A[13]), .B(n14), .Y(SUM[13]) );
  NOR2X1 U15 ( .A(A[12]), .B(n15), .Y(n14) );
  XNOR2X1 U16 ( .A(A[12]), .B(n15), .Y(SUM[12]) );
  OAI21XL U17 ( .A0(n1), .A1(n3), .B0(n15), .Y(SUM[11]) );
  NAND2X1 U18 ( .A(n1), .B(n3), .Y(n15) );
  OAI21XL U19 ( .A0(n6), .A1(n4), .B0(n16), .Y(SUM[10]) );
  NAND2X1 U20 ( .A(n6), .B(n4), .Y(n16) );
  NOR2X1 U21 ( .A(n5), .B(A[9]), .Y(n6) );
  OR2X1 U22 ( .A(n7), .B(A[8]), .Y(n5) );
  OR2X1 U23 ( .A(n8), .B(A[7]), .Y(n7) );
  OR2X1 U24 ( .A(n9), .B(A[6]), .Y(n8) );
  OR2X1 U25 ( .A(n10), .B(A[5]), .Y(n9) );
  OR2X1 U26 ( .A(n11), .B(A[4]), .Y(n10) );
  OR2X1 U27 ( .A(n12), .B(A[3]), .Y(n11) );
  OR2X1 U28 ( .A(n13), .B(A[2]), .Y(n12) );
  NAND2BX1 U29 ( .AN(A[1]), .B(SUM[0]), .Y(n13) );
endmodule


module backward_pass_DW01_inc_2 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module backward_pass ( clk, rstn, fp_done, res_rd, res_wr, res_addr, res_do, 
        res_di, bp_done );
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, rstn, fp_done;
  output res_rd, res_wr, bp_done;
  wire   n196, n197, N107, N108, N109, N110, N111, N112, N113, N114, N115,
         N116, N117, N118, N119, N120, N121, N123, N124, N125, N126, N127,
         N128, N129, N130, N131, N132, N133, N134, N184, N185, N186, N187,
         N188, N189, N190, N191, N192, N193, N194, N195, N196, N212, N213,
         N214, N215, N216, N217, N218, N219, N220, N221, N222, N223, N224,
         N225, N226, N227, N228, N229, N230, N231, N232, N233, N234, N235,
         N236, N237, N238, N239, N329, N330, N331, N332, N333, N334, N335,
         N336, N337, N338, N340, N341, N342, N343, N344, N345, N346, N347,
         N356, N357, N359, N360, N361, N362, N363, N364, N365, N366, N367,
         N368, n145, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         \sub_534/carry[2] , \sub_534/carry[3] , \sub_534/carry[4] ,
         \sub_534/carry[5] , \sub_534/carry[6] , \sub_534/carry[7] ,
         \sub_534/carry[8] , \sub_534/carry[9] , \sub_534/carry[10] ,
         \sub_534/carry[11] , \sub_534/carry[12] , \sub_534/carry[13] ,
         \sub_524/carry[2] , \sub_524/carry[3] , \sub_524/carry[4] ,
         \sub_524/carry[5] , \sub_524/carry[6] , \sub_524/carry[7] ,
         \sub_524/carry[8] , \sub_524/carry[9] , \sub_524/carry[10] ,
         \sub_524/carry[11] , \sub_524/carry[12] , \sub_524/carry[13] ,
         \add_509/carry[13] , \add_509/carry[12] , \add_509/carry[11] ,
         \add_509/carry[10] , \add_509/carry[9] , \add_509/carry[8] ,
         \add_509/carry[7] , \add_509/carry[6] , \add_509/carry[5] ,
         \add_509/carry[4] , \add_509/carry[3] , n1, n2, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n146, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195;
  wire   [3:0] state;
  wire   [3:0] nstate;
  wire   [7:0] input_data;
  wire   [7:0] data;
  assign res_addr[0] = N121;

  backward_pass_DW01_inc_0 add_581_2 ( .A(data), .SUM({N347, N346, N345, N344, 
        N343, N342, N341, N340}) );
  backward_pass_DW01_inc_1 add_581 ( .A({1'b0, data}), .SUM({N337, N336, N335, 
        N334, N333, N332, N331, N330, N329}) );
  backward_pass_DW01_dec_0 sub_536 ( .A({res_addr[13:1], N121}), .SUM({N239, 
        N238, N237, N236, N235, N234, N233, N232, N231, N230, N229, N228, N227, 
        N226}) );
  backward_pass_DW01_inc_2 r332 ( .A({res_addr[13:1], N121}), .SUM({N120, N119, 
        N118, N117, N116, N115, N114, N113, N112, N111, N110, N109, N108, N107}) );
  TLATX1 bp_done_reg ( .G(N359), .D(n195), .Q(bp_done) );
  TLATX1 res_rd_reg ( .G(N356), .D(N357), .Q(res_rd) );
  TLATNXL res_wr_reg ( .D(n194), .GN(n145), .Q(res_wr) );
  TLATXL \res_do_reg[0]  ( .G(N360), .D(N361), .Q(res_do[0]) );
  TLATXL \res_do_reg[7]  ( .G(N360), .D(N368), .Q(res_do[7]) );
  TLATXL \res_do_reg[6]  ( .G(N360), .D(N367), .Q(res_do[6]) );
  TLATXL \res_do_reg[5]  ( .G(N360), .D(N366), .Q(res_do[5]) );
  TLATXL \res_do_reg[4]  ( .G(N360), .D(N365), .Q(res_do[4]) );
  TLATXL \res_do_reg[3]  ( .G(N360), .D(N364), .Q(res_do[3]) );
  TLATXL \res_do_reg[2]  ( .G(N360), .D(N363), .Q(res_do[2]) );
  TLATXL \res_do_reg[1]  ( .G(N360), .D(N362), .Q(res_do[1]) );
  DFFQX1 \data_reg[7]  ( .D(n147), .CK(clk), .Q(data[7]) );
  DFFQX2 \res_addr_reg[10]  ( .D(n164), .CK(clk), .Q(res_addr[10]) );
  DFFQX2 \res_addr_reg[11]  ( .D(n163), .CK(clk), .Q(res_addr[11]) );
  DFFQX2 \res_addr_reg[13]  ( .D(n175), .CK(clk), .Q(res_addr[13]) );
  DFFX1 \res_addr_reg[1]  ( .D(n173), .CK(clk), .Q(n197), .QN(n7) );
  DFFX1 \res_addr_reg[2]  ( .D(n172), .CK(clk), .Q(n196) );
  DFFQX4 \res_addr_reg[0]  ( .D(n176), .CK(clk), .Q(N121) );
  DFFRX1 \state_reg[0]  ( .D(nstate[0]), .CK(clk), .RN(rstn), .Q(state[0]), 
        .QN(n2) );
  DFFQX1 \input_data_reg[0]  ( .D(n161), .CK(clk), .Q(input_data[0]) );
  DFFQX1 \input_data_reg[5]  ( .D(n156), .CK(clk), .Q(input_data[5]) );
  DFFQX1 \input_data_reg[7]  ( .D(n174), .CK(clk), .Q(input_data[7]) );
  DFFQX1 \input_data_reg[1]  ( .D(n160), .CK(clk), .Q(input_data[1]) );
  DFFQX1 \input_data_reg[2]  ( .D(n159), .CK(clk), .Q(input_data[2]) );
  DFFQX1 \input_data_reg[4]  ( .D(n157), .CK(clk), .Q(input_data[4]) );
  DFFRX1 \state_reg[2]  ( .D(nstate[2]), .CK(clk), .RN(rstn), .Q(state[2]), 
        .QN(n4) );
  DFFQX1 \input_data_reg[3]  ( .D(n158), .CK(clk), .Q(input_data[3]) );
  DFFQX1 \input_data_reg[6]  ( .D(n155), .CK(clk), .Q(input_data[6]) );
  DFFRX2 \state_reg[3]  ( .D(nstate[3]), .CK(clk), .RN(rstn), .Q(state[3]), 
        .QN(n5) );
  DFFQX1 \data_reg[0]  ( .D(n154), .CK(clk), .Q(data[0]) );
  DFFQX1 \data_reg[6]  ( .D(n148), .CK(clk), .Q(data[6]) );
  DFFQX2 \res_addr_reg[7]  ( .D(n167), .CK(clk), .Q(res_addr[7]) );
  DFFQX2 \res_addr_reg[8]  ( .D(n166), .CK(clk), .Q(res_addr[8]) );
  DFFQX2 \res_addr_reg[9]  ( .D(n165), .CK(clk), .Q(res_addr[9]) );
  DFFQX2 \res_addr_reg[12]  ( .D(n162), .CK(clk), .Q(res_addr[12]) );
  DFFQX2 \res_addr_reg[5]  ( .D(n169), .CK(clk), .Q(res_addr[5]) );
  DFFQX1 \data_reg[5]  ( .D(n149), .CK(clk), .Q(data[5]) );
  DFFQX1 \data_reg[3]  ( .D(n151), .CK(clk), .Q(data[3]) );
  DFFQX1 \data_reg[1]  ( .D(n153), .CK(clk), .Q(data[1]) );
  DFFQX1 \data_reg[4]  ( .D(n150), .CK(clk), .Q(data[4]) );
  DFFQX1 \data_reg[2]  ( .D(n152), .CK(clk), .Q(data[2]) );
  DFFQX2 \res_addr_reg[3]  ( .D(n171), .CK(clk), .Q(res_addr[3]) );
  DFFQX2 \res_addr_reg[4]  ( .D(n170), .CK(clk), .Q(res_addr[4]) );
  DFFQX2 \res_addr_reg[6]  ( .D(n168), .CK(clk), .Q(res_addr[6]) );
  DFFRX1 \state_reg[1]  ( .D(nstate[1]), .CK(clk), .RN(rstn), .Q(state[1]), 
        .QN(n1) );
  OA21XL U3 ( .A0(res_di[7]), .A1(n35), .B0(n30), .Y(n6) );
  NOR2X2 U4 ( .A(n136), .B(N338), .Y(n189) );
  OAI31X1 U5 ( .A0(n74), .A1(N337), .A2(N336), .B0(n55), .Y(N338) );
  NAND2X2 U6 ( .A(n11), .B(n12), .Y(n73) );
  OAI21X1 U7 ( .A0(state[3]), .A1(n187), .B0(n183), .Y(nstate[2]) );
  NOR2BX2 U8 ( .AN(N338), .B(n136), .Y(n188) );
  NOR4X1 U9 ( .A(nstate[0]), .B(nstate[1]), .C(nstate[2]), .D(nstate[3]), .Y(
        n133) );
  OAI31X4 U11 ( .A0(n2), .A1(state[3]), .A2(state[1]), .B0(n178), .Y(nstate[1]) );
  AOI2BB1X2 U12 ( .A0N(n111), .A1N(n6), .B0(n13), .Y(n134) );
  OAI21X4 U13 ( .A0(state[3]), .A1(n190), .B0(n136), .Y(N360) );
  INVXL U14 ( .A(n133), .Y(n68) );
  NOR2XL U15 ( .A(n13), .B(n133), .Y(n112) );
  INVXL U16 ( .A(nstate[1]), .Y(n177) );
  NAND3XL U17 ( .A(nstate[1]), .B(n116), .C(nstate[0]), .Y(n113) );
  INVX1 U18 ( .A(nstate[2]), .Y(n116) );
  INVX1 U19 ( .A(n194), .Y(n136) );
  AND4X2 U20 ( .A(n111), .B(n65), .C(n112), .D(n113), .Y(n60) );
  CLKBUFX3 U21 ( .A(n59), .Y(n14) );
  NOR3X1 U22 ( .A(n177), .B(n116), .C(n118), .Y(n59) );
  CLKBUFX3 U23 ( .A(n63), .Y(n9) );
  OAI21XL U24 ( .A0(n116), .A1(n117), .B0(n113), .Y(n63) );
  CLKBUFX3 U25 ( .A(n68), .Y(n11) );
  CLKBUFX3 U26 ( .A(n61), .Y(n13) );
  NOR3XL U27 ( .A(nstate[0]), .B(nstate[1]), .C(n116), .Y(n61) );
  CLKBUFX3 U28 ( .A(n64), .Y(n8) );
  NOR3BXL U29 ( .AN(n114), .B(n115), .C(n65), .Y(n64) );
  CLKBUFX3 U30 ( .A(n62), .Y(n10) );
  NOR3X1 U31 ( .A(n114), .B(n115), .C(n65), .Y(n62) );
  CLKBUFX3 U32 ( .A(n71), .Y(n12) );
  NAND3XL U33 ( .A(n118), .B(n116), .C(nstate[1]), .Y(n71) );
  CLKINVX1 U34 ( .A(n41), .Y(n54) );
  CLKINVX1 U35 ( .A(N335), .Y(n53) );
  CLKINVX1 U36 ( .A(N333), .Y(n52) );
  CLKBUFX3 U37 ( .A(n197), .Y(res_addr[1]) );
  CLKBUFX3 U38 ( .A(n196), .Y(res_addr[2]) );
  CLKINVX1 U39 ( .A(data[1]), .Y(n32) );
  CLKINVX1 U40 ( .A(data[7]), .Y(n35) );
  CLKINVX1 U41 ( .A(data[5]), .Y(n34) );
  CLKINVX1 U42 ( .A(data[3]), .Y(n33) );
  CLKINVX1 U43 ( .A(N121), .Y(N212) );
  CLKINVX1 U44 ( .A(n50), .Y(n55) );
  CLKINVX1 U45 ( .A(N330), .Y(n51) );
  CLKINVX1 U46 ( .A(res_di[6]), .Y(n31) );
  XOR2X1 U47 ( .A(res_addr[13]), .B(\add_509/carry[13] ), .Y(N134) );
  AND2X1 U48 ( .A(\add_509/carry[12] ), .B(res_addr[12]), .Y(
        \add_509/carry[13] ) );
  XOR2X1 U49 ( .A(res_addr[12]), .B(\add_509/carry[12] ), .Y(N133) );
  AND2X1 U50 ( .A(\add_509/carry[11] ), .B(res_addr[11]), .Y(
        \add_509/carry[12] ) );
  XOR2X1 U51 ( .A(res_addr[11]), .B(\add_509/carry[11] ), .Y(N132) );
  AND2X1 U52 ( .A(\add_509/carry[10] ), .B(res_addr[10]), .Y(
        \add_509/carry[11] ) );
  XOR2X1 U53 ( .A(res_addr[10]), .B(\add_509/carry[10] ), .Y(N131) );
  AND2X1 U54 ( .A(\add_509/carry[9] ), .B(res_addr[9]), .Y(\add_509/carry[10] ) );
  XOR2X1 U55 ( .A(res_addr[9]), .B(\add_509/carry[9] ), .Y(N130) );
  AND2X1 U56 ( .A(\add_509/carry[8] ), .B(res_addr[8]), .Y(\add_509/carry[9] )
         );
  XOR2X1 U57 ( .A(res_addr[8]), .B(\add_509/carry[8] ), .Y(N129) );
  AND2X1 U58 ( .A(\add_509/carry[7] ), .B(res_addr[7]), .Y(\add_509/carry[8] )
         );
  XOR2X1 U59 ( .A(res_addr[7]), .B(\add_509/carry[7] ), .Y(N128) );
  OR2X1 U60 ( .A(res_addr[6]), .B(\add_509/carry[6] ), .Y(\add_509/carry[7] )
         );
  XNOR2X1 U61 ( .A(\add_509/carry[6] ), .B(res_addr[6]), .Y(N127) );
  OR2X1 U62 ( .A(res_addr[5]), .B(\add_509/carry[5] ), .Y(\add_509/carry[6] )
         );
  XNOR2X1 U63 ( .A(\add_509/carry[5] ), .B(res_addr[5]), .Y(N126) );
  OR2X1 U64 ( .A(res_addr[4]), .B(\add_509/carry[4] ), .Y(\add_509/carry[5] )
         );
  XNOR2X1 U65 ( .A(\add_509/carry[4] ), .B(res_addr[4]), .Y(N125) );
  OR2X1 U66 ( .A(res_addr[3]), .B(\add_509/carry[3] ), .Y(\add_509/carry[4] )
         );
  XNOR2X1 U67 ( .A(\add_509/carry[3] ), .B(res_addr[3]), .Y(N124) );
  OR2X1 U68 ( .A(res_addr[2]), .B(res_addr[1]), .Y(\add_509/carry[3] ) );
  XNOR2X1 U69 ( .A(res_addr[1]), .B(res_addr[2]), .Y(N123) );
  XNOR2X1 U70 ( .A(res_addr[13]), .B(\sub_524/carry[13] ), .Y(N196) );
  OR2X1 U71 ( .A(res_addr[12]), .B(\sub_524/carry[12] ), .Y(
        \sub_524/carry[13] ) );
  XNOR2X1 U72 ( .A(\sub_524/carry[12] ), .B(res_addr[12]), .Y(N195) );
  OR2X1 U73 ( .A(res_addr[11]), .B(\sub_524/carry[11] ), .Y(
        \sub_524/carry[12] ) );
  XNOR2X1 U74 ( .A(\sub_524/carry[11] ), .B(res_addr[11]), .Y(N194) );
  OR2X1 U75 ( .A(res_addr[10]), .B(\sub_524/carry[10] ), .Y(
        \sub_524/carry[11] ) );
  XNOR2X1 U76 ( .A(\sub_524/carry[10] ), .B(res_addr[10]), .Y(N193) );
  OR2X1 U77 ( .A(res_addr[9]), .B(\sub_524/carry[9] ), .Y(\sub_524/carry[10] )
         );
  XNOR2X1 U78 ( .A(\sub_524/carry[9] ), .B(res_addr[9]), .Y(N192) );
  OR2X1 U79 ( .A(res_addr[8]), .B(\sub_524/carry[8] ), .Y(\sub_524/carry[9] )
         );
  XNOR2X1 U80 ( .A(\sub_524/carry[8] ), .B(res_addr[8]), .Y(N191) );
  AND2X1 U81 ( .A(\sub_524/carry[7] ), .B(res_addr[7]), .Y(\sub_524/carry[8] )
         );
  XOR2X1 U82 ( .A(res_addr[7]), .B(\sub_524/carry[7] ), .Y(N190) );
  OR2X1 U83 ( .A(res_addr[6]), .B(\sub_524/carry[6] ), .Y(\sub_524/carry[7] )
         );
  XNOR2X1 U84 ( .A(\sub_524/carry[6] ), .B(res_addr[6]), .Y(N189) );
  OR2X1 U85 ( .A(res_addr[5]), .B(\sub_524/carry[5] ), .Y(\sub_524/carry[6] )
         );
  XNOR2X1 U86 ( .A(\sub_524/carry[5] ), .B(res_addr[5]), .Y(N188) );
  OR2X1 U87 ( .A(res_addr[4]), .B(\sub_524/carry[4] ), .Y(\sub_524/carry[5] )
         );
  XNOR2X1 U88 ( .A(\sub_524/carry[4] ), .B(res_addr[4]), .Y(N187) );
  OR2X1 U89 ( .A(res_addr[3]), .B(\sub_524/carry[3] ), .Y(\sub_524/carry[4] )
         );
  XNOR2X1 U90 ( .A(\sub_524/carry[3] ), .B(res_addr[3]), .Y(N186) );
  OR2X1 U91 ( .A(res_addr[2]), .B(\sub_524/carry[2] ), .Y(\sub_524/carry[3] )
         );
  XNOR2X1 U92 ( .A(\sub_524/carry[2] ), .B(res_addr[2]), .Y(N185) );
  OR2X1 U93 ( .A(res_addr[1]), .B(N121), .Y(\sub_524/carry[2] ) );
  XNOR2X1 U94 ( .A(N121), .B(res_addr[1]), .Y(N184) );
  XNOR2X1 U95 ( .A(res_addr[13]), .B(\sub_534/carry[13] ), .Y(N225) );
  OR2X1 U96 ( .A(res_addr[12]), .B(\sub_534/carry[12] ), .Y(
        \sub_534/carry[13] ) );
  XNOR2X1 U97 ( .A(\sub_534/carry[12] ), .B(res_addr[12]), .Y(N224) );
  OR2X1 U98 ( .A(res_addr[11]), .B(\sub_534/carry[11] ), .Y(
        \sub_534/carry[12] ) );
  XNOR2X1 U99 ( .A(\sub_534/carry[11] ), .B(res_addr[11]), .Y(N223) );
  OR2X1 U100 ( .A(res_addr[10]), .B(\sub_534/carry[10] ), .Y(
        \sub_534/carry[11] ) );
  XNOR2X1 U101 ( .A(\sub_534/carry[10] ), .B(res_addr[10]), .Y(N222) );
  OR2X1 U102 ( .A(res_addr[9]), .B(\sub_534/carry[9] ), .Y(\sub_534/carry[10] ) );
  XNOR2X1 U103 ( .A(\sub_534/carry[9] ), .B(res_addr[9]), .Y(N221) );
  OR2X1 U104 ( .A(res_addr[8]), .B(\sub_534/carry[8] ), .Y(\sub_534/carry[9] )
         );
  XNOR2X1 U105 ( .A(\sub_534/carry[8] ), .B(res_addr[8]), .Y(N220) );
  OR2X1 U106 ( .A(res_addr[7]), .B(\sub_534/carry[7] ), .Y(\sub_534/carry[8] )
         );
  XNOR2X1 U107 ( .A(\sub_534/carry[7] ), .B(res_addr[7]), .Y(N219) );
  OR2X1 U108 ( .A(res_addr[6]), .B(\sub_534/carry[6] ), .Y(\sub_534/carry[7] )
         );
  XNOR2X1 U109 ( .A(\sub_534/carry[6] ), .B(res_addr[6]), .Y(N218) );
  OR2X1 U110 ( .A(res_addr[5]), .B(\sub_534/carry[5] ), .Y(\sub_534/carry[6] )
         );
  XNOR2X1 U111 ( .A(\sub_534/carry[5] ), .B(res_addr[5]), .Y(N217) );
  OR2X1 U112 ( .A(res_addr[4]), .B(\sub_534/carry[4] ), .Y(\sub_534/carry[5] )
         );
  XNOR2X1 U113 ( .A(\sub_534/carry[4] ), .B(res_addr[4]), .Y(N216) );
  OR2X1 U114 ( .A(res_addr[3]), .B(\sub_534/carry[3] ), .Y(\sub_534/carry[4] )
         );
  XNOR2X1 U115 ( .A(\sub_534/carry[3] ), .B(res_addr[3]), .Y(N215) );
  OR2X1 U116 ( .A(res_addr[2]), .B(\sub_534/carry[2] ), .Y(\sub_534/carry[3] )
         );
  XNOR2X1 U117 ( .A(\sub_534/carry[2] ), .B(res_addr[2]), .Y(N214) );
  AND2X1 U118 ( .A(N121), .B(res_addr[1]), .Y(\sub_534/carry[2] ) );
  XOR2X1 U119 ( .A(res_addr[1]), .B(N121), .Y(N213) );
  NAND2BX1 U120 ( .AN(res_di[4]), .B(data[4]), .Y(n17) );
  OAI222XL U121 ( .A0(res_di[5]), .A1(n34), .B0(res_di[5]), .B1(n17), .C0(n34), 
        .C1(n17), .Y(n18) );
  OAI222XL U122 ( .A0(data[6]), .A1(n18), .B0(n31), .B1(n18), .C0(data[6]), 
        .C1(n31), .Y(n29) );
  NAND2BX1 U123 ( .AN(res_di[2]), .B(data[2]), .Y(n21) );
  OAI22XL U124 ( .A0(res_di[3]), .A1(n33), .B0(res_di[3]), .B1(n21), .Y(n27)
         );
  NOR2BX1 U125 ( .AN(res_di[2]), .B(data[2]), .Y(n19) );
  OA22X1 U126 ( .A0(n19), .A1(res_di[3]), .B0(n19), .B1(n33), .Y(n23) );
  AOI21X1 U127 ( .A0(res_di[1]), .A1(n32), .B0(res_di[0]), .Y(n20) );
  AOI2BB2X1 U128 ( .B0(n20), .B1(data[0]), .A0N(res_di[1]), .A1N(n32), .Y(n22)
         );
  OAI22XL U129 ( .A0(n23), .A1(n22), .B0(n21), .B1(n33), .Y(n26) );
  NOR2BX1 U130 ( .AN(res_di[4]), .B(data[4]), .Y(n24) );
  OAI22XL U131 ( .A0(n24), .A1(n34), .B0(res_di[5]), .B1(n24), .Y(n25) );
  OAI221XL U132 ( .A0(data[6]), .A1(n31), .B0(n27), .B1(n26), .C0(n25), .Y(n28) );
  AO22X1 U133 ( .A0(n35), .A1(res_di[7]), .B0(n29), .B1(n28), .Y(n30) );
  NOR2BX1 U134 ( .AN(input_data[2]), .B(N331), .Y(n41) );
  AOI2BB1X1 U135 ( .A0N(n51), .A1N(input_data[1]), .B0(N329), .Y(n36) );
  AO22X1 U136 ( .A0(n36), .A1(input_data[0]), .B0(input_data[1]), .B1(n51), 
        .Y(n40) );
  NOR2BX1 U137 ( .AN(N331), .B(input_data[2]), .Y(n37) );
  OAI22XL U138 ( .A0(n37), .A1(n127), .B0(N332), .B1(n37), .Y(n39) );
  OAI22XL U139 ( .A0(N332), .A1(n127), .B0(N332), .B1(n54), .Y(n38) );
  AOI221XL U140 ( .A0(input_data[3]), .A1(n41), .B0(n40), .B1(n39), .C0(n38), 
        .Y(n48) );
  NOR2X1 U141 ( .A(n52), .B(input_data[4]), .Y(n42) );
  OAI22XL U142 ( .A0(n42), .A1(n131), .B0(N334), .B1(n42), .Y(n43) );
  OAI21XL U143 ( .A0(input_data[6]), .A1(n53), .B0(n43), .Y(n47) );
  NAND2X1 U144 ( .A(input_data[4]), .B(n52), .Y(n44) );
  OAI222XL U145 ( .A0(N334), .A1(n131), .B0(N334), .B1(n44), .C0(n131), .C1(
        n44), .Y(n45) );
  OAI222XL U146 ( .A0(input_data[6]), .A1(n45), .B0(n53), .B1(n45), .C0(
        input_data[6]), .C1(n53), .Y(n46) );
  OA21XL U147 ( .A0(n48), .A1(n47), .B0(n46), .Y(n49) );
  AOI211X1 U148 ( .A0(n74), .A1(N336), .B0(N337), .C0(n49), .Y(n50) );
  NAND3X1 U149 ( .A(n56), .B(n57), .C(n58), .Y(n176) );
  AOI222XL U150 ( .A0(N212), .A1(n14), .B0(n60), .B1(N121), .C0(N121), .C1(n13), .Y(n58) );
  AOI22X1 U151 ( .A0(N212), .A1(n10), .B0(N107), .B1(n9), .Y(n57) );
  AOI2BB2X1 U152 ( .B0(N226), .B1(n8), .A0N(n65), .A1N(n66), .Y(n56) );
  NAND4X1 U153 ( .A(n67), .B(n11), .C(n69), .D(n70), .Y(n175) );
  AOI222XL U154 ( .A0(N196), .A1(n14), .B0(res_addr[13]), .B1(n60), .C0(N134), 
        .C1(n13), .Y(n70) );
  AOI22X1 U155 ( .A0(N120), .A1(n9), .B0(N239), .B1(n8), .Y(n69) );
  NAND2X1 U156 ( .A(N225), .B(n10), .Y(n67) );
  OAI22XL U157 ( .A0(n12), .A1(n72), .B0(n73), .B1(n74), .Y(n174) );
  CLKINVX1 U158 ( .A(input_data[7]), .Y(n74) );
  NAND4X1 U159 ( .A(n75), .B(n11), .C(n76), .D(n77), .Y(n173) );
  AOI222XL U160 ( .A0(N184), .A1(n14), .B0(res_addr[1]), .B1(n60), .C0(n7), 
        .C1(n13), .Y(n77) );
  AOI22X1 U161 ( .A0(N108), .A1(n9), .B0(N227), .B1(n8), .Y(n76) );
  NAND2X1 U162 ( .A(N213), .B(n10), .Y(n75) );
  NAND4X1 U163 ( .A(n78), .B(n11), .C(n79), .D(n80), .Y(n172) );
  AOI222XL U164 ( .A0(N185), .A1(n14), .B0(res_addr[2]), .B1(n60), .C0(N123), 
        .C1(n13), .Y(n80) );
  AOI22X1 U165 ( .A0(N109), .A1(n9), .B0(N228), .B1(n8), .Y(n79) );
  NAND2X1 U166 ( .A(N214), .B(n10), .Y(n78) );
  NAND4X1 U167 ( .A(n81), .B(n11), .C(n82), .D(n83), .Y(n171) );
  AOI222XL U168 ( .A0(N186), .A1(n14), .B0(res_addr[3]), .B1(n60), .C0(N124), 
        .C1(n13), .Y(n83) );
  AOI22X1 U169 ( .A0(N110), .A1(n9), .B0(N229), .B1(n8), .Y(n82) );
  NAND2X1 U170 ( .A(N215), .B(n10), .Y(n81) );
  NAND4X1 U171 ( .A(n84), .B(n11), .C(n85), .D(n86), .Y(n170) );
  AOI222XL U172 ( .A0(N187), .A1(n14), .B0(res_addr[4]), .B1(n60), .C0(N125), 
        .C1(n13), .Y(n86) );
  AOI22X1 U173 ( .A0(N111), .A1(n9), .B0(N230), .B1(n8), .Y(n85) );
  NAND2X1 U174 ( .A(N216), .B(n10), .Y(n84) );
  NAND4X1 U175 ( .A(n87), .B(n11), .C(n88), .D(n89), .Y(n169) );
  AOI222XL U176 ( .A0(N188), .A1(n14), .B0(res_addr[5]), .B1(n60), .C0(N126), 
        .C1(n13), .Y(n89) );
  AOI22X1 U177 ( .A0(N112), .A1(n9), .B0(N231), .B1(n8), .Y(n88) );
  NAND2X1 U178 ( .A(N217), .B(n10), .Y(n87) );
  NAND4X1 U179 ( .A(n90), .B(n11), .C(n91), .D(n92), .Y(n168) );
  AOI222XL U180 ( .A0(N189), .A1(n14), .B0(res_addr[6]), .B1(n60), .C0(N127), 
        .C1(n13), .Y(n92) );
  AOI22X1 U181 ( .A0(N113), .A1(n9), .B0(N232), .B1(n8), .Y(n91) );
  NAND2X1 U182 ( .A(N218), .B(n10), .Y(n90) );
  NAND3X1 U183 ( .A(n93), .B(n94), .C(n95), .Y(n167) );
  AOI222XL U184 ( .A0(N190), .A1(n14), .B0(n60), .B1(res_addr[7]), .C0(N128), 
        .C1(n13), .Y(n95) );
  AOI22X1 U185 ( .A0(N219), .A1(n10), .B0(N114), .B1(n9), .Y(n94) );
  AOI2BB2X1 U186 ( .B0(N233), .B1(n8), .A0N(n65), .A1N(n66), .Y(n93) );
  NAND4X1 U187 ( .A(n96), .B(n11), .C(n97), .D(n98), .Y(n166) );
  AOI222XL U188 ( .A0(N191), .A1(n14), .B0(res_addr[8]), .B1(n60), .C0(N129), 
        .C1(n13), .Y(n98) );
  AOI22X1 U189 ( .A0(N115), .A1(n9), .B0(N234), .B1(n8), .Y(n97) );
  NAND2X1 U190 ( .A(N220), .B(n10), .Y(n96) );
  NAND4X1 U191 ( .A(n99), .B(n11), .C(n100), .D(n101), .Y(n165) );
  AOI222XL U192 ( .A0(N192), .A1(n14), .B0(res_addr[9]), .B1(n60), .C0(N130), 
        .C1(n13), .Y(n101) );
  AOI22X1 U193 ( .A0(N116), .A1(n9), .B0(N235), .B1(n8), .Y(n100) );
  NAND2X1 U194 ( .A(N221), .B(n10), .Y(n99) );
  NAND4X1 U195 ( .A(n102), .B(n11), .C(n103), .D(n104), .Y(n164) );
  AOI222XL U196 ( .A0(N193), .A1(n14), .B0(res_addr[10]), .B1(n60), .C0(N131), 
        .C1(n13), .Y(n104) );
  AOI22X1 U197 ( .A0(N117), .A1(n9), .B0(N236), .B1(n8), .Y(n103) );
  NAND2X1 U198 ( .A(N222), .B(n10), .Y(n102) );
  NAND4X1 U199 ( .A(n105), .B(n11), .C(n106), .D(n107), .Y(n163) );
  AOI222XL U200 ( .A0(N194), .A1(n14), .B0(res_addr[11]), .B1(n60), .C0(N132), 
        .C1(n13), .Y(n107) );
  AOI22X1 U201 ( .A0(N118), .A1(n9), .B0(N237), .B1(n8), .Y(n106) );
  NAND2X1 U202 ( .A(N223), .B(n10), .Y(n105) );
  NAND4X1 U203 ( .A(n108), .B(n11), .C(n109), .D(n110), .Y(n162) );
  AOI222XL U204 ( .A0(N195), .A1(n14), .B0(res_addr[12]), .B1(n60), .C0(N133), 
        .C1(n13), .Y(n110) );
  AOI22X1 U205 ( .A0(N119), .A1(n9), .B0(N238), .B1(n8), .Y(n109) );
  NAND2X1 U206 ( .A(N224), .B(n10), .Y(n108) );
  NAND2X1 U207 ( .A(nstate[3]), .B(n118), .Y(n65) );
  CLKINVX1 U208 ( .A(n66), .Y(n115) );
  NAND4BBXL U209 ( .AN(res_addr[1]), .BN(res_addr[2]), .C(N121), .D(n119), .Y(
        n114) );
  NOR4X1 U210 ( .A(res_addr[6]), .B(res_addr[5]), .C(res_addr[4]), .D(
        res_addr[3]), .Y(n119) );
  OAI22XL U211 ( .A0(n12), .A1(n120), .B0(n73), .B1(n121), .Y(n161) );
  CLKINVX1 U212 ( .A(input_data[0]), .Y(n121) );
  OAI22XL U213 ( .A0(n12), .A1(n122), .B0(n73), .B1(n123), .Y(n160) );
  CLKINVX1 U214 ( .A(input_data[1]), .Y(n123) );
  OAI22XL U215 ( .A0(n12), .A1(n124), .B0(n73), .B1(n125), .Y(n159) );
  CLKINVX1 U216 ( .A(input_data[2]), .Y(n125) );
  OAI22XL U217 ( .A0(n12), .A1(n126), .B0(n73), .B1(n127), .Y(n158) );
  CLKINVX1 U218 ( .A(input_data[3]), .Y(n127) );
  OAI22XL U219 ( .A0(n12), .A1(n128), .B0(n73), .B1(n129), .Y(n157) );
  CLKINVX1 U220 ( .A(input_data[4]), .Y(n129) );
  OAI22XL U221 ( .A0(n12), .A1(n130), .B0(n73), .B1(n131), .Y(n156) );
  CLKINVX1 U222 ( .A(input_data[5]), .Y(n131) );
  OAI22XL U223 ( .A0(n12), .A1(n31), .B0(n73), .B1(n132), .Y(n155) );
  CLKINVX1 U224 ( .A(input_data[6]), .Y(n132) );
  OAI2BB2XL U225 ( .B0(n134), .B1(n120), .A0N(data[0]), .A1N(n135), .Y(n154)
         );
  CLKINVX1 U226 ( .A(res_di[0]), .Y(n120) );
  OAI2BB2XL U227 ( .B0(n134), .B1(n122), .A0N(data[1]), .A1N(n135), .Y(n153)
         );
  CLKINVX1 U228 ( .A(res_di[1]), .Y(n122) );
  OAI2BB2XL U229 ( .B0(n134), .B1(n124), .A0N(data[2]), .A1N(n135), .Y(n152)
         );
  CLKINVX1 U230 ( .A(res_di[2]), .Y(n124) );
  OAI2BB2XL U231 ( .B0(n134), .B1(n126), .A0N(data[3]), .A1N(n135), .Y(n151)
         );
  CLKINVX1 U232 ( .A(res_di[3]), .Y(n126) );
  OAI2BB2XL U233 ( .B0(n134), .B1(n128), .A0N(data[4]), .A1N(n135), .Y(n150)
         );
  CLKINVX1 U234 ( .A(res_di[4]), .Y(n128) );
  OAI2BB2XL U235 ( .B0(n134), .B1(n130), .A0N(data[5]), .A1N(n135), .Y(n149)
         );
  CLKINVX1 U236 ( .A(res_di[5]), .Y(n130) );
  OAI2BB2XL U237 ( .B0(n134), .B1(n31), .A0N(data[6]), .A1N(n135), .Y(n148) );
  OAI2BB2XL U238 ( .B0(n134), .B1(n72), .A0N(data[7]), .A1N(n135), .Y(n147) );
  CLKMX2X2 U239 ( .A(n6), .B(n112), .S0(n111), .Y(n135) );
  NAND3BX1 U240 ( .AN(n195), .B(n136), .C(n137), .Y(nstate[3]) );
  OA22X1 U241 ( .A0(n138), .A1(n66), .B0(n139), .B1(n140), .Y(n137) );
  OAI211X1 U242 ( .A0(n141), .A1(n142), .B0(n143), .C0(n144), .Y(n66) );
  NOR4X1 U243 ( .A(res_addr[9]), .B(res_addr[8]), .C(res_addr[13]), .D(
        res_addr[12]), .Y(n144) );
  NOR2X1 U244 ( .A(res_addr[11]), .B(res_addr[10]), .Y(n143) );
  CLKINVX1 U245 ( .A(res_addr[7]), .Y(n142) );
  NOR4X1 U246 ( .A(n146), .B(N121), .C(res_addr[2]), .D(res_addr[1]), .Y(n141)
         );
  OR4X1 U247 ( .A(res_addr[3]), .B(res_addr[4]), .C(res_addr[5]), .D(
        res_addr[6]), .Y(n146) );
  CLKINVX1 U248 ( .A(res_di[7]), .Y(n72) );
  AOI2BB1X1 U249 ( .A0N(n116), .A1N(n117), .B0(n14), .Y(n111) );
  XNOR2X1 U250 ( .A(n118), .B(n177), .Y(n117) );
  CLKINVX1 U251 ( .A(nstate[0]), .Y(n118) );
  NAND4X1 U252 ( .A(n178), .B(n179), .C(n180), .D(n138), .Y(nstate[0]) );
  NAND3X1 U253 ( .A(n2), .B(n5), .C(state[2]), .Y(n180) );
  NAND2X1 U254 ( .A(fp_done), .B(n181), .Y(n179) );
  OA21XL U255 ( .A0(n182), .A1(n140), .B0(n183), .Y(n178) );
  NAND2X1 U256 ( .A(n184), .B(n4), .Y(n140) );
  CLKINVX1 U257 ( .A(n139), .Y(n182) );
  NAND2X1 U258 ( .A(n185), .B(n186), .Y(n139) );
  NOR4X1 U259 ( .A(input_data[7]), .B(input_data[6]), .C(input_data[5]), .D(
        input_data[4]), .Y(n186) );
  NOR4X1 U260 ( .A(input_data[3]), .B(input_data[2]), .C(input_data[1]), .D(
        input_data[0]), .Y(n185) );
  NAND2X1 U261 ( .A(n184), .B(state[2]), .Y(n183) );
  NOR3X1 U262 ( .A(state[0]), .B(state[3]), .C(n1), .Y(n184) );
  AO22X1 U263 ( .A0(N347), .A1(n188), .B0(n189), .B1(input_data[7]), .Y(N368)
         );
  AO22X1 U264 ( .A0(N346), .A1(n188), .B0(n189), .B1(input_data[6]), .Y(N367)
         );
  AO22X1 U265 ( .A0(N345), .A1(n188), .B0(n189), .B1(input_data[5]), .Y(N366)
         );
  AO22X1 U266 ( .A0(N344), .A1(n188), .B0(n189), .B1(input_data[4]), .Y(N365)
         );
  AO22X1 U267 ( .A0(N343), .A1(n188), .B0(n189), .B1(input_data[3]), .Y(N364)
         );
  AO22X1 U268 ( .A0(N342), .A1(n188), .B0(n189), .B1(input_data[2]), .Y(N363)
         );
  AO22X1 U269 ( .A0(N341), .A1(n188), .B0(n189), .B1(input_data[1]), .Y(N362)
         );
  AO22X1 U270 ( .A0(N340), .A1(n188), .B0(n189), .B1(input_data[0]), .Y(N361)
         );
  AOI21X1 U271 ( .A0(n191), .A1(n187), .B0(state[3]), .Y(N357) );
  MXI2X1 U272 ( .A(n1), .B(n192), .S0(n4), .Y(n187) );
  NOR2X1 U273 ( .A(n2), .B(n1), .Y(n192) );
  MXI2X1 U274 ( .A(n193), .B(state[2]), .S0(n2), .Y(n191) );
  NAND2X1 U275 ( .A(n145), .B(state[3]), .Y(N356) );
  NOR3X1 U276 ( .A(n194), .B(N359), .C(n181), .Y(n145) );
  AO21X1 U277 ( .A0(n5), .A1(n181), .B0(n195), .Y(N359) );
  NOR2X1 U278 ( .A(n2), .B(n138), .Y(n195) );
  NAND2X1 U279 ( .A(state[3]), .B(n193), .Y(n138) );
  NOR2X1 U280 ( .A(n190), .B(state[0]), .Y(n181) );
  CLKINVX1 U281 ( .A(n193), .Y(n190) );
  NOR2X1 U282 ( .A(state[2]), .B(state[1]), .Y(n193) );
  NOR4X1 U283 ( .A(n4), .B(n1), .C(n2), .D(state[3]), .Y(n194) );
endmodule


module DT ( clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, 
        res_addr, res_do, res_di );
  output [9:0] sti_addr;
  input [15:0] sti_di;
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, reset;
  output done, sti_rd, res_wr, res_rd;
  wire   initialize_done, fp_done, bp_done, \nstate[1] , sti_rd_init,
         res_wr_init, \res_do_init[0] , res_rd_fp, res_wr_fp, res_rd_bp,
         res_wr_bp, N29, n27, n28, n29, n30, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n64, n65,
         n66, n67, n84;
  wire   [1:0] state;
  wire   [9:0] sti_addr_init;
  wire   [13:0] res_addr_init;
  wire   [13:0] res_addr_fp;
  wire   [7:0] res_do_fp;
  wire   [13:0] res_addr_bp;
  wire   [7:0] res_do_bp;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6;
  assign done = N29;

  initialize init ( .clk(clk), .rstn(reset), .sti_rd(sti_rd_init), .sti_addr(
        sti_addr_init), .sti_di(sti_di), .res_wr(res_wr_init), .res_addr(
        res_addr_init), .res_do({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, \res_do_init[0] }), 
        .initialize_done(initialize_done) );
  forward_pass fp ( .clk(clk), .rstn(reset), .initialize_done(initialize_done), 
        .res_rd(res_rd_fp), .res_wr(res_wr_fp), .res_addr(res_addr_fp), 
        .res_do(res_do_fp), .res_di(res_di), .fp_done(fp_done) );
  backward_pass bp ( .clk(clk), .rstn(reset), .fp_done(fp_done), .res_rd(
        res_rd_bp), .res_wr(res_wr_bp), .res_addr(res_addr_bp), .res_do(
        res_do_bp), .res_di(res_di), .bp_done(bp_done) );
  DFFRX1 \state_reg[0]  ( .D(n84), .CK(clk), .RN(reset), .Q(state[0]), .QN(n55) );
  DFFRX1 \state_reg[1]  ( .D(\nstate[1] ), .CK(clk), .RN(reset), .Q(state[1]), 
        .QN(n56) );
  NOR2X1 U71 ( .A(state[0]), .B(state[1]), .Y(n27) );
  NOR2X1 U72 ( .A(n55), .B(n56), .Y(N29) );
  CLKBUFX3 U73 ( .A(n27), .Y(n67) );
  CLKBUFX3 U74 ( .A(n29), .Y(n65) );
  CLKBUFX3 U75 ( .A(n27), .Y(n66) );
  CLKBUFX3 U76 ( .A(n30), .Y(n64) );
  CLKINVX1 U77 ( .A(n53), .Y(n84) );
  AOI211X1 U78 ( .A0(n67), .A1(initialize_done), .B0(N29), .C0(n54), .Y(n53)
         );
  OAI2BB2XL U79 ( .B0(n55), .B1(fp_done), .A0N(bp_done), .A1N(state[1]), .Y(
        n54) );
  OAI2BB1X1 U80 ( .A0N(state[0]), .A1N(fp_done), .B0(n56), .Y(\nstate[1] ) );
  NOR2X1 U81 ( .A(n56), .B(state[0]), .Y(n29) );
  NOR2X1 U82 ( .A(n55), .B(state[1]), .Y(n30) );
  CLKINVX1 U83 ( .A(n38), .Y(res_do[0]) );
  AOI222XL U84 ( .A0(\res_do_init[0] ), .A1(n66), .B0(res_do_bp[0]), .B1(n65), 
        .C0(res_do_fp[0]), .C1(n30), .Y(n38) );
  CLKINVX1 U85 ( .A(n52), .Y(res_addr[0]) );
  AOI222XL U86 ( .A0(res_addr_init[0]), .A1(n67), .B0(res_addr_bp[0]), .B1(n65), .C0(res_addr_fp[0]), .C1(n30), .Y(n52) );
  CLKINVX1 U87 ( .A(n47), .Y(res_addr[1]) );
  AOI222XL U88 ( .A0(res_addr_init[1]), .A1(n66), .B0(res_addr_bp[1]), .B1(n29), .C0(res_addr_fp[1]), .C1(n64), .Y(n47) );
  CLKINVX1 U89 ( .A(n46), .Y(res_addr[2]) );
  AOI222XL U90 ( .A0(res_addr_init[2]), .A1(n66), .B0(res_addr_bp[2]), .B1(n29), .C0(res_addr_fp[2]), .C1(n64), .Y(n46) );
  CLKINVX1 U91 ( .A(n45), .Y(res_addr[3]) );
  AOI222XL U92 ( .A0(res_addr_init[3]), .A1(n66), .B0(res_addr_bp[3]), .B1(n29), .C0(res_addr_fp[3]), .C1(n64), .Y(n45) );
  CLKINVX1 U93 ( .A(n44), .Y(res_addr[4]) );
  AOI222XL U94 ( .A0(res_addr_init[4]), .A1(n66), .B0(res_addr_bp[4]), .B1(n29), .C0(res_addr_fp[4]), .C1(n64), .Y(n44) );
  CLKINVX1 U95 ( .A(n43), .Y(res_addr[5]) );
  AOI222XL U96 ( .A0(res_addr_init[5]), .A1(n66), .B0(res_addr_bp[5]), .B1(n65), .C0(res_addr_fp[5]), .C1(n30), .Y(n43) );
  CLKINVX1 U97 ( .A(n42), .Y(res_addr[6]) );
  AOI222XL U98 ( .A0(res_addr_init[6]), .A1(n66), .B0(res_addr_bp[6]), .B1(n65), .C0(res_addr_fp[6]), .C1(n30), .Y(n42) );
  CLKINVX1 U99 ( .A(n41), .Y(res_addr[7]) );
  AOI222XL U100 ( .A0(res_addr_init[7]), .A1(n66), .B0(res_addr_bp[7]), .B1(
        n65), .C0(res_addr_fp[7]), .C1(n64), .Y(n41) );
  CLKINVX1 U101 ( .A(n40), .Y(res_addr[8]) );
  AOI222XL U102 ( .A0(res_addr_init[8]), .A1(n67), .B0(res_addr_bp[8]), .B1(
        n65), .C0(res_addr_fp[8]), .C1(n64), .Y(n40) );
  CLKINVX1 U103 ( .A(n39), .Y(res_addr[9]) );
  AOI222XL U104 ( .A0(res_addr_init[9]), .A1(n27), .B0(res_addr_bp[9]), .B1(
        n65), .C0(res_addr_fp[9]), .C1(n64), .Y(n39) );
  CLKINVX1 U105 ( .A(n51), .Y(res_addr[10]) );
  AOI222XL U106 ( .A0(res_addr_init[10]), .A1(n27), .B0(res_addr_bp[10]), .B1(
        n65), .C0(res_addr_fp[10]), .C1(n64), .Y(n51) );
  CLKINVX1 U107 ( .A(n50), .Y(res_addr[11]) );
  AOI222XL U108 ( .A0(res_addr_init[11]), .A1(n67), .B0(res_addr_bp[11]), .B1(
        n65), .C0(res_addr_fp[11]), .C1(n64), .Y(n50) );
  CLKINVX1 U109 ( .A(n49), .Y(res_addr[12]) );
  AOI222XL U110 ( .A0(res_addr_init[12]), .A1(n67), .B0(res_addr_bp[12]), .B1(
        n65), .C0(res_addr_fp[12]), .C1(n64), .Y(n49) );
  CLKINVX1 U111 ( .A(n48), .Y(res_addr[13]) );
  AOI222XL U112 ( .A0(res_addr_init[13]), .A1(n27), .B0(res_addr_bp[13]), .B1(
        n65), .C0(res_addr_fp[13]), .C1(n64), .Y(n48) );
  CLKINVX1 U113 ( .A(n28), .Y(res_wr) );
  AOI222XL U114 ( .A0(res_wr_init), .A1(n66), .B0(res_wr_bp), .B1(n65), .C0(
        res_wr_fp), .C1(n64), .Y(n28) );
  AO22X1 U115 ( .A0(res_rd_fp), .A1(n64), .B0(res_rd_bp), .B1(n29), .Y(res_rd)
         );
  AO22X1 U116 ( .A0(res_do_bp[1]), .A1(n65), .B0(res_do_fp[1]), .B1(n30), .Y(
        res_do[1]) );
  AO22X1 U117 ( .A0(res_do_bp[2]), .A1(n65), .B0(res_do_fp[2]), .B1(n64), .Y(
        res_do[2]) );
  AO22X1 U118 ( .A0(res_do_bp[3]), .A1(n65), .B0(res_do_fp[3]), .B1(n64), .Y(
        res_do[3]) );
  AO22X1 U119 ( .A0(res_do_bp[4]), .A1(n65), .B0(res_do_fp[4]), .B1(n64), .Y(
        res_do[4]) );
  AO22X1 U120 ( .A0(res_do_bp[5]), .A1(n65), .B0(res_do_fp[5]), .B1(n64), .Y(
        res_do[5]) );
  AO22X1 U121 ( .A0(res_do_bp[6]), .A1(n65), .B0(res_do_fp[6]), .B1(n64), .Y(
        res_do[6]) );
  AO22X1 U122 ( .A0(res_do_bp[7]), .A1(n65), .B0(res_do_fp[7]), .B1(n64), .Y(
        res_do[7]) );
  AND2X2 U123 ( .A(sti_addr_init[0]), .B(n66), .Y(sti_addr[0]) );
  AND2X2 U124 ( .A(sti_addr_init[2]), .B(n66), .Y(sti_addr[2]) );
  AND2X2 U125 ( .A(sti_addr_init[1]), .B(n66), .Y(sti_addr[1]) );
  AND2X2 U126 ( .A(sti_addr_init[8]), .B(n66), .Y(sti_addr[8]) );
  AND2X2 U127 ( .A(sti_addr_init[9]), .B(n66), .Y(sti_addr[9]) );
  AND2X2 U128 ( .A(sti_addr_init[3]), .B(n66), .Y(sti_addr[3]) );
  AND2X2 U129 ( .A(sti_addr_init[4]), .B(n66), .Y(sti_addr[4]) );
  AND2X2 U130 ( .A(sti_addr_init[5]), .B(n66), .Y(sti_addr[5]) );
  AND2X2 U131 ( .A(sti_addr_init[6]), .B(n66), .Y(sti_addr[6]) );
  AND2X2 U132 ( .A(sti_addr_init[7]), .B(n66), .Y(sti_addr[7]) );
  AND2X2 U133 ( .A(sti_rd_init), .B(n66), .Y(sti_rd) );
endmodule

