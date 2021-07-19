/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Mon Jul 19 22:18:24 2021
/////////////////////////////////////////////////////////////


module initialize_DW01_inc_0_DW01_inc_6 ( A, SUM );
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


module initialize_DW01_inc_1_DW01_inc_7 ( A, SUM );
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
  wire   N27, N28, N29, N30, N62, N63, N64, N65, N67, N95, N96, N97, N98, N99,
         N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, N143, N144, N145,
         N146, N158, N159, N160, N161, N162, N163, N164, N165, N166, N167,
         N168, N169, N170, N171, N188, N189, N190, N191, N192, N193, N194,
         N195, N196, N197, n7, n8, n9, n13, n14, n15, n16, n17, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n1, n2, n3, n4, n5, n6, n10, n11, n12, n18,
         n19, n20, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91;
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
        .QN(n8) );
  initialize_DW01_inc_0_DW01_inc_6 add_238 ( .A(sti_addr), .SUM({N197, N196, 
        N195, N194, N193, N192, N191, N190, N189, N188}) );
  initialize_DW01_inc_1_DW01_inc_7 r382 ( .A(res_addr), .SUM({N171, N170, N169, 
        N168, N167, N166, N165, N164, N163, N162, N161, N160, N159, N158}) );
  EDFFX1 \buff_reg[0]  ( .D(N118), .E(n2), .CK(clk), .Q(buff[0]) );
  EDFFX1 \buff_reg[12]  ( .D(N106), .E(n2), .CK(clk), .Q(buff[12]) );
  EDFFX1 \buff_reg[8]  ( .D(N110), .E(n2), .CK(clk), .Q(buff[8]) );
  EDFFX1 \buff_reg[4]  ( .D(N114), .E(n2), .CK(clk), .Q(buff[4]) );
  EDFFX1 \buff_reg[13]  ( .D(N105), .E(n2), .CK(clk), .Q(buff[13]) );
  EDFFX1 \buff_reg[9]  ( .D(N109), .E(n2), .CK(clk), .Q(buff[9]) );
  EDFFX1 \buff_reg[5]  ( .D(N113), .E(n2), .CK(clk), .Q(buff[5]) );
  EDFFX1 \buff_reg[1]  ( .D(N117), .E(n2), .CK(clk), .Q(buff[1]) );
  EDFFX1 \buff_reg[14]  ( .D(N104), .E(n2), .CK(clk), .Q(buff[14]) );
  EDFFX1 \buff_reg[10]  ( .D(N108), .E(n2), .CK(clk), .Q(buff[10]) );
  EDFFX1 \buff_reg[6]  ( .D(N112), .E(n2), .CK(clk), .Q(buff[6]) );
  EDFFX1 \buff_reg[2]  ( .D(N116), .E(n2), .CK(clk), .Q(buff[2]) );
  EDFFX1 \buff_reg[15]  ( .D(N103), .E(n2), .CK(clk), .Q(buff[15]) );
  EDFFX1 \buff_reg[11]  ( .D(N107), .E(n2), .CK(clk), .Q(buff[11]) );
  EDFFX1 \buff_reg[7]  ( .D(N111), .E(n2), .CK(clk), .Q(buff[7]) );
  EDFFX1 \buff_reg[3]  ( .D(N115), .E(n2), .CK(clk), .Q(buff[3]) );
  TLATX1 res_wr_state_reg ( .G(N97), .D(n1), .Q(res_wr) );
  TLATX1 \res_do_state_reg[0]  ( .G(N100), .D(N101), .Q(res_do[0]) );
  TLATX1 sti_rd_state_reg ( .G(N95), .D(N96), .Q(sti_rd) );
  TLATX1 initialize_done_state_reg ( .G(N99), .D(n70), .Q(initialize_done) );
  DFFQX1 \buf_state_reg[3]  ( .D(N146), .CK(clk), .Q(N30) );
  DFFQX1 \res_addr_state_reg[13]  ( .D(n46), .CK(clk), .Q(res_addr[13]) );
  DFFQX1 \buf_state_reg[2]  ( .D(N145), .CK(clk), .Q(N29) );
  DFFQX1 \res_addr_state_reg[12]  ( .D(n47), .CK(clk), .Q(res_addr[12]) );
  DFFQX1 \buf_state_reg[1]  ( .D(N144), .CK(clk), .Q(N28) );
  DFFQX1 \sti_addr_state_reg[9]  ( .D(n68), .CK(clk), .Q(sti_addr[9]) );
  DFFQX1 \res_addr_state_reg[11]  ( .D(n48), .CK(clk), .Q(res_addr[11]) );
  DFFX1 \sti_addr_state_reg[7]  ( .D(n66), .CK(clk), .Q(sti_addr[7]), .QN(n13)
         );
  DFFQX1 \res_addr_state_reg[10]  ( .D(n49), .CK(clk), .Q(res_addr[10]) );
  DFFX1 \sti_addr_state_reg[6]  ( .D(n65), .CK(clk), .Q(sti_addr[6]), .QN(n14)
         );
  DFFQX1 \res_addr_state_reg[9]  ( .D(n50), .CK(clk), .Q(res_addr[9]) );
  DFFX1 \sti_addr_state_reg[5]  ( .D(n64), .CK(clk), .Q(sti_addr[5]), .QN(n15)
         );
  DFFQX1 \res_addr_state_reg[8]  ( .D(n51), .CK(clk), .Q(res_addr[8]) );
  DFFX1 \sti_addr_state_reg[4]  ( .D(n63), .CK(clk), .Q(sti_addr[4]), .QN(n16)
         );
  DFFQX1 \res_addr_state_reg[7]  ( .D(n52), .CK(clk), .Q(res_addr[7]) );
  DFFX1 \sti_addr_state_reg[3]  ( .D(n62), .CK(clk), .Q(sti_addr[3]), .QN(n17)
         );
  DFFQX1 \res_addr_state_reg[6]  ( .D(n53), .CK(clk), .Q(res_addr[6]) );
  DFFRX2 \state_reg[0]  ( .D(nstate[0]), .CK(clk), .RN(rstn), .Q(state[0]), 
        .QN(n9) );
  DFFQX1 \res_addr_state_reg[5]  ( .D(n54), .CK(clk), .Q(res_addr[5]) );
  DFFQX1 \res_addr_state_reg[4]  ( .D(n55), .CK(clk), .Q(res_addr[4]) );
  DFFQX1 \res_addr_state_reg[3]  ( .D(n56), .CK(clk), .Q(res_addr[3]) );
  DFFQX1 \res_addr_state_reg[2]  ( .D(n57), .CK(clk), .Q(res_addr[2]) );
  DFFQX1 \res_addr_state_reg[1]  ( .D(n58), .CK(clk), .Q(res_addr[1]) );
  DFFQX1 \res_addr_state_reg[0]  ( .D(n59), .CK(clk), .Q(res_addr[0]) );
  TLATX1 \nstate_reg[1]  ( .G(N62), .D(N64), .Q(nstate[1]) );
  TLATX1 \nstate_reg[0]  ( .G(N62), .D(N63), .Q(nstate[0]) );
  TLATX1 \nstate_reg[2]  ( .G(N62), .D(N65), .Q(nstate[2]) );
  DFFQX1 \buf_state_reg[0]  ( .D(N143), .CK(clk), .Q(N27) );
  DFFQX1 \sti_addr_state_reg[8]  ( .D(n67), .CK(clk), .Q(sti_addr[8]) );
  DFFQX1 \sti_addr_state_reg[2]  ( .D(n61), .CK(clk), .Q(sti_addr[2]) );
  DFFQX1 \sti_addr_state_reg[1]  ( .D(n60), .CK(clk), .Q(sti_addr[1]) );
  DFFQX1 \sti_addr_state_reg[0]  ( .D(n69), .CK(clk), .Q(sti_addr[0]) );
  DFFRX1 \state_reg[2]  ( .D(nstate[2]), .CK(clk), .RN(rstn), .Q(state[2]), 
        .QN(n7) );
  NAND2X1 U10 ( .A(n84), .B(n34), .Y(N100) );
  INVX3 U11 ( .A(N100), .Y(n82) );
  NAND3BX1 U12 ( .AN(N99), .B(n86), .C(n87), .Y(N95) );
  CLKINVX1 U13 ( .A(n1), .Y(n84) );
  NAND2X2 U14 ( .A(n34), .B(n85), .Y(n21) );
  CLKINVX1 U15 ( .A(n3), .Y(n85) );
  CLKBUFX3 U16 ( .A(n23), .Y(n4) );
  NAND2X1 U17 ( .A(n81), .B(n3), .Y(n23) );
  CLKINVX1 U18 ( .A(n35), .Y(n81) );
  NAND2X1 U19 ( .A(n34), .B(n83), .Y(N99) );
  CLKINVX1 U20 ( .A(n2), .Y(n87) );
  CLKINVX1 U21 ( .A(n70), .Y(n83) );
  CLKINVX1 U22 ( .A(N96), .Y(n86) );
  AO22X1 U23 ( .A0(res_addr[13]), .A1(n82), .B0(N171), .B1(n1), .Y(n46) );
  AO22X1 U24 ( .A0(res_addr[12]), .A1(n82), .B0(N170), .B1(n1), .Y(n47) );
  AO22X1 U25 ( .A0(res_addr[11]), .A1(n82), .B0(N169), .B1(n1), .Y(n48) );
  OAI211X1 U26 ( .A0(n88), .A1(n21), .B0(n32), .C0(n4), .Y(n68) );
  CLKINVX1 U27 ( .A(sti_addr[9]), .Y(n88) );
  NAND2X1 U28 ( .A(N197), .B(n3), .Y(n32) );
  AO22X1 U29 ( .A0(res_addr[10]), .A1(n82), .B0(N168), .B1(n1), .Y(n49) );
  CLKBUFX3 U30 ( .A(N98), .Y(n1) );
  OAI31XL U31 ( .A0(n7), .A1(state[1]), .A2(state[0]), .B0(n36), .Y(N98) );
  AO22X1 U32 ( .A0(res_addr[0]), .A1(n82), .B0(N158), .B1(n1), .Y(n59) );
  AO22X1 U33 ( .A0(res_addr[9]), .A1(n82), .B0(N167), .B1(n1), .Y(n50) );
  AO22X1 U34 ( .A0(res_addr[8]), .A1(n82), .B0(N166), .B1(n1), .Y(n51) );
  AO22X1 U35 ( .A0(res_addr[7]), .A1(n82), .B0(N165), .B1(n1), .Y(n52) );
  AO22X1 U36 ( .A0(res_addr[6]), .A1(n82), .B0(N164), .B1(n1), .Y(n53) );
  AO22X1 U37 ( .A0(res_addr[5]), .A1(n82), .B0(N163), .B1(n1), .Y(n54) );
  AO22X1 U38 ( .A0(res_addr[4]), .A1(n82), .B0(N162), .B1(n1), .Y(n55) );
  AO22X1 U39 ( .A0(res_addr[3]), .A1(n82), .B0(N161), .B1(n1), .Y(n56) );
  AO22X1 U40 ( .A0(res_addr[2]), .A1(n82), .B0(N160), .B1(n1), .Y(n57) );
  AO22X1 U41 ( .A0(res_addr[1]), .A1(n82), .B0(N159), .B1(n1), .Y(n58) );
  NAND3X1 U42 ( .A(state[0]), .B(n7), .C(state[1]), .Y(n36) );
  NAND2X1 U43 ( .A(n2), .B(n8), .Y(n34) );
  OAI211X1 U44 ( .A0(n91), .A1(n21), .B0(n31), .C0(n4), .Y(n67) );
  CLKINVX1 U45 ( .A(sti_addr[8]), .Y(n91) );
  NAND2X1 U46 ( .A(N196), .B(n3), .Y(n31) );
  OAI211X1 U47 ( .A0(n13), .A1(n21), .B0(n30), .C0(n4), .Y(n66) );
  NAND2X1 U48 ( .A(N195), .B(n3), .Y(n30) );
  OAI211X1 U49 ( .A0(n14), .A1(n21), .B0(n29), .C0(n4), .Y(n65) );
  NAND2X1 U50 ( .A(N194), .B(n3), .Y(n29) );
  OAI211X1 U51 ( .A0(n15), .A1(n21), .B0(n28), .C0(n4), .Y(n64) );
  NAND2X1 U52 ( .A(N193), .B(n3), .Y(n28) );
  OAI211X1 U53 ( .A0(n16), .A1(n21), .B0(n27), .C0(n4), .Y(n63) );
  NAND2X1 U54 ( .A(N192), .B(n3), .Y(n27) );
  OAI211X1 U55 ( .A0(n17), .A1(n21), .B0(n26), .C0(n4), .Y(n62) );
  NAND2X1 U56 ( .A(N191), .B(n3), .Y(n26) );
  OAI211X1 U57 ( .A0(n90), .A1(n21), .B0(n25), .C0(n4), .Y(n61) );
  CLKINVX1 U58 ( .A(sti_addr[2]), .Y(n90) );
  NAND2X1 U59 ( .A(N190), .B(n3), .Y(n25) );
  OAI211X1 U60 ( .A0(n89), .A1(n21), .B0(n22), .C0(n4), .Y(n60) );
  CLKINVX1 U61 ( .A(sti_addr[1]), .Y(n89) );
  NAND2X1 U62 ( .A(N189), .B(n3), .Y(n22) );
  OAI211X1 U63 ( .A0(n80), .A1(n21), .B0(n33), .C0(n4), .Y(n69) );
  CLKINVX1 U64 ( .A(sti_addr[0]), .Y(n80) );
  NAND2X1 U65 ( .A(N188), .B(n3), .Y(n33) );
  CLKBUFX3 U66 ( .A(N102), .Y(n2) );
  NOR2X1 U67 ( .A(state[0]), .B(state[2]), .Y(N102) );
  CLKBUFX3 U68 ( .A(n24), .Y(n3) );
  NOR3X1 U69 ( .A(n7), .B(state[1]), .C(n9), .Y(n24) );
  AOI21X1 U70 ( .A0(n43), .A1(n38), .B0(n84), .Y(N145) );
  XOR2X1 U71 ( .A(n44), .B(N29), .Y(n43) );
  AOI21X1 U72 ( .A0(n45), .A1(n38), .B0(n84), .Y(N144) );
  XNOR2X1 U73 ( .A(N28), .B(N27), .Y(n45) );
  AOI21X1 U74 ( .A0(N27), .A1(n38), .B0(n84), .Y(N143) );
  NOR2BX1 U75 ( .AN(sti_di[14]), .B(n8), .Y(N117) );
  NOR2BX1 U76 ( .AN(sti_di[13]), .B(n8), .Y(N116) );
  NOR2BX1 U77 ( .AN(sti_di[12]), .B(n8), .Y(N115) );
  NOR2BX1 U78 ( .AN(sti_di[11]), .B(n8), .Y(N114) );
  NOR2BX1 U79 ( .AN(sti_di[10]), .B(n8), .Y(N113) );
  NOR2BX1 U80 ( .AN(sti_di[9]), .B(n8), .Y(N112) );
  NOR2BX1 U81 ( .AN(sti_di[8]), .B(n8), .Y(N111) );
  NOR2BX1 U82 ( .AN(sti_di[7]), .B(n8), .Y(N110) );
  NOR2BX1 U83 ( .AN(sti_di[6]), .B(n8), .Y(N109) );
  NOR2BX1 U84 ( .AN(sti_di[5]), .B(n8), .Y(N108) );
  NOR2BX1 U85 ( .AN(sti_di[4]), .B(n8), .Y(N107) );
  NOR2BX1 U86 ( .AN(sti_di[3]), .B(n8), .Y(N106) );
  NOR2BXL U87 ( .AN(sti_di[2]), .B(n8), .Y(N105) );
  NOR2BXL U88 ( .AN(sti_di[1]), .B(n8), .Y(N104) );
  NOR2BXL U89 ( .AN(sti_di[0]), .B(n8), .Y(N103) );
  NOR2BXL U90 ( .AN(sti_di[15]), .B(n8), .Y(N118) );
  OA21XL U91 ( .A0(n42), .A1(N30), .B0(n1), .Y(N146) );
  NAND4X1 U92 ( .A(sti_addr[9]), .B(sti_addr[8]), .C(n39), .D(n40), .Y(n35) );
  NOR3X1 U93 ( .A(n13), .B(n15), .C(n14), .Y(n39) );
  NOR3X1 U94 ( .A(n41), .B(n17), .C(n16), .Y(n40) );
  NAND3X1 U95 ( .A(sti_addr[1]), .B(sti_addr[0]), .C(sti_addr[2]), .Y(n41) );
  NAND2X1 U96 ( .A(N30), .B(n42), .Y(n38) );
  NOR2BX1 U97 ( .AN(N29), .B(n44), .Y(n42) );
  NAND2X1 U98 ( .A(N28), .B(N27), .Y(n44) );
  OAI221XL U99 ( .A0(n85), .A1(n35), .B0(state[0]), .B1(n8), .C0(n86), .Y(N64)
         );
  OAI221XL U100 ( .A0(n85), .A1(n35), .B0(state[0]), .B1(n7), .C0(n36), .Y(N65) );
  OAI211X1 U101 ( .A0(n81), .A1(n85), .B0(n37), .C0(n87), .Y(N63) );
  NAND3BXL U102 ( .AN(n38), .B(n9), .C(n8), .Y(n37) );
  NOR3X1 U103 ( .A(n7), .B(state[0]), .C(n8), .Y(n70) );
  NOR3X1 U104 ( .A(state[1]), .B(state[2]), .C(n9), .Y(N96) );
  NAND3X1 U105 ( .A(state[2]), .B(n85), .C(state[0]), .Y(N62) );
  NAND4X1 U106 ( .A(state[1]), .B(n83), .C(n82), .D(n87), .Y(N97) );
  CLKINVX1 U107 ( .A(N27), .Y(n79) );
  CLKINVX1 U108 ( .A(N28), .Y(n78) );
  CLKINVX1 U109 ( .A(N29), .Y(n77) );
  AND2X2 U110 ( .A(N67), .B(n1), .Y(N101) );
  NOR2X1 U111 ( .A(n78), .B(N27), .Y(n72) );
  NOR2X1 U112 ( .A(n78), .B(n79), .Y(n71) );
  NOR2X1 U113 ( .A(n79), .B(N28), .Y(n19) );
  NOR2X1 U114 ( .A(N27), .B(N28), .Y(n18) );
  AO22X1 U115 ( .A0(buff[5]), .A1(n19), .B0(buff[4]), .B1(n18), .Y(n5) );
  AOI221XL U116 ( .A0(buff[6]), .A1(n72), .B0(buff[7]), .B1(n71), .C0(n5), .Y(
        n11) );
  AO22X1 U117 ( .A0(buff[1]), .A1(n19), .B0(buff[0]), .B1(n18), .Y(n6) );
  AOI221XL U118 ( .A0(buff[2]), .A1(n72), .B0(buff[3]), .B1(n71), .C0(n6), .Y(
        n10) );
  OA22X1 U119 ( .A0(n77), .A1(n11), .B0(N29), .B1(n10), .Y(n76) );
  AO22X1 U120 ( .A0(buff[13]), .A1(n19), .B0(buff[12]), .B1(n18), .Y(n12) );
  AOI221XL U121 ( .A0(buff[14]), .A1(n72), .B0(buff[15]), .B1(n71), .C0(n12), 
        .Y(n74) );
  AO22X1 U122 ( .A0(buff[9]), .A1(n19), .B0(buff[8]), .B1(n18), .Y(n20) );
  AOI221XL U123 ( .A0(buff[10]), .A1(n72), .B0(buff[11]), .B1(n71), .C0(n20), 
        .Y(n73) );
  OAI22XL U124 ( .A0(n74), .A1(n77), .B0(N29), .B1(n73), .Y(n75) );
  OAI2BB2XL U125 ( .B0(n76), .B1(N30), .A0N(N30), .A1N(n75), .Y(N67) );
endmodule


module forward_pass_DW01_inc_0_DW01_inc_4 ( A, SUM );
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


module forward_pass_DW01_inc_1_DW01_inc_5 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
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
  wire   n160, n161, n162, N126, N127, N128, N129, N130, N131, N132, N133,
         N134, N135, N136, N137, N138, N139, N140, N141, N142, N143, N144,
         N145, N146, N147, N148, N149, N150, N151, N152, N153, N168, N178,
         N180, N181, N182, N183, N184, N185, N186, N187, N188, N189, N190,
         N191, N232, N233, N234, N235, N236, N237, N238, N239, N240, N241,
         N242, N243, N244, N357, N358, N359, N360, N361, N362, N363, N364,
         N375, N376, N379, N380, N381, N382, N383, N384, N385, N386, N387,
         N388, n123, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         \add_326/carry[2] , \add_326/carry[3] , \add_326/carry[4] ,
         \add_326/carry[5] , \add_326/carry[6] , \add_326/carry[7] ,
         \add_326/carry[8] , \add_326/carry[9] , \add_326/carry[10] ,
         \add_326/carry[11] , \add_326/carry[12] , \add_326/carry[13] ,
         \add_313/carry[13] , \add_313/carry[12] , \add_313/carry[11] ,
         \add_313/carry[10] , \add_313/carry[9] , \add_313/carry[8] ,
         \add_313/carry[7] , \add_313/carry[6] , \add_313/carry[5] ,
         \add_313/carry[4] , \add_313/carry[3] , \sub_302/carry[2] ,
         \sub_302/carry[3] , \sub_302/carry[4] , \sub_302/carry[5] ,
         \sub_302/carry[6] , \sub_302/carry[7] , \sub_302/carry[8] ,
         \sub_302/carry[9] , \sub_302/carry[10] , \sub_302/carry[11] ,
         \sub_302/carry[12] , \sub_302/carry[13] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n124, n155, n156, n157, n158, n159;
  wire   [3:0] state;
  wire   [3:0] nstate;
  wire   [7:0] input_data;
  wire   [7:0] data;
  assign res_addr[0] = N178;

  forward_pass_DW01_inc_0_DW01_inc_4 add_370 ( .A(data), .SUM({N364, N363, 
        N362, N361, N360, N359, N358, N357}) );
  forward_pass_DW01_inc_1_DW01_inc_5 r402 ( .A({res_addr[13:1], N178}), .SUM({
        N153, N152, N151, N150, N149, N148, N147, N146, N145, N144, N143, N142, 
        N141, N140}) );
  TLATX1 res_rd_state_reg ( .G(N375), .D(N376), .Q(res_rd) );
  TLATXL \res_do_state_reg[0]  ( .G(N380), .D(N381), .Q(res_do[0]) );
  TLATNX1 res_wr_state_reg ( .D(n13), .GN(n123), .Q(res_wr) );
  TLATXL \res_do_state_reg[7]  ( .G(N380), .D(N388), .Q(res_do[7]) );
  TLATXL \res_do_state_reg[6]  ( .G(N380), .D(N387), .Q(res_do[6]) );
  TLATXL \res_do_state_reg[5]  ( .G(N380), .D(N386), .Q(res_do[5]) );
  TLATXL \res_do_state_reg[4]  ( .G(N380), .D(N385), .Q(res_do[4]) );
  TLATXL \res_do_state_reg[3]  ( .G(N380), .D(N384), .Q(res_do[3]) );
  TLATXL \res_do_state_reg[2]  ( .G(N380), .D(N383), .Q(res_do[2]) );
  TLATXL \res_do_state_reg[1]  ( .G(N380), .D(N382), .Q(res_do[1]) );
  TLATX1 fp_done_state_reg ( .G(N379), .D(n158), .Q(fp_done) );
  DFFQX1 \data_reg[7]  ( .D(n125), .CK(clk), .Q(data[7]) );
  DFFQX1 \data_reg[6]  ( .D(n126), .CK(clk), .Q(data[6]) );
  DFFQX1 \data_reg[0]  ( .D(n132), .CK(clk), .Q(data[0]) );
  DFFQX1 \data_reg[3]  ( .D(n129), .CK(clk), .Q(data[3]) );
  DFFQX1 \data_reg[5]  ( .D(n127), .CK(clk), .Q(data[5]) );
  DFFQX1 \data_reg[1]  ( .D(n131), .CK(clk), .Q(data[1]) );
  DFFQX2 \res_addr_state_reg[10]  ( .D(n136), .CK(clk), .Q(res_addr[10]) );
  DFFQX1 \data_reg[2]  ( .D(n130), .CK(clk), .Q(data[2]) );
  DFFQX1 \data_reg[4]  ( .D(n128), .CK(clk), .Q(data[4]) );
  DFFQX2 \res_addr_state_reg[11]  ( .D(n135), .CK(clk), .Q(res_addr[11]) );
  DFFQX2 \res_addr_state_reg[12]  ( .D(n134), .CK(clk), .Q(res_addr[12]) );
  DFFQX2 \res_addr_state_reg[9]  ( .D(n137), .CK(clk), .Q(res_addr[9]) );
  DFFQX2 \res_addr_state_reg[13]  ( .D(n133), .CK(clk), .Q(res_addr[13]) );
  DFFQX2 \res_addr_state_reg[8]  ( .D(n138), .CK(clk), .Q(res_addr[8]) );
  DFFQX2 \res_addr_state_reg[7]  ( .D(n139), .CK(clk), .Q(res_addr[7]) );
  DFFQX2 \res_addr_state_reg[5]  ( .D(n141), .CK(clk), .Q(res_addr[5]) );
  DFFQX2 \res_addr_state_reg[4]  ( .D(n142), .CK(clk), .Q(res_addr[4]) );
  DFFQX2 \res_addr_state_reg[6]  ( .D(n140), .CK(clk), .Q(res_addr[6]) );
  DFFX1 \res_addr_state_reg[3]  ( .D(n143), .CK(clk), .Q(n160) );
  DFFX1 \res_addr_state_reg[2]  ( .D(n144), .CK(clk), .Q(n161) );
  DFFX1 \res_addr_state_reg[1]  ( .D(n145), .CK(clk), .Q(n162), .QN(n6) );
  DFFQX1 \input_data_reg[3]  ( .D(n149), .CK(clk), .Q(input_data[3]) );
  DFFQX1 \input_data_reg[7]  ( .D(n153), .CK(clk), .Q(input_data[7]) );
  DFFQX1 \input_data_reg[2]  ( .D(n148), .CK(clk), .Q(input_data[2]) );
  DFFQX1 \input_data_reg[1]  ( .D(n147), .CK(clk), .Q(input_data[1]) );
  DFFQX1 \input_data_reg[6]  ( .D(n152), .CK(clk), .Q(input_data[6]) );
  DFFQX1 \input_data_reg[0]  ( .D(n154), .CK(clk), .Q(input_data[0]) );
  DFFQX1 \input_data_reg[5]  ( .D(n151), .CK(clk), .Q(input_data[5]) );
  DFFQX1 \input_data_reg[4]  ( .D(n150), .CK(clk), .Q(input_data[4]) );
  DFFRX1 \state_reg[2]  ( .D(nstate[2]), .CK(clk), .RN(rstn), .Q(state[2]), 
        .QN(n4) );
  DFFRX2 \state_reg[3]  ( .D(nstate[3]), .CK(clk), .RN(rstn), .Q(state[3]), 
        .QN(n5) );
  DFFRX1 \state_reg[0]  ( .D(nstate[0]), .CK(clk), .RN(rstn), .Q(state[0]), 
        .QN(n3) );
  DFFQX2 \res_addr_state_reg[0]  ( .D(n146), .CK(clk), .Q(N178) );
  DFFRX1 \state_reg[1]  ( .D(nstate[1]), .CK(clk), .RN(rstn), .Q(state[1]), 
        .QN(n2) );
  NOR3X1 U3 ( .A(n1), .B(n13), .C(n158), .Y(n56) );
  OAI22XL U4 ( .A0(n101), .A1(n94), .B0(n102), .B1(n103), .Y(n1) );
  NAND4X2 U5 ( .A(n116), .B(n117), .C(n118), .D(n101), .Y(nstate[0]) );
  NAND2X2 U6 ( .A(n7), .B(n53), .Y(n38) );
  NOR4X1 U7 ( .A(nstate[0]), .B(nstate[1]), .C(nstate[2]), .D(nstate[3]), .Y(
        n62) );
  OAI21X2 U8 ( .A0(state[3]), .A1(n114), .B0(n115), .Y(nstate[2]) );
  OAI21X2 U9 ( .A0(N168), .A1(n112), .B0(n100), .Y(n111) );
  OAI31X1 U10 ( .A0(n3), .A1(state[3]), .A2(state[1]), .B0(n116), .Y(nstate[1]) );
  AO21X2 U11 ( .A0(n5), .A1(n155), .B0(n13), .Y(N380) );
  OAI21X2 U12 ( .A0(N168), .A1(n113), .B0(n100), .Y(n110) );
  INVXL U13 ( .A(n56), .Y(nstate[3]) );
  INVX1 U14 ( .A(nstate[2]), .Y(n55) );
  AOI21XL U15 ( .A0(nstate[0]), .A1(nstate[2]), .B0(n12), .Y(n112) );
  INVX1 U16 ( .A(nstate[1]), .Y(n54) );
  NAND3XL U17 ( .A(n57), .B(n54), .C(nstate[2]), .Y(n98) );
  INVX1 U18 ( .A(nstate[0]), .Y(n57) );
  NAND4XL U19 ( .A(nstate[0]), .B(n54), .C(n55), .D(n56), .Y(n53) );
  CLKBUFX3 U20 ( .A(n64), .Y(n10) );
  NOR4X1 U21 ( .A(n100), .B(n62), .C(n11), .D(n93), .Y(n64) );
  CLKBUFX3 U22 ( .A(n63), .Y(n12) );
  NOR3XL U23 ( .A(n55), .B(nstate[0]), .C(n54), .Y(n63) );
  CLKBUFX3 U24 ( .A(n36), .Y(n7) );
  NAND3XL U25 ( .A(n57), .B(n55), .C(nstate[1]), .Y(n36) );
  CLKBUFX3 U26 ( .A(n65), .Y(n11) );
  NOR3XL U27 ( .A(n54), .B(nstate[2]), .C(n57), .Y(n65) );
  CLKBUFX3 U28 ( .A(n60), .Y(n9) );
  OAI211X1 U29 ( .A0(n55), .A1(n57), .B0(n97), .C0(n98), .Y(n60) );
  AND3X2 U30 ( .A(n95), .B(n93), .C(n94), .Y(n61) );
  CLKBUFX3 U31 ( .A(n68), .Y(n8) );
  NOR2BX1 U32 ( .AN(n93), .B(n94), .Y(n68) );
  CLKBUFX3 U33 ( .A(n162), .Y(res_addr[1]) );
  CLKBUFX3 U34 ( .A(n161), .Y(res_addr[2]) );
  CLKBUFX3 U35 ( .A(n160), .Y(res_addr[3]) );
  CLKBUFX3 U36 ( .A(n159), .Y(n13) );
  NOR4X1 U37 ( .A(n4), .B(n2), .C(n3), .D(state[3]), .Y(n159) );
  CLKINVX1 U38 ( .A(data[7]), .Y(n35) );
  CLKINVX1 U39 ( .A(data[1]), .Y(n32) );
  CLKINVX1 U40 ( .A(data[5]), .Y(n34) );
  CLKINVX1 U41 ( .A(data[3]), .Y(n33) );
  CLKINVX1 U42 ( .A(N178), .Y(N126) );
  CLKINVX1 U43 ( .A(res_di[6]), .Y(n31) );
  XOR2X1 U44 ( .A(res_addr[13]), .B(\add_326/carry[13] ), .Y(N244) );
  AND2X1 U45 ( .A(\add_326/carry[12] ), .B(res_addr[12]), .Y(
        \add_326/carry[13] ) );
  XOR2X1 U46 ( .A(res_addr[12]), .B(\add_326/carry[12] ), .Y(N243) );
  AND2X1 U47 ( .A(\add_326/carry[11] ), .B(res_addr[11]), .Y(
        \add_326/carry[12] ) );
  XOR2X1 U48 ( .A(res_addr[11]), .B(\add_326/carry[11] ), .Y(N242) );
  AND2X1 U49 ( .A(\add_326/carry[10] ), .B(res_addr[10]), .Y(
        \add_326/carry[11] ) );
  XOR2X1 U50 ( .A(res_addr[10]), .B(\add_326/carry[10] ), .Y(N241) );
  AND2X1 U51 ( .A(\add_326/carry[9] ), .B(res_addr[9]), .Y(\add_326/carry[10] ) );
  XOR2X1 U52 ( .A(res_addr[9]), .B(\add_326/carry[9] ), .Y(N240) );
  AND2X1 U53 ( .A(\add_326/carry[8] ), .B(res_addr[8]), .Y(\add_326/carry[9] )
         );
  XOR2X1 U54 ( .A(res_addr[8]), .B(\add_326/carry[8] ), .Y(N239) );
  XNOR2X1 U55 ( .A(res_addr[13]), .B(\sub_302/carry[13] ), .Y(N139) );
  OR2X1 U56 ( .A(res_addr[12]), .B(\sub_302/carry[12] ), .Y(
        \sub_302/carry[13] ) );
  XNOR2X1 U57 ( .A(\sub_302/carry[12] ), .B(res_addr[12]), .Y(N138) );
  OR2X1 U58 ( .A(res_addr[11]), .B(\sub_302/carry[11] ), .Y(
        \sub_302/carry[12] ) );
  XNOR2X1 U59 ( .A(\sub_302/carry[11] ), .B(res_addr[11]), .Y(N137) );
  OR2X1 U60 ( .A(res_addr[10]), .B(\sub_302/carry[10] ), .Y(
        \sub_302/carry[11] ) );
  XNOR2X1 U61 ( .A(\sub_302/carry[10] ), .B(res_addr[10]), .Y(N136) );
  OR2X1 U62 ( .A(res_addr[9]), .B(\sub_302/carry[9] ), .Y(\sub_302/carry[10] )
         );
  XNOR2X1 U63 ( .A(\sub_302/carry[9] ), .B(res_addr[9]), .Y(N135) );
  OR2X1 U64 ( .A(res_addr[8]), .B(\sub_302/carry[8] ), .Y(\sub_302/carry[9] )
         );
  XNOR2X1 U65 ( .A(\sub_302/carry[8] ), .B(res_addr[8]), .Y(N134) );
  XOR2X1 U66 ( .A(res_addr[13]), .B(\add_313/carry[13] ), .Y(N191) );
  AND2X1 U67 ( .A(\add_313/carry[12] ), .B(res_addr[12]), .Y(
        \add_313/carry[13] ) );
  XOR2X1 U68 ( .A(res_addr[12]), .B(\add_313/carry[12] ), .Y(N190) );
  AND2X1 U69 ( .A(\add_313/carry[11] ), .B(res_addr[11]), .Y(
        \add_313/carry[12] ) );
  XOR2X1 U70 ( .A(res_addr[11]), .B(\add_313/carry[11] ), .Y(N189) );
  AND2X1 U71 ( .A(\add_313/carry[10] ), .B(res_addr[10]), .Y(
        \add_313/carry[11] ) );
  XOR2X1 U72 ( .A(res_addr[10]), .B(\add_313/carry[10] ), .Y(N188) );
  AND2X1 U73 ( .A(\add_313/carry[9] ), .B(res_addr[9]), .Y(\add_313/carry[10] ) );
  XOR2X1 U74 ( .A(res_addr[9]), .B(\add_313/carry[9] ), .Y(N187) );
  AND2X1 U75 ( .A(\add_313/carry[8] ), .B(res_addr[8]), .Y(\add_313/carry[9] )
         );
  XOR2X1 U76 ( .A(res_addr[8]), .B(\add_313/carry[8] ), .Y(N186) );
  AND2X1 U77 ( .A(\add_326/carry[7] ), .B(res_addr[7]), .Y(\add_326/carry[8] )
         );
  XOR2X1 U78 ( .A(res_addr[7]), .B(\add_326/carry[7] ), .Y(N238) );
  AND2X1 U79 ( .A(\add_326/carry[6] ), .B(res_addr[6]), .Y(\add_326/carry[7] )
         );
  XOR2X1 U80 ( .A(res_addr[6]), .B(\add_326/carry[6] ), .Y(N237) );
  AND2X1 U81 ( .A(\add_326/carry[5] ), .B(res_addr[5]), .Y(\add_326/carry[6] )
         );
  XOR2X1 U82 ( .A(res_addr[5]), .B(\add_326/carry[5] ), .Y(N236) );
  AND2X1 U83 ( .A(\add_326/carry[4] ), .B(res_addr[4]), .Y(\add_326/carry[5] )
         );
  XOR2X1 U84 ( .A(res_addr[4]), .B(\add_326/carry[4] ), .Y(N235) );
  AND2X1 U85 ( .A(\add_326/carry[3] ), .B(res_addr[3]), .Y(\add_326/carry[4] )
         );
  XOR2X1 U86 ( .A(res_addr[3]), .B(\add_326/carry[3] ), .Y(N234) );
  AND2X1 U87 ( .A(\add_326/carry[2] ), .B(res_addr[2]), .Y(\add_326/carry[3] )
         );
  XOR2X1 U88 ( .A(res_addr[2]), .B(\add_326/carry[2] ), .Y(N233) );
  OR2X1 U89 ( .A(res_addr[1]), .B(N178), .Y(\add_326/carry[2] ) );
  XNOR2X1 U90 ( .A(N178), .B(res_addr[1]), .Y(N232) );
  AND2X1 U91 ( .A(\sub_302/carry[7] ), .B(res_addr[7]), .Y(\sub_302/carry[8] )
         );
  XOR2X1 U92 ( .A(res_addr[7]), .B(\sub_302/carry[7] ), .Y(N133) );
  OR2X1 U93 ( .A(res_addr[6]), .B(\sub_302/carry[6] ), .Y(\sub_302/carry[7] )
         );
  XNOR2X1 U94 ( .A(\sub_302/carry[6] ), .B(res_addr[6]), .Y(N132) );
  OR2X1 U95 ( .A(res_addr[5]), .B(\sub_302/carry[5] ), .Y(\sub_302/carry[6] )
         );
  XNOR2X1 U96 ( .A(\sub_302/carry[5] ), .B(res_addr[5]), .Y(N131) );
  OR2X1 U97 ( .A(res_addr[4]), .B(\sub_302/carry[4] ), .Y(\sub_302/carry[5] )
         );
  XNOR2X1 U98 ( .A(\sub_302/carry[4] ), .B(res_addr[4]), .Y(N130) );
  OR2X1 U99 ( .A(res_addr[3]), .B(\sub_302/carry[3] ), .Y(\sub_302/carry[4] )
         );
  XNOR2X1 U100 ( .A(\sub_302/carry[3] ), .B(res_addr[3]), .Y(N129) );
  OR2X1 U101 ( .A(res_addr[2]), .B(\sub_302/carry[2] ), .Y(\sub_302/carry[3] )
         );
  XNOR2X1 U102 ( .A(\sub_302/carry[2] ), .B(res_addr[2]), .Y(N128) );
  OR2X1 U103 ( .A(res_addr[1]), .B(N178), .Y(\sub_302/carry[2] ) );
  XNOR2X1 U104 ( .A(N178), .B(res_addr[1]), .Y(N127) );
  AND2X1 U105 ( .A(\add_313/carry[7] ), .B(res_addr[7]), .Y(\add_313/carry[8] ) );
  XOR2X1 U106 ( .A(res_addr[7]), .B(\add_313/carry[7] ), .Y(N185) );
  OR2X1 U107 ( .A(res_addr[6]), .B(\add_313/carry[6] ), .Y(\add_313/carry[7] )
         );
  XNOR2X1 U108 ( .A(\add_313/carry[6] ), .B(res_addr[6]), .Y(N184) );
  OR2X1 U109 ( .A(res_addr[5]), .B(\add_313/carry[5] ), .Y(\add_313/carry[6] )
         );
  XNOR2X1 U110 ( .A(\add_313/carry[5] ), .B(res_addr[5]), .Y(N183) );
  OR2X1 U111 ( .A(res_addr[4]), .B(\add_313/carry[4] ), .Y(\add_313/carry[5] )
         );
  XNOR2X1 U112 ( .A(\add_313/carry[4] ), .B(res_addr[4]), .Y(N182) );
  OR2X1 U113 ( .A(res_addr[3]), .B(\add_313/carry[3] ), .Y(\add_313/carry[4] )
         );
  XNOR2X1 U114 ( .A(\add_313/carry[3] ), .B(res_addr[3]), .Y(N181) );
  OR2X1 U115 ( .A(res_addr[2]), .B(res_addr[1]), .Y(\add_313/carry[3] ) );
  XNOR2X1 U116 ( .A(res_addr[1]), .B(res_addr[2]), .Y(N180) );
  NAND2BX1 U117 ( .AN(res_di[4]), .B(data[4]), .Y(n17) );
  OAI222XL U118 ( .A0(res_di[5]), .A1(n34), .B0(res_di[5]), .B1(n17), .C0(n34), 
        .C1(n17), .Y(n18) );
  OAI222XL U119 ( .A0(data[6]), .A1(n18), .B0(n31), .B1(n18), .C0(data[6]), 
        .C1(n31), .Y(n29) );
  NAND2BX1 U120 ( .AN(res_di[2]), .B(data[2]), .Y(n21) );
  OAI22XL U121 ( .A0(res_di[3]), .A1(n33), .B0(res_di[3]), .B1(n21), .Y(n27)
         );
  NOR2BX1 U122 ( .AN(res_di[2]), .B(data[2]), .Y(n19) );
  OA22X1 U123 ( .A0(n19), .A1(res_di[3]), .B0(n19), .B1(n33), .Y(n23) );
  AOI21X1 U124 ( .A0(res_di[1]), .A1(n32), .B0(res_di[0]), .Y(n20) );
  AOI2BB2X1 U125 ( .B0(n20), .B1(data[0]), .A0N(res_di[1]), .A1N(n32), .Y(n22)
         );
  OAI22XL U126 ( .A0(n23), .A1(n22), .B0(n21), .B1(n33), .Y(n26) );
  NOR2BX1 U127 ( .AN(res_di[4]), .B(data[4]), .Y(n24) );
  OAI22XL U128 ( .A0(n24), .A1(n34), .B0(res_di[5]), .B1(n24), .Y(n25) );
  OAI221XL U129 ( .A0(data[6]), .A1(n31), .B0(n27), .B1(n26), .C0(n25), .Y(n28) );
  AO22X1 U130 ( .A0(n35), .A1(res_di[7]), .B0(n29), .B1(n28), .Y(n30) );
  OAI21XL U131 ( .A0(res_di[7]), .A1(n35), .B0(n30), .Y(N168) );
  OAI22XL U132 ( .A0(n7), .A1(n37), .B0(n38), .B1(n39), .Y(n154) );
  CLKINVX1 U133 ( .A(input_data[0]), .Y(n39) );
  OAI22XL U134 ( .A0(n7), .A1(n40), .B0(n38), .B1(n41), .Y(n153) );
  CLKINVX1 U135 ( .A(input_data[7]), .Y(n41) );
  OAI22XL U136 ( .A0(n7), .A1(n31), .B0(n38), .B1(n42), .Y(n152) );
  CLKINVX1 U137 ( .A(input_data[6]), .Y(n42) );
  OAI22XL U138 ( .A0(n7), .A1(n43), .B0(n38), .B1(n44), .Y(n151) );
  CLKINVX1 U139 ( .A(input_data[5]), .Y(n44) );
  OAI22XL U140 ( .A0(n7), .A1(n45), .B0(n38), .B1(n46), .Y(n150) );
  CLKINVX1 U141 ( .A(input_data[4]), .Y(n46) );
  OAI22XL U142 ( .A0(n7), .A1(n47), .B0(n38), .B1(n48), .Y(n149) );
  CLKINVX1 U143 ( .A(input_data[3]), .Y(n48) );
  OAI22XL U144 ( .A0(n7), .A1(n49), .B0(n38), .B1(n50), .Y(n148) );
  CLKINVX1 U145 ( .A(input_data[2]), .Y(n50) );
  OAI22XL U146 ( .A0(n7), .A1(n51), .B0(n38), .B1(n52), .Y(n147) );
  CLKINVX1 U147 ( .A(input_data[1]), .Y(n52) );
  NAND2X1 U148 ( .A(n58), .B(n59), .Y(n146) );
  AOI221XL U149 ( .A0(N140), .A1(n9), .B0(N126), .B1(n61), .C0(n62), .Y(n59)
         );
  AOI222XL U150 ( .A0(N178), .A1(n12), .B0(n10), .B1(N178), .C0(N126), .C1(n11), .Y(n58) );
  NAND2X1 U151 ( .A(n66), .B(n67), .Y(n145) );
  AOI221XL U152 ( .A0(N141), .A1(n9), .B0(N232), .B1(n61), .C0(n8), .Y(n67) );
  AOI222XL U153 ( .A0(n6), .A1(n12), .B0(n10), .B1(res_addr[1]), .C0(N127), 
        .C1(n11), .Y(n66) );
  NAND2X1 U154 ( .A(n69), .B(n70), .Y(n144) );
  AOI221XL U155 ( .A0(N142), .A1(n9), .B0(N233), .B1(n61), .C0(n8), .Y(n70) );
  AOI222XL U156 ( .A0(N180), .A1(n12), .B0(n10), .B1(res_addr[2]), .C0(N128), 
        .C1(n11), .Y(n69) );
  NAND2X1 U157 ( .A(n71), .B(n72), .Y(n143) );
  AOI221XL U158 ( .A0(N143), .A1(n9), .B0(N234), .B1(n61), .C0(n8), .Y(n72) );
  AOI222XL U159 ( .A0(N181), .A1(n12), .B0(n10), .B1(res_addr[3]), .C0(N129), 
        .C1(n11), .Y(n71) );
  NAND2X1 U160 ( .A(n73), .B(n74), .Y(n142) );
  AOI221XL U161 ( .A0(N144), .A1(n9), .B0(N235), .B1(n61), .C0(n8), .Y(n74) );
  AOI222XL U162 ( .A0(N182), .A1(n12), .B0(n10), .B1(res_addr[4]), .C0(N130), 
        .C1(n11), .Y(n73) );
  NAND2X1 U163 ( .A(n75), .B(n76), .Y(n141) );
  AOI221XL U164 ( .A0(N145), .A1(n9), .B0(N236), .B1(n61), .C0(n8), .Y(n76) );
  AOI222XL U165 ( .A0(N183), .A1(n12), .B0(n10), .B1(res_addr[5]), .C0(N131), 
        .C1(n11), .Y(n75) );
  NAND2X1 U166 ( .A(n77), .B(n78), .Y(n140) );
  AOI221XL U167 ( .A0(N146), .A1(n9), .B0(N237), .B1(n61), .C0(n8), .Y(n78) );
  AOI222XL U168 ( .A0(N184), .A1(n12), .B0(n10), .B1(res_addr[6]), .C0(N132), 
        .C1(n11), .Y(n77) );
  NAND2X1 U169 ( .A(n79), .B(n80), .Y(n139) );
  AOI221XL U170 ( .A0(N147), .A1(n9), .B0(N238), .B1(n61), .C0(n62), .Y(n80)
         );
  AOI222XL U171 ( .A0(N185), .A1(n12), .B0(res_addr[7]), .B1(n10), .C0(N133), 
        .C1(n11), .Y(n79) );
  NAND2X1 U172 ( .A(n81), .B(n82), .Y(n138) );
  AOI221XL U173 ( .A0(N148), .A1(n9), .B0(N239), .B1(n61), .C0(n8), .Y(n82) );
  AOI222XL U174 ( .A0(N186), .A1(n12), .B0(n10), .B1(res_addr[8]), .C0(N134), 
        .C1(n11), .Y(n81) );
  NAND2X1 U175 ( .A(n83), .B(n84), .Y(n137) );
  AOI221XL U176 ( .A0(N149), .A1(n9), .B0(N240), .B1(n61), .C0(n8), .Y(n84) );
  AOI222XL U177 ( .A0(N187), .A1(n12), .B0(n10), .B1(res_addr[9]), .C0(N135), 
        .C1(n11), .Y(n83) );
  NAND2X1 U178 ( .A(n85), .B(n86), .Y(n136) );
  AOI221XL U179 ( .A0(N150), .A1(n9), .B0(N241), .B1(n61), .C0(n8), .Y(n86) );
  AOI222XL U180 ( .A0(N188), .A1(n12), .B0(n10), .B1(res_addr[10]), .C0(N136), 
        .C1(n11), .Y(n85) );
  NAND2X1 U181 ( .A(n87), .B(n88), .Y(n135) );
  AOI221XL U182 ( .A0(N151), .A1(n9), .B0(N242), .B1(n61), .C0(n8), .Y(n88) );
  AOI222XL U183 ( .A0(N189), .A1(n12), .B0(n10), .B1(res_addr[11]), .C0(N137), 
        .C1(n11), .Y(n87) );
  NAND2X1 U184 ( .A(n89), .B(n90), .Y(n134) );
  AOI221XL U185 ( .A0(N152), .A1(n9), .B0(N243), .B1(n61), .C0(n8), .Y(n90) );
  AOI222XL U186 ( .A0(N190), .A1(n12), .B0(n10), .B1(res_addr[12]), .C0(N138), 
        .C1(n11), .Y(n89) );
  NAND2X1 U187 ( .A(n91), .B(n92), .Y(n133) );
  AOI221XL U188 ( .A0(N153), .A1(n9), .B0(N244), .B1(n61), .C0(n8), .Y(n92) );
  CLKINVX1 U189 ( .A(n96), .Y(n95) );
  NAND3X1 U190 ( .A(n96), .B(n94), .C(n93), .Y(n97) );
  NAND4BX1 U191 ( .AN(n99), .B(res_addr[5]), .C(res_addr[4]), .D(res_addr[6]), 
        .Y(n96) );
  NAND4BX1 U192 ( .AN(N178), .B(res_addr[1]), .C(res_addr[2]), .D(res_addr[3]), 
        .Y(n99) );
  AOI222XL U193 ( .A0(N191), .A1(n12), .B0(n10), .B1(res_addr[13]), .C0(N139), 
        .C1(n11), .Y(n91) );
  NOR2X1 U194 ( .A(n56), .B(nstate[0]), .Y(n93) );
  NAND4X1 U195 ( .A(res_addr[10]), .B(n104), .C(n105), .D(n106), .Y(n94) );
  AND3X1 U196 ( .A(res_addr[9]), .B(res_addr[13]), .C(res_addr[8]), .Y(n106)
         );
  AND2X1 U197 ( .A(res_addr[11]), .B(res_addr[12]), .Y(n105) );
  OAI21XL U198 ( .A0(n107), .A1(n108), .B0(n109), .Y(n104) );
  CLKINVX1 U199 ( .A(res_addr[7]), .Y(n109) );
  NAND3X1 U200 ( .A(res_addr[5]), .B(res_addr[4]), .C(res_addr[6]), .Y(n108)
         );
  NAND4X1 U201 ( .A(res_addr[3]), .B(res_addr[2]), .C(res_addr[1]), .D(N178), 
        .Y(n107) );
  OAI2BB2XL U202 ( .B0(n37), .B1(n110), .A0N(data[0]), .A1N(n111), .Y(n132) );
  CLKINVX1 U203 ( .A(res_di[0]), .Y(n37) );
  OAI2BB2XL U204 ( .B0(n51), .B1(n110), .A0N(data[1]), .A1N(n111), .Y(n131) );
  CLKINVX1 U205 ( .A(res_di[1]), .Y(n51) );
  OAI2BB2XL U206 ( .B0(n49), .B1(n110), .A0N(data[2]), .A1N(n111), .Y(n130) );
  CLKINVX1 U207 ( .A(res_di[2]), .Y(n49) );
  OAI2BB2XL U208 ( .B0(n47), .B1(n110), .A0N(data[3]), .A1N(n111), .Y(n129) );
  CLKINVX1 U209 ( .A(res_di[3]), .Y(n47) );
  OAI2BB2XL U210 ( .B0(n45), .B1(n110), .A0N(data[4]), .A1N(n111), .Y(n128) );
  CLKINVX1 U211 ( .A(res_di[4]), .Y(n45) );
  OAI2BB2XL U212 ( .B0(n43), .B1(n110), .A0N(data[5]), .A1N(n111), .Y(n127) );
  CLKINVX1 U213 ( .A(res_di[5]), .Y(n43) );
  OAI2BB2XL U214 ( .B0(n31), .B1(n110), .A0N(data[6]), .A1N(n111), .Y(n126) );
  OAI2BB2XL U215 ( .B0(n40), .B1(n110), .A0N(data[7]), .A1N(n111), .Y(n125) );
  NAND2X1 U216 ( .A(n112), .B(n98), .Y(n100) );
  CLKINVX1 U217 ( .A(n98), .Y(n113) );
  NAND3X1 U218 ( .A(n3), .B(n5), .C(state[2]), .Y(n118) );
  NAND2X1 U219 ( .A(initialize_done), .B(n119), .Y(n117) );
  OA21XL U220 ( .A0(n120), .A1(n103), .B0(n115), .Y(n116) );
  NAND2X1 U221 ( .A(n121), .B(state[2]), .Y(n115) );
  NAND2X1 U222 ( .A(n121), .B(n4), .Y(n103) );
  NOR3X1 U223 ( .A(state[0]), .B(state[3]), .C(n2), .Y(n121) );
  CLKINVX1 U224 ( .A(n102), .Y(n120) );
  NAND2X1 U225 ( .A(n122), .B(n124), .Y(n102) );
  NOR4X1 U226 ( .A(input_data[7]), .B(input_data[6]), .C(input_data[5]), .D(
        input_data[4]), .Y(n124) );
  NOR4X1 U227 ( .A(input_data[3]), .B(input_data[2]), .C(input_data[1]), .D(
        input_data[0]), .Y(n122) );
  CLKINVX1 U228 ( .A(res_di[7]), .Y(n40) );
  AND2X1 U229 ( .A(N364), .B(n13), .Y(N388) );
  AND2X1 U230 ( .A(N363), .B(n13), .Y(N387) );
  AND2X1 U231 ( .A(N362), .B(n13), .Y(N386) );
  AND2X1 U232 ( .A(N361), .B(n13), .Y(N385) );
  AND2X1 U233 ( .A(N360), .B(n13), .Y(N384) );
  AND2X1 U234 ( .A(N359), .B(n13), .Y(N383) );
  AND2X1 U235 ( .A(N358), .B(n13), .Y(N382) );
  AND2X1 U236 ( .A(N357), .B(n13), .Y(N381) );
  AOI21X1 U237 ( .A0(n156), .A1(n114), .B0(state[3]), .Y(N376) );
  MXI2X1 U238 ( .A(n157), .B(n2), .S0(state[2]), .Y(n114) );
  NOR2X1 U239 ( .A(n3), .B(n2), .Y(n157) );
  MXI2X1 U240 ( .A(state[2]), .B(n155), .S0(state[0]), .Y(n156) );
  NAND2X1 U241 ( .A(n123), .B(state[3]), .Y(N375) );
  NOR3X1 U242 ( .A(n13), .B(N379), .C(n119), .Y(n123) );
  AO21X1 U243 ( .A0(n5), .A1(n119), .B0(n158), .Y(N379) );
  NOR2X1 U244 ( .A(n3), .B(n101), .Y(n158) );
  NAND2X1 U245 ( .A(state[3]), .B(n155), .Y(n101) );
  NOR2BX1 U246 ( .AN(n155), .B(state[0]), .Y(n119) );
  NOR2X1 U247 ( .A(state[2]), .B(state[1]), .Y(n155) );
endmodule


module backward_pass_DW01_inc_0_DW01_inc_1 ( A, SUM );
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


module backward_pass_DW01_inc_1_DW01_inc_2 ( A, SUM );
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
  CLKINVX1 U3 ( .A(A[10]), .Y(n4) );
  CLKINVX1 U4 ( .A(A[11]), .Y(n3) );
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


module backward_pass_DW01_inc_2_DW01_inc_3 ( A, SUM );
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
  wire   n198, n199, N122, N123, N124, N125, N126, N127, N128, N129, N130,
         N131, N132, N133, N134, N135, N136, N138, N139, N140, N141, N142,
         N143, N144, N145, N146, N147, N148, N149, N164, N198, N199, N200,
         N201, N202, N203, N204, N205, N206, N207, N208, N209, N210, N211,
         N228, N229, N230, N231, N232, N233, N234, N235, N236, N237, N238,
         N239, N240, N241, N242, N243, N244, N245, N246, N247, N248, N249,
         N250, N251, N252, N253, N254, N353, N354, N355, N356, N357, N358,
         N359, N360, N361, N362, N364, N365, N366, N367, N368, N369, N370,
         N371, N390, N391, N394, N395, N396, N397, N398, N399, N400, N401,
         N402, N403, n148, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         \sub_474/carry[2] , \sub_474/carry[3] , \sub_474/carry[4] ,
         \sub_474/carry[5] , \sub_474/carry[6] , \sub_474/carry[7] ,
         \sub_474/carry[8] , \sub_474/carry[9] , \sub_474/carry[10] ,
         \sub_474/carry[11] , \sub_474/carry[12] , \sub_474/carry[13] ,
         \sub_465/carry[2] , \sub_465/carry[3] , \sub_465/carry[4] ,
         \sub_465/carry[5] , \sub_465/carry[6] , \sub_465/carry[7] ,
         \sub_465/carry[8] , \sub_465/carry[9] , \sub_465/carry[10] ,
         \sub_465/carry[11] , \sub_465/carry[12] , \sub_465/carry[13] ,
         \add_453/carry[13] , \add_453/carry[12] , \add_453/carry[11] ,
         \add_453/carry[10] , \add_453/carry[9] , \add_453/carry[8] ,
         \add_453/carry[7] , \add_453/carry[6] , \add_453/carry[5] ,
         \add_453/carry[4] , \add_453/carry[3] , n1, n2, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n149, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197;
  wire   [3:0] state;
  wire   [3:0] nstate;
  wire   [7:0] input_data;
  wire   [7:0] data;
  assign res_addr[0] = N136;

  backward_pass_DW01_inc_0_DW01_inc_1 add_513_2 ( .A(data), .SUM({N371, N370, 
        N369, N368, N367, N366, N365, N364}) );
  backward_pass_DW01_inc_1_DW01_inc_2 add_513 ( .A({1'b0, data}), .SUM({N361, 
        N360, N359, N358, N357, N356, N355, N354, N353}) );
  backward_pass_DW01_dec_0 sub_476 ( .A({res_addr[13:1], N136}), .SUM({N254, 
        N253, N252, N251, N250, N249, N248, N247, N246, N245, N244, N243, N242, 
        N241}) );
  backward_pass_DW01_inc_2_DW01_inc_3 r406 ( .A({res_addr[13:1], N136}), .SUM(
        {N135, N134, N133, N132, N131, N130, N129, N128, N127, N126, N125, 
        N124, N123, N122}) );
  TLATX1 bp_done_state_reg ( .G(N394), .D(n196), .Q(bp_done) );
  TLATX1 res_rd_state_reg ( .G(N390), .D(N391), .Q(res_rd) );
  TLATNXL res_wr_state_reg ( .D(n197), .GN(n148), .Q(res_wr) );
  TLATXL \res_do_state_reg[0]  ( .G(N395), .D(N396), .Q(res_do[0]) );
  TLATXL \res_do_state_reg[7]  ( .G(N395), .D(N403), .Q(res_do[7]) );
  TLATXL \res_do_state_reg[6]  ( .G(N395), .D(N402), .Q(res_do[6]) );
  TLATXL \res_do_state_reg[5]  ( .G(N395), .D(N401), .Q(res_do[5]) );
  TLATXL \res_do_state_reg[4]  ( .G(N395), .D(N400), .Q(res_do[4]) );
  TLATXL \res_do_state_reg[3]  ( .G(N395), .D(N399), .Q(res_do[3]) );
  TLATXL \res_do_state_reg[2]  ( .G(N395), .D(N398), .Q(res_do[2]) );
  TLATXL \res_do_state_reg[1]  ( .G(N395), .D(N397), .Q(res_do[1]) );
  DFFQX1 \data_reg[7]  ( .D(n171), .CK(clk), .Q(data[7]) );
  DFFQX2 \res_addr_state_reg[11]  ( .D(n152), .CK(clk), .Q(res_addr[11]) );
  DFFQX2 \res_addr_state_reg[10]  ( .D(n153), .CK(clk), .Q(res_addr[10]) );
  DFFQX2 \res_addr_state_reg[13]  ( .D(n150), .CK(clk), .Q(res_addr[13]) );
  DFFX1 \res_addr_state_reg[2]  ( .D(n161), .CK(clk), .Q(n198) );
  DFFQX4 \res_addr_state_reg[0]  ( .D(n163), .CK(clk), .Q(N136) );
  DFFX1 \res_addr_state_reg[1]  ( .D(n162), .CK(clk), .Q(n199), .QN(n6) );
  DFFQX1 \input_data_reg[7]  ( .D(n164), .CK(clk), .Q(input_data[7]) );
  DFFQX1 \input_data_reg[3]  ( .D(n168), .CK(clk), .Q(input_data[3]) );
  DFFQX1 \input_data_reg[6]  ( .D(n165), .CK(clk), .Q(input_data[6]) );
  DFFQX1 \input_data_reg[2]  ( .D(n169), .CK(clk), .Q(input_data[2]) );
  DFFQX1 \input_data_reg[5]  ( .D(n166), .CK(clk), .Q(input_data[5]) );
  DFFQX1 \input_data_reg[0]  ( .D(n179), .CK(clk), .Q(input_data[0]) );
  DFFQX1 \input_data_reg[4]  ( .D(n167), .CK(clk), .Q(input_data[4]) );
  DFFQX1 \input_data_reg[1]  ( .D(n170), .CK(clk), .Q(input_data[1]) );
  DFFRX2 \state_reg[3]  ( .D(nstate[3]), .CK(clk), .RN(rstn), .Q(state[3]), 
        .QN(n5) );
  DFFRX1 \state_reg[2]  ( .D(nstate[2]), .CK(clk), .RN(rstn), .Q(state[2]), 
        .QN(n4) );
  DFFRX1 \state_reg[1]  ( .D(nstate[1]), .CK(clk), .RN(rstn), .Q(state[1]), 
        .QN(n1) );
  DFFRX1 \state_reg[0]  ( .D(nstate[0]), .CK(clk), .RN(rstn), .Q(state[0]), 
        .QN(n2) );
  DFFQX2 \res_addr_state_reg[9]  ( .D(n154), .CK(clk), .Q(res_addr[9]) );
  DFFQX2 \res_addr_state_reg[8]  ( .D(n155), .CK(clk), .Q(res_addr[8]) );
  DFFQX2 \res_addr_state_reg[12]  ( .D(n151), .CK(clk), .Q(res_addr[12]) );
  DFFQX2 \res_addr_state_reg[7]  ( .D(n156), .CK(clk), .Q(res_addr[7]) );
  DFFQX1 \data_reg[6]  ( .D(n172), .CK(clk), .Q(data[6]) );
  DFFQX2 \res_addr_state_reg[5]  ( .D(n158), .CK(clk), .Q(res_addr[5]) );
  DFFQX2 \res_addr_state_reg[6]  ( .D(n157), .CK(clk), .Q(res_addr[6]) );
  DFFQX2 \res_addr_state_reg[4]  ( .D(n159), .CK(clk), .Q(res_addr[4]) );
  DFFQX1 \data_reg[0]  ( .D(n178), .CK(clk), .Q(data[0]) );
  DFFQX1 \data_reg[3]  ( .D(n175), .CK(clk), .Q(data[3]) );
  DFFQX1 \data_reg[5]  ( .D(n173), .CK(clk), .Q(data[5]) );
  DFFQX1 \data_reg[1]  ( .D(n177), .CK(clk), .Q(data[1]) );
  DFFQX2 \res_addr_state_reg[3]  ( .D(n160), .CK(clk), .Q(res_addr[3]) );
  DFFQX1 \data_reg[2]  ( .D(n176), .CK(clk), .Q(data[2]) );
  DFFQX1 \data_reg[4]  ( .D(n174), .CK(clk), .Q(data[4]) );
  NOR2X2 U3 ( .A(n180), .B(N362), .Y(n191) );
  OAI31X1 U4 ( .A0(n79), .A1(N361), .A2(N360), .B0(n54), .Y(N362) );
  NOR2BX2 U5 ( .AN(N362), .B(n180), .Y(n190) );
  OAI21X1 U6 ( .A0(state[3]), .A1(n138), .B0(n139), .Y(nstate[2]) );
  NAND2X2 U7 ( .A(n12), .B(n7), .Y(n57) );
  OAI21X2 U8 ( .A0(N164), .A1(n9), .B0(n69), .Y(n59) );
  OAI21X4 U9 ( .A0(state[3]), .A1(n192), .B0(n180), .Y(N395) );
  INVX1 U11 ( .A(nstate[2]), .Y(n82) );
  NAND3XL U12 ( .A(nstate[2]), .B(n81), .C(nstate[1]), .Y(n133) );
  NAND3XL U13 ( .A(nstate[2]), .B(n135), .C(nstate[0]), .Y(n134) );
  INVX1 U14 ( .A(n197), .Y(n180) );
  CLKBUFX3 U15 ( .A(n87), .Y(n8) );
  NOR3X1 U16 ( .A(n135), .B(n82), .C(n81), .Y(n87) );
  AND4X2 U17 ( .A(n72), .B(n132), .C(n12), .D(n91), .Y(n86) );
  CLKBUFX3 U18 ( .A(n89), .Y(n11) );
  NAND3X1 U19 ( .A(n134), .B(n133), .C(n132), .Y(n89) );
  CLKBUFX3 U20 ( .A(n80), .Y(n12) );
  CLKINVX1 U21 ( .A(n68), .Y(n80) );
  CLKBUFX3 U22 ( .A(n71), .Y(n9) );
  NOR3X1 U23 ( .A(nstate[0]), .B(nstate[1]), .C(n82), .Y(n71) );
  CLKBUFX3 U24 ( .A(n55), .Y(n7) );
  NAND3X1 U25 ( .A(n81), .B(n82), .C(nstate[1]), .Y(n55) );
  CLKBUFX3 U26 ( .A(n90), .Y(n10) );
  NOR3BXL U27 ( .AN(n136), .B(n137), .C(n91), .Y(n90) );
  CLKBUFX3 U28 ( .A(n88), .Y(n13) );
  NOR3X1 U29 ( .A(n136), .B(n137), .C(n91), .Y(n88) );
  CLKINVX1 U30 ( .A(n40), .Y(n53) );
  CLKINVX1 U31 ( .A(N359), .Y(n52) );
  CLKINVX1 U32 ( .A(N357), .Y(n51) );
  CLKBUFX3 U33 ( .A(n199), .Y(res_addr[1]) );
  CLKBUFX3 U34 ( .A(n198), .Y(res_addr[2]) );
  CLKINVX1 U35 ( .A(data[7]), .Y(n34) );
  CLKINVX1 U36 ( .A(data[1]), .Y(n31) );
  CLKINVX1 U37 ( .A(data[5]), .Y(n33) );
  CLKINVX1 U38 ( .A(data[3]), .Y(n32) );
  CLKINVX1 U39 ( .A(N136), .Y(N198) );
  CLKINVX1 U40 ( .A(n49), .Y(n54) );
  CLKINVX1 U41 ( .A(N354), .Y(n50) );
  CLKINVX1 U42 ( .A(res_di[6]), .Y(n30) );
  OAI22X2 U43 ( .A0(N164), .A1(n67), .B0(n68), .B1(n69), .Y(n60) );
  OAI31X4 U44 ( .A0(n2), .A1(state[3]), .A2(state[1]), .B0(n140), .Y(nstate[1]) );
  XNOR2X1 U45 ( .A(res_addr[13]), .B(\sub_465/carry[13] ), .Y(N211) );
  OR2X1 U46 ( .A(res_addr[12]), .B(\sub_465/carry[12] ), .Y(
        \sub_465/carry[13] ) );
  XNOR2X1 U47 ( .A(\sub_465/carry[12] ), .B(res_addr[12]), .Y(N210) );
  OR2X1 U48 ( .A(res_addr[11]), .B(\sub_465/carry[11] ), .Y(
        \sub_465/carry[12] ) );
  XNOR2X1 U49 ( .A(\sub_465/carry[11] ), .B(res_addr[11]), .Y(N209) );
  OR2X1 U50 ( .A(res_addr[10]), .B(\sub_465/carry[10] ), .Y(
        \sub_465/carry[11] ) );
  XNOR2X1 U51 ( .A(\sub_465/carry[10] ), .B(res_addr[10]), .Y(N208) );
  OR2X1 U52 ( .A(res_addr[9]), .B(\sub_465/carry[9] ), .Y(\sub_465/carry[10] )
         );
  XNOR2X1 U53 ( .A(\sub_465/carry[9] ), .B(res_addr[9]), .Y(N207) );
  OR2X1 U54 ( .A(res_addr[8]), .B(\sub_465/carry[8] ), .Y(\sub_465/carry[9] )
         );
  XNOR2X1 U55 ( .A(\sub_465/carry[8] ), .B(res_addr[8]), .Y(N206) );
  AND2X1 U56 ( .A(\sub_465/carry[7] ), .B(res_addr[7]), .Y(\sub_465/carry[8] )
         );
  XOR2X1 U57 ( .A(res_addr[7]), .B(\sub_465/carry[7] ), .Y(N205) );
  OR2X1 U58 ( .A(res_addr[6]), .B(\sub_465/carry[6] ), .Y(\sub_465/carry[7] )
         );
  XNOR2X1 U59 ( .A(\sub_465/carry[6] ), .B(res_addr[6]), .Y(N204) );
  OR2X1 U60 ( .A(res_addr[5]), .B(\sub_465/carry[5] ), .Y(\sub_465/carry[6] )
         );
  XNOR2X1 U61 ( .A(\sub_465/carry[5] ), .B(res_addr[5]), .Y(N203) );
  OR2X1 U62 ( .A(res_addr[4]), .B(\sub_465/carry[4] ), .Y(\sub_465/carry[5] )
         );
  XNOR2X1 U63 ( .A(\sub_465/carry[4] ), .B(res_addr[4]), .Y(N202) );
  OR2X1 U64 ( .A(res_addr[3]), .B(\sub_465/carry[3] ), .Y(\sub_465/carry[4] )
         );
  XNOR2X1 U65 ( .A(\sub_465/carry[3] ), .B(res_addr[3]), .Y(N201) );
  OR2X1 U66 ( .A(res_addr[2]), .B(\sub_465/carry[2] ), .Y(\sub_465/carry[3] )
         );
  XNOR2X1 U67 ( .A(\sub_465/carry[2] ), .B(res_addr[2]), .Y(N200) );
  XOR2X1 U68 ( .A(res_addr[13]), .B(\add_453/carry[13] ), .Y(N149) );
  AND2X1 U69 ( .A(\add_453/carry[12] ), .B(res_addr[12]), .Y(
        \add_453/carry[13] ) );
  XOR2X1 U70 ( .A(res_addr[12]), .B(\add_453/carry[12] ), .Y(N148) );
  AND2X1 U71 ( .A(\add_453/carry[11] ), .B(res_addr[11]), .Y(
        \add_453/carry[12] ) );
  XOR2X1 U72 ( .A(res_addr[11]), .B(\add_453/carry[11] ), .Y(N147) );
  AND2X1 U73 ( .A(\add_453/carry[10] ), .B(res_addr[10]), .Y(
        \add_453/carry[11] ) );
  XOR2X1 U74 ( .A(res_addr[10]), .B(\add_453/carry[10] ), .Y(N146) );
  AND2X1 U75 ( .A(\add_453/carry[9] ), .B(res_addr[9]), .Y(\add_453/carry[10] ) );
  XOR2X1 U76 ( .A(res_addr[9]), .B(\add_453/carry[9] ), .Y(N145) );
  AND2X1 U77 ( .A(\add_453/carry[8] ), .B(res_addr[8]), .Y(\add_453/carry[9] )
         );
  XOR2X1 U78 ( .A(res_addr[8]), .B(\add_453/carry[8] ), .Y(N144) );
  AND2X1 U79 ( .A(\add_453/carry[7] ), .B(res_addr[7]), .Y(\add_453/carry[8] )
         );
  XOR2X1 U80 ( .A(res_addr[7]), .B(\add_453/carry[7] ), .Y(N143) );
  OR2X1 U81 ( .A(res_addr[6]), .B(\add_453/carry[6] ), .Y(\add_453/carry[7] )
         );
  XNOR2X1 U82 ( .A(\add_453/carry[6] ), .B(res_addr[6]), .Y(N142) );
  OR2X1 U83 ( .A(res_addr[5]), .B(\add_453/carry[5] ), .Y(\add_453/carry[6] )
         );
  XNOR2X1 U84 ( .A(\add_453/carry[5] ), .B(res_addr[5]), .Y(N141) );
  OR2X1 U85 ( .A(res_addr[4]), .B(\add_453/carry[4] ), .Y(\add_453/carry[5] )
         );
  XNOR2X1 U86 ( .A(\add_453/carry[4] ), .B(res_addr[4]), .Y(N140) );
  OR2X1 U87 ( .A(res_addr[3]), .B(\add_453/carry[3] ), .Y(\add_453/carry[4] )
         );
  XNOR2X1 U88 ( .A(\add_453/carry[3] ), .B(res_addr[3]), .Y(N139) );
  OR2X1 U89 ( .A(res_addr[2]), .B(res_addr[1]), .Y(\add_453/carry[3] ) );
  XNOR2X1 U90 ( .A(res_addr[1]), .B(res_addr[2]), .Y(N138) );
  XNOR2X1 U91 ( .A(res_addr[13]), .B(\sub_474/carry[13] ), .Y(N240) );
  OR2X1 U92 ( .A(res_addr[12]), .B(\sub_474/carry[12] ), .Y(
        \sub_474/carry[13] ) );
  XNOR2X1 U93 ( .A(\sub_474/carry[12] ), .B(res_addr[12]), .Y(N239) );
  OR2X1 U94 ( .A(res_addr[11]), .B(\sub_474/carry[11] ), .Y(
        \sub_474/carry[12] ) );
  XNOR2X1 U95 ( .A(\sub_474/carry[11] ), .B(res_addr[11]), .Y(N238) );
  OR2X1 U96 ( .A(res_addr[10]), .B(\sub_474/carry[10] ), .Y(
        \sub_474/carry[11] ) );
  XNOR2X1 U97 ( .A(\sub_474/carry[10] ), .B(res_addr[10]), .Y(N237) );
  OR2X1 U98 ( .A(res_addr[9]), .B(\sub_474/carry[9] ), .Y(\sub_474/carry[10] )
         );
  XNOR2X1 U99 ( .A(\sub_474/carry[9] ), .B(res_addr[9]), .Y(N236) );
  OR2X1 U100 ( .A(res_addr[8]), .B(\sub_474/carry[8] ), .Y(\sub_474/carry[9] )
         );
  XNOR2X1 U101 ( .A(\sub_474/carry[8] ), .B(res_addr[8]), .Y(N235) );
  OR2X1 U102 ( .A(res_addr[7]), .B(\sub_474/carry[7] ), .Y(\sub_474/carry[8] )
         );
  XNOR2X1 U103 ( .A(\sub_474/carry[7] ), .B(res_addr[7]), .Y(N234) );
  OR2X1 U104 ( .A(res_addr[6]), .B(\sub_474/carry[6] ), .Y(\sub_474/carry[7] )
         );
  XNOR2X1 U105 ( .A(\sub_474/carry[6] ), .B(res_addr[6]), .Y(N233) );
  OR2X1 U106 ( .A(res_addr[5]), .B(\sub_474/carry[5] ), .Y(\sub_474/carry[6] )
         );
  XNOR2X1 U107 ( .A(\sub_474/carry[5] ), .B(res_addr[5]), .Y(N232) );
  OR2X1 U108 ( .A(res_addr[4]), .B(\sub_474/carry[4] ), .Y(\sub_474/carry[5] )
         );
  XNOR2X1 U109 ( .A(\sub_474/carry[4] ), .B(res_addr[4]), .Y(N231) );
  OR2X1 U110 ( .A(res_addr[3]), .B(\sub_474/carry[3] ), .Y(\sub_474/carry[4] )
         );
  XNOR2X1 U111 ( .A(\sub_474/carry[3] ), .B(res_addr[3]), .Y(N230) );
  OR2X1 U112 ( .A(res_addr[2]), .B(\sub_474/carry[2] ), .Y(\sub_474/carry[3] )
         );
  XNOR2X1 U113 ( .A(\sub_474/carry[2] ), .B(res_addr[2]), .Y(N229) );
  OR2X1 U114 ( .A(res_addr[1]), .B(N136), .Y(\sub_465/carry[2] ) );
  XNOR2X1 U115 ( .A(N136), .B(res_addr[1]), .Y(N199) );
  AND2X1 U116 ( .A(N136), .B(res_addr[1]), .Y(\sub_474/carry[2] ) );
  XOR2X1 U117 ( .A(res_addr[1]), .B(N136), .Y(N228) );
  NAND2BX1 U118 ( .AN(res_di[4]), .B(data[4]), .Y(n16) );
  OAI222XL U119 ( .A0(res_di[5]), .A1(n33), .B0(res_di[5]), .B1(n16), .C0(n33), 
        .C1(n16), .Y(n17) );
  OAI222XL U120 ( .A0(data[6]), .A1(n17), .B0(n30), .B1(n17), .C0(data[6]), 
        .C1(n30), .Y(n28) );
  NAND2BX1 U121 ( .AN(res_di[2]), .B(data[2]), .Y(n20) );
  OAI22XL U122 ( .A0(res_di[3]), .A1(n32), .B0(res_di[3]), .B1(n20), .Y(n26)
         );
  NOR2BX1 U123 ( .AN(res_di[2]), .B(data[2]), .Y(n18) );
  OA22X1 U124 ( .A0(n18), .A1(res_di[3]), .B0(n18), .B1(n32), .Y(n22) );
  AOI21X1 U125 ( .A0(res_di[1]), .A1(n31), .B0(res_di[0]), .Y(n19) );
  AOI2BB2X1 U126 ( .B0(n19), .B1(data[0]), .A0N(res_di[1]), .A1N(n31), .Y(n21)
         );
  OAI22XL U127 ( .A0(n22), .A1(n21), .B0(n20), .B1(n32), .Y(n25) );
  NOR2BX1 U128 ( .AN(res_di[4]), .B(data[4]), .Y(n23) );
  OAI22XL U129 ( .A0(n23), .A1(n33), .B0(res_di[5]), .B1(n23), .Y(n24) );
  OAI221XL U130 ( .A0(data[6]), .A1(n30), .B0(n26), .B1(n25), .C0(n24), .Y(n27) );
  AO22X1 U131 ( .A0(n34), .A1(res_di[7]), .B0(n28), .B1(n27), .Y(n29) );
  OAI21XL U132 ( .A0(res_di[7]), .A1(n34), .B0(n29), .Y(N164) );
  NOR2BX1 U133 ( .AN(input_data[2]), .B(N355), .Y(n40) );
  AOI2BB1X1 U134 ( .A0N(n50), .A1N(input_data[1]), .B0(N353), .Y(n35) );
  AO22X1 U135 ( .A0(n35), .A1(input_data[0]), .B0(input_data[1]), .B1(n50), 
        .Y(n39) );
  NOR2BX1 U136 ( .AN(N355), .B(input_data[2]), .Y(n36) );
  OAI22XL U137 ( .A0(n36), .A1(n75), .B0(N356), .B1(n36), .Y(n38) );
  OAI22XL U138 ( .A0(N356), .A1(n75), .B0(N356), .B1(n53), .Y(n37) );
  AOI221XL U139 ( .A0(input_data[3]), .A1(n40), .B0(n39), .B1(n38), .C0(n37), 
        .Y(n47) );
  NOR2X1 U140 ( .A(n51), .B(input_data[4]), .Y(n41) );
  OAI22XL U141 ( .A0(n41), .A1(n77), .B0(N358), .B1(n41), .Y(n42) );
  OAI21XL U142 ( .A0(input_data[6]), .A1(n52), .B0(n42), .Y(n46) );
  NAND2X1 U143 ( .A(input_data[4]), .B(n51), .Y(n43) );
  OAI222XL U144 ( .A0(N358), .A1(n77), .B0(N358), .B1(n43), .C0(n77), .C1(n43), 
        .Y(n44) );
  OAI222XL U145 ( .A0(input_data[6]), .A1(n44), .B0(n52), .B1(n44), .C0(
        input_data[6]), .C1(n52), .Y(n45) );
  OA21XL U146 ( .A0(n47), .A1(n46), .B0(n45), .Y(n48) );
  AOI211X1 U147 ( .A0(n79), .A1(N360), .B0(N361), .C0(n48), .Y(n49) );
  OAI22XL U148 ( .A0(n7), .A1(n56), .B0(n57), .B1(n58), .Y(n179) );
  CLKINVX1 U149 ( .A(input_data[0]), .Y(n58) );
  OAI2BB2XL U150 ( .B0(n56), .B1(n59), .A0N(data[0]), .A1N(n60), .Y(n178) );
  CLKINVX1 U151 ( .A(res_di[0]), .Y(n56) );
  OAI2BB2XL U152 ( .B0(n59), .B1(n61), .A0N(data[1]), .A1N(n60), .Y(n177) );
  OAI2BB2XL U153 ( .B0(n59), .B1(n62), .A0N(data[2]), .A1N(n60), .Y(n176) );
  OAI2BB2XL U154 ( .B0(n59), .B1(n63), .A0N(data[3]), .A1N(n60), .Y(n175) );
  OAI2BB2XL U155 ( .B0(n59), .B1(n64), .A0N(data[4]), .A1N(n60), .Y(n174) );
  OAI2BB2XL U156 ( .B0(n59), .B1(n65), .A0N(data[5]), .A1N(n60), .Y(n173) );
  OAI2BB2XL U157 ( .B0(n59), .B1(n30), .A0N(data[6]), .A1N(n60), .Y(n172) );
  OAI2BB2XL U158 ( .B0(n59), .B1(n66), .A0N(data[7]), .A1N(n60), .Y(n171) );
  CLKINVX1 U159 ( .A(n70), .Y(n67) );
  CLKINVX1 U160 ( .A(n72), .Y(n69) );
  OAI22XL U161 ( .A0(n7), .A1(n61), .B0(n57), .B1(n73), .Y(n170) );
  CLKINVX1 U162 ( .A(input_data[1]), .Y(n73) );
  CLKINVX1 U163 ( .A(res_di[1]), .Y(n61) );
  OAI22XL U164 ( .A0(n7), .A1(n62), .B0(n57), .B1(n74), .Y(n169) );
  CLKINVX1 U165 ( .A(input_data[2]), .Y(n74) );
  CLKINVX1 U166 ( .A(res_di[2]), .Y(n62) );
  OAI22XL U167 ( .A0(n7), .A1(n63), .B0(n57), .B1(n75), .Y(n168) );
  CLKINVX1 U168 ( .A(input_data[3]), .Y(n75) );
  CLKINVX1 U169 ( .A(res_di[3]), .Y(n63) );
  OAI22XL U170 ( .A0(n7), .A1(n64), .B0(n57), .B1(n76), .Y(n167) );
  CLKINVX1 U171 ( .A(input_data[4]), .Y(n76) );
  CLKINVX1 U172 ( .A(res_di[4]), .Y(n64) );
  OAI22XL U173 ( .A0(n7), .A1(n65), .B0(n57), .B1(n77), .Y(n166) );
  CLKINVX1 U174 ( .A(input_data[5]), .Y(n77) );
  CLKINVX1 U175 ( .A(res_di[5]), .Y(n65) );
  OAI22XL U176 ( .A0(n7), .A1(n30), .B0(n57), .B1(n78), .Y(n165) );
  CLKINVX1 U177 ( .A(input_data[6]), .Y(n78) );
  OAI22XL U178 ( .A0(n7), .A1(n66), .B0(n57), .B1(n79), .Y(n164) );
  CLKINVX1 U179 ( .A(input_data[7]), .Y(n79) );
  CLKINVX1 U180 ( .A(res_di[7]), .Y(n66) );
  NAND3X1 U181 ( .A(n83), .B(n84), .C(n85), .Y(n163) );
  AOI222XL U182 ( .A0(N136), .A1(n9), .B0(n86), .B1(N136), .C0(N198), .C1(n8), 
        .Y(n85) );
  AOI22X1 U183 ( .A0(N198), .A1(n13), .B0(N122), .B1(n11), .Y(n84) );
  AOI2BB2X1 U184 ( .B0(N241), .B1(n10), .A0N(n91), .A1N(n92), .Y(n83) );
  NAND4X1 U185 ( .A(n93), .B(n12), .C(n94), .D(n95), .Y(n162) );
  AOI222XL U186 ( .A0(n6), .A1(n9), .B0(res_addr[1]), .B1(n86), .C0(N199), 
        .C1(n8), .Y(n95) );
  AOI22X1 U187 ( .A0(N123), .A1(n11), .B0(N242), .B1(n10), .Y(n94) );
  NAND2X1 U188 ( .A(N228), .B(n13), .Y(n93) );
  NAND4X1 U189 ( .A(n96), .B(n12), .C(n97), .D(n98), .Y(n161) );
  AOI222XL U190 ( .A0(N138), .A1(n9), .B0(res_addr[2]), .B1(n86), .C0(N200), 
        .C1(n8), .Y(n98) );
  AOI22X1 U191 ( .A0(N124), .A1(n11), .B0(N243), .B1(n10), .Y(n97) );
  NAND2X1 U192 ( .A(N229), .B(n13), .Y(n96) );
  NAND4X1 U193 ( .A(n99), .B(n12), .C(n100), .D(n101), .Y(n160) );
  AOI222XL U194 ( .A0(N139), .A1(n9), .B0(res_addr[3]), .B1(n86), .C0(N201), 
        .C1(n8), .Y(n101) );
  AOI22X1 U195 ( .A0(N125), .A1(n11), .B0(N244), .B1(n10), .Y(n100) );
  NAND2X1 U196 ( .A(N230), .B(n13), .Y(n99) );
  NAND4X1 U197 ( .A(n102), .B(n12), .C(n103), .D(n104), .Y(n159) );
  AOI222XL U198 ( .A0(N140), .A1(n9), .B0(res_addr[4]), .B1(n86), .C0(N202), 
        .C1(n8), .Y(n104) );
  AOI22X1 U199 ( .A0(N126), .A1(n11), .B0(N245), .B1(n10), .Y(n103) );
  NAND2X1 U200 ( .A(N231), .B(n13), .Y(n102) );
  NAND4X1 U201 ( .A(n105), .B(n12), .C(n106), .D(n107), .Y(n158) );
  AOI222XL U202 ( .A0(N141), .A1(n9), .B0(res_addr[5]), .B1(n86), .C0(N203), 
        .C1(n8), .Y(n107) );
  AOI22X1 U203 ( .A0(N127), .A1(n11), .B0(N246), .B1(n10), .Y(n106) );
  NAND2X1 U204 ( .A(N232), .B(n13), .Y(n105) );
  NAND4X1 U205 ( .A(n108), .B(n12), .C(n109), .D(n110), .Y(n157) );
  AOI222XL U206 ( .A0(N142), .A1(n9), .B0(res_addr[6]), .B1(n86), .C0(N204), 
        .C1(n8), .Y(n110) );
  AOI22X1 U207 ( .A0(N128), .A1(n11), .B0(N247), .B1(n10), .Y(n109) );
  NAND2X1 U208 ( .A(N233), .B(n13), .Y(n108) );
  NAND3X1 U209 ( .A(n111), .B(n112), .C(n113), .Y(n156) );
  AOI222XL U210 ( .A0(N143), .A1(n9), .B0(n86), .B1(res_addr[7]), .C0(N205), 
        .C1(n8), .Y(n113) );
  AOI22X1 U211 ( .A0(N234), .A1(n13), .B0(N129), .B1(n11), .Y(n112) );
  AOI2BB2X1 U212 ( .B0(N248), .B1(n10), .A0N(n91), .A1N(n92), .Y(n111) );
  NAND4X1 U213 ( .A(n114), .B(n12), .C(n115), .D(n116), .Y(n155) );
  AOI222XL U214 ( .A0(N144), .A1(n9), .B0(res_addr[8]), .B1(n86), .C0(N206), 
        .C1(n8), .Y(n116) );
  AOI22X1 U215 ( .A0(N130), .A1(n11), .B0(N249), .B1(n10), .Y(n115) );
  NAND2X1 U216 ( .A(N235), .B(n13), .Y(n114) );
  NAND4X1 U217 ( .A(n117), .B(n12), .C(n118), .D(n119), .Y(n154) );
  AOI222XL U218 ( .A0(N145), .A1(n9), .B0(res_addr[9]), .B1(n86), .C0(N207), 
        .C1(n8), .Y(n119) );
  AOI22X1 U219 ( .A0(N131), .A1(n11), .B0(N250), .B1(n10), .Y(n118) );
  NAND2X1 U220 ( .A(N236), .B(n13), .Y(n117) );
  NAND4X1 U221 ( .A(n120), .B(n12), .C(n121), .D(n122), .Y(n153) );
  AOI222XL U222 ( .A0(N146), .A1(n9), .B0(res_addr[10]), .B1(n86), .C0(N208), 
        .C1(n8), .Y(n122) );
  AOI22X1 U223 ( .A0(N132), .A1(n11), .B0(N251), .B1(n10), .Y(n121) );
  NAND2X1 U224 ( .A(N237), .B(n13), .Y(n120) );
  NAND4X1 U225 ( .A(n123), .B(n12), .C(n124), .D(n125), .Y(n152) );
  AOI222XL U226 ( .A0(N147), .A1(n9), .B0(res_addr[11]), .B1(n86), .C0(N209), 
        .C1(n8), .Y(n125) );
  AOI22X1 U227 ( .A0(N133), .A1(n11), .B0(N252), .B1(n10), .Y(n124) );
  NAND2X1 U228 ( .A(N238), .B(n13), .Y(n123) );
  NAND4X1 U229 ( .A(n126), .B(n12), .C(n127), .D(n128), .Y(n151) );
  AOI222XL U230 ( .A0(N148), .A1(n9), .B0(res_addr[12]), .B1(n86), .C0(N210), 
        .C1(n8), .Y(n128) );
  AOI22X1 U231 ( .A0(N134), .A1(n11), .B0(N253), .B1(n10), .Y(n127) );
  NAND2X1 U232 ( .A(N239), .B(n13), .Y(n126) );
  NAND4X1 U233 ( .A(n129), .B(n12), .C(n130), .D(n131), .Y(n150) );
  AOI222XL U234 ( .A0(N149), .A1(n9), .B0(res_addr[13]), .B1(n86), .C0(N211), 
        .C1(n8), .Y(n131) );
  NOR2X1 U235 ( .A(n70), .B(n9), .Y(n72) );
  NAND3BX1 U236 ( .AN(n8), .B(n133), .C(n134), .Y(n70) );
  AOI22X1 U237 ( .A0(N135), .A1(n11), .B0(N254), .B1(n10), .Y(n130) );
  NAND3X1 U238 ( .A(nstate[1]), .B(n82), .C(nstate[0]), .Y(n132) );
  CLKINVX1 U239 ( .A(nstate[1]), .Y(n135) );
  NOR4X1 U240 ( .A(nstate[0]), .B(nstate[1]), .C(nstate[2]), .D(nstate[3]), 
        .Y(n68) );
  NAND2X1 U241 ( .A(N240), .B(n13), .Y(n129) );
  NAND2X1 U242 ( .A(nstate[3]), .B(n81), .Y(n91) );
  CLKINVX1 U243 ( .A(nstate[0]), .Y(n81) );
  NAND4X1 U244 ( .A(n140), .B(n141), .C(n142), .D(n143), .Y(nstate[0]) );
  NAND3X1 U245 ( .A(n2), .B(n5), .C(state[2]), .Y(n142) );
  NAND2X1 U246 ( .A(fp_done), .B(n144), .Y(n141) );
  OA21XL U247 ( .A0(n145), .A1(n146), .B0(n139), .Y(n140) );
  NAND2X1 U248 ( .A(n147), .B(state[2]), .Y(n139) );
  CLKINVX1 U249 ( .A(n149), .Y(n145) );
  NAND3BX1 U250 ( .AN(n196), .B(n180), .C(n181), .Y(nstate[3]) );
  OA22X1 U251 ( .A0(n143), .A1(n92), .B0(n149), .B1(n146), .Y(n181) );
  NAND2X1 U252 ( .A(n147), .B(n4), .Y(n146) );
  NOR3X1 U253 ( .A(state[0]), .B(state[3]), .C(n1), .Y(n147) );
  NAND2X1 U254 ( .A(n182), .B(n183), .Y(n149) );
  NOR4X1 U255 ( .A(input_data[7]), .B(input_data[6]), .C(input_data[5]), .D(
        input_data[4]), .Y(n183) );
  NOR4X1 U256 ( .A(input_data[3]), .B(input_data[2]), .C(input_data[1]), .D(
        input_data[0]), .Y(n182) );
  CLKINVX1 U257 ( .A(n92), .Y(n137) );
  OAI211X1 U258 ( .A0(n184), .A1(n185), .B0(n186), .C0(n187), .Y(n92) );
  NOR4X1 U259 ( .A(res_addr[9]), .B(res_addr[8]), .C(res_addr[13]), .D(
        res_addr[12]), .Y(n187) );
  NOR2X1 U260 ( .A(res_addr[11]), .B(res_addr[10]), .Y(n186) );
  CLKINVX1 U261 ( .A(res_addr[7]), .Y(n185) );
  NOR4X1 U262 ( .A(n188), .B(N136), .C(res_addr[2]), .D(res_addr[1]), .Y(n184)
         );
  OR4X1 U263 ( .A(res_addr[3]), .B(res_addr[4]), .C(res_addr[5]), .D(
        res_addr[6]), .Y(n188) );
  NAND4BBXL U264 ( .AN(res_addr[1]), .BN(res_addr[2]), .C(N136), .D(n189), .Y(
        n136) );
  NOR4X1 U265 ( .A(res_addr[6]), .B(res_addr[5]), .C(res_addr[4]), .D(
        res_addr[3]), .Y(n189) );
  AO22X1 U266 ( .A0(N371), .A1(n190), .B0(n191), .B1(input_data[7]), .Y(N403)
         );
  AO22X1 U267 ( .A0(N370), .A1(n190), .B0(n191), .B1(input_data[6]), .Y(N402)
         );
  AO22X1 U268 ( .A0(N369), .A1(n190), .B0(n191), .B1(input_data[5]), .Y(N401)
         );
  AO22X1 U269 ( .A0(N368), .A1(n190), .B0(n191), .B1(input_data[4]), .Y(N400)
         );
  AO22X1 U270 ( .A0(N367), .A1(n190), .B0(n191), .B1(input_data[3]), .Y(N399)
         );
  AO22X1 U271 ( .A0(N366), .A1(n190), .B0(n191), .B1(input_data[2]), .Y(N398)
         );
  AO22X1 U272 ( .A0(N365), .A1(n190), .B0(n191), .B1(input_data[1]), .Y(N397)
         );
  AO22X1 U273 ( .A0(N364), .A1(n190), .B0(n191), .B1(input_data[0]), .Y(N396)
         );
  AOI21X1 U274 ( .A0(n193), .A1(n138), .B0(state[3]), .Y(N391) );
  MXI2X1 U275 ( .A(n1), .B(n194), .S0(n4), .Y(n138) );
  NOR2X1 U276 ( .A(n2), .B(n1), .Y(n194) );
  MXI2X1 U277 ( .A(n195), .B(state[2]), .S0(n2), .Y(n193) );
  NAND2X1 U278 ( .A(n148), .B(state[3]), .Y(N390) );
  NOR3X1 U279 ( .A(n197), .B(N394), .C(n144), .Y(n148) );
  AO21X1 U280 ( .A0(n5), .A1(n144), .B0(n196), .Y(N394) );
  NOR2X1 U281 ( .A(n2), .B(n143), .Y(n196) );
  NAND2X1 U282 ( .A(state[3]), .B(n195), .Y(n143) );
  NOR2X1 U283 ( .A(n192), .B(state[0]), .Y(n144) );
  CLKINVX1 U284 ( .A(n195), .Y(n192) );
  NOR2X1 U285 ( .A(state[2]), .B(state[1]), .Y(n195) );
  NOR4X1 U286 ( .A(n4), .B(n1), .C(n2), .D(state[3]), .Y(n197) );
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
         res_wr_bp, N26, n27, n28, n29, n30, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n64, n65,
         n66, n67, n83;
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
  assign done = N26;

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
  DFFRX1 \state_reg[0]  ( .D(n83), .CK(clk), .RN(reset), .Q(state[0]), .QN(n55) );
  DFFRX1 \state_reg[1]  ( .D(\nstate[1] ), .CK(clk), .RN(reset), .Q(state[1]), 
        .QN(n56) );
  NOR2X1 U71 ( .A(state[0]), .B(state[1]), .Y(n27) );
  CLKBUFX3 U72 ( .A(n27), .Y(n67) );
  NOR2X1 U73 ( .A(n55), .B(n56), .Y(N26) );
  CLKBUFX3 U74 ( .A(n29), .Y(n65) );
  CLKBUFX3 U75 ( .A(n27), .Y(n66) );
  CLKBUFX3 U76 ( .A(n30), .Y(n64) );
  CLKINVX1 U77 ( .A(n53), .Y(n83) );
  AOI211X1 U78 ( .A0(n67), .A1(initialize_done), .B0(N26), .C0(n54), .Y(n53)
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

