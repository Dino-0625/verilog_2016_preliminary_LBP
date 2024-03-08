/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12
// Date      : Sat Dec 23 21:10:07 2023
/////////////////////////////////////////////////////////////


module LBP_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2XL U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  INVXL U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_inc_1_DW01_inc_2 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  XOR2XL U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  INVXL U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_inc_2_DW01_inc_3 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;
  wire   n3, n4, n5, n6;
  wire   [6:2] carry;

  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  INVX3 U1 ( .A(carry[6]), .Y(n3) );
  NAND2X1 U2 ( .A(n3), .B(A[6]), .Y(n6) );
  NAND2X1 U3 ( .A(n5), .B(n6), .Y(SUM[6]) );
  NAND2X1 U4 ( .A(carry[6]), .B(n4), .Y(n5) );
  INVXL U5 ( .A(A[6]), .Y(n4) );
  INVXL U6 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, 
        lbp_valid, lbp_data, finish );
  output [13:0] gray_addr;
  input [7:0] gray_data;
  output [13:0] lbp_addr;
  output [7:0] lbp_data;
  input clk, reset, gray_ready;
  output gray_req, lbp_valid, finish;
  wire   n555, n556, n560, n561, n562, n563, n565, n566, n567, \thresh[0][5] ,
         \thresh[0][4] , \thresh[0][3] , \thresh[1][3] , \thresh[2][7] ,
         \thresh[2][3] , \thresh[3][7] , \thresh[3][4] , \thresh[3][3] ,
         \thresh[3][1] , \thresh[4][7] , \thresh[4][5] , \thresh[4][4] ,
         \thresh[4][3] , \thresh[4][1] , \thresh[4][0] , \thresh[5][7] ,
         \thresh[5][4] , \thresh[5][3] , \thresh[6][3] , \thresh[6][2] ,
         \thresh[7][7] , \thresh[7][4] , \thresh[7][3] , \thresh[7][2] ,
         \thresh[7][1] , \thresh[8][4] , \thresh[8][3] , \thresh[8][1] ,
         \thresh[8][0] , N67, N68, N70, N86, N87, N88, N89, N90, N91, N92,
         N163, N164, N165, N166, N167, N168, N169, N198, N199, N200, N201,
         N202, N203, N204, N283, N284, N285, N286, N287, N288, N289, N295,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n192, n193, n194, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n246, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n578, N391, N390,
         N389, N388, N387, N386, N385, N398, N397, N396, N395, N394, N393,
         N392, n328, n335, n389, n1007, n1569, n1562, n1043, n1045, n1053,
         n1057, n1072, n1074, n1163, n1165, n1167, n1168, n1169, n1170, n1175,
         n1184, n1186, n1189, n1190, n1191, n1192, n1195, n1197, n1208, n1209,
         n1210, n1211, n1213, n1215, n1217, n1219, n1220, n1221, n1222, n1225,
         n1561, n1712, n1713, n1714, n1715, n1716, n1717, n1718, n1719, n1720,
         n1721, n1722, n1723, n1724, n1725, n1726, n1727, n1728, n1729, n1730,
         n1731, n1732, n1733, n1734, n1735, n1736, n1737, n1738, n1739, n1740,
         n1741, n1742, n1743, n1744, n1745, n1746, n1747, n1748, n1749, n1750,
         n1751, n1752, n1753, n1754, n1755, n1756, n1757, n1758, n1759, n1760,
         n1761, n1762, n1763, n1764, n1765, n1766, n1767, n1768, n1769, n1770,
         n1771, n1772, n1773, n1774, n1775, n1776, n1777, n1778, n1779, n1780,
         n1781, n1782, n1783, n1784, n1785, n1786, n1787, n1788, n1789, n1790,
         n1791, n1792, n1793, n1794, n1795, n1796, n1797, n1798, n1799, n1800,
         n1801, n1802, n1803, n1804, n1805, n1806, n1807, n1808, n1809, n1810,
         n1811, n1812, n1813, n1814, n1815, n1816, n1817, n1818, n1819, n1820,
         n1821, n1822, n1823, n1824, n1825, n1826, n1827, n1828, n1829, n1830,
         n1831, n1832, n1833, n1834, n1835, n1836, n1837, n1838, n1839, n1840,
         n1841, n1842, n1843, n1844, n1845, n1846, n1847, n1848, n1849, n1850,
         n1851, n1852, n1853, n1854, n1855, n1856, n1857, n1858, n1859, n1860,
         n1861, n1862, n1863, n1864, n1865, n1866, n1867, n1868, n1869, n1870,
         n1871, n1872, n1874, n1875, n1876, n1877, n1878, n1879, n1880, n1881,
         n1882, n1883, n1884, n1885, n1886, n1887, n1888, n1889, n1890, n1891,
         n1892, n1893, n1894, n1895, n1896, n1897, n1898, n1899, n1900, n1901,
         n2089, n2091, n2090, n2097, n2096, n2095, n2094, n2093, n2092,
         \add_103_aco/n2 , n1912, n1913, n1914, n1915, n1916, n1917, n1918,
         n1919, n1920, n1921, n1922, n1923, n1924, n1925, n1926, n1927, n1928,
         n1929, n1930, n1931, n1947, n1969, n1970, n1971, n1972, n1973, n1974,
         n1976, n1977, n1978, n1979, n1980, n1981, n1982, n1983, n1984, n1985,
         n1986, n1987, n1988, n1989, n1990, n1991, n1992, n1993, n1994, n1995,
         n1996, n1997, n1998, n1999, n2000, n2001, n2002, n2003, n2004, n2005,
         n2006, n2007, n2008, n2009, n2010, n2011, n2012, n2013, n2014, n2015,
         n2016, n2017, n2018, n2019, n2020, n2021, n2022, n2023, n2024, n2025,
         n2026, n2027, n2028, n2029, n2030, n2031, n2032, n2033, n2034, n2035,
         n2036, n2037, n2038, n2039, n2040, n2041, n2042, n2043, n2044, n2045,
         n2046, n2047, n2048, n2049, n2050, n2051, n2052, n2053, n2054, n2055,
         n2056, n2057, n2058, n2059, n2060, n2061, n2062, n2063, n2064, n2065,
         n2066, n2067, n2068, n2069, n2070, n2071, n2072, n2073, n2074, n2075,
         n2076, n2077, n2078, n2079, n2080, n2081, n2083, n2085, n2086, n2087,
         n2088;
  wire   [2:0] state;
  wire   [2:0] nextState;
  wire   [6:2] \add_103_aco/carry ;

  OA21X4 U832 ( .A0(n2021), .A1(n1914), .B0(n1861), .Y(n1858) );
  OAI31X2 U851 ( .A0(n1851), .A1(n1850), .A2(n2015), .B0(n2008), .Y(n1825) );
  LBP_DW01_inc_0_DW01_inc_1 r538 ( .A({n555, n556, lbp_addr[11:10], n2089, 
        n560, n561}), .SUM({N204, N203, N202, N201, N200, N199, N198}) );
  LBP_DW01_inc_1_DW01_inc_2 r537 ( .A({n562, n563, lbp_addr[4], n565, n566, 
        n567, N392}), .SUM({N169, N168, N167, N166, N165, N164, N163}) );
  LBP_DW01_inc_2_DW01_inc_3 add_100_aco ( .A({N391, N390, N389, N388, N387, 
        N386, N385}), .SUM({N289, N288, N287, N286, N285, N284, N283}) );
  DFFX1 finishGetData_reg ( .D(n1970), .CK(clk), .Q(n1930), .QN(n1899) );
  DFFX1 finishStoreBack_reg ( .D(N295), .CK(clk), .QN(n1007) );
  TLATX1 \nextState_reg[2]  ( .G(N67), .D(N70), .Q(nextState[2]), .QN(n1929)
         );
  TLATX1 \nextState_reg[0]  ( .G(N67), .D(N68), .Q(nextState[0]), .QN(n1916)
         );
  TLATX1 \nextState_reg[1]  ( .G(N67), .D(n1561), .Q(nextState[1]) );
  DFFX1 \countNine_reg[3]  ( .D(n257), .CK(clk), .Q(n1915), .QN(n389) );
  DFFX1 \thresh_reg[1][2]  ( .D(n166), .CK(clk), .QN(n1057) );
  DFFX1 \thresh_reg[3][2]  ( .D(n182), .CK(clk), .QN(n1053) );
  DFFX1 \thresh_reg[2][6]  ( .D(n178), .CK(clk), .QN(n1225) );
  EDFFX1 \thresh_reg[4][3]  ( .D(gray_data[3]), .E(n2017), .CK(clk), .Q(
        \thresh[4][3] ) );
  DFFX1 \countNine_reg[1]  ( .D(n260), .CK(clk), .QN(n328) );
  EDFFXL \y_reg[6]  ( .D(N289), .E(n1901), .CK(clk), .Q(n555) );
  EDFFX1 \y_reg[5]  ( .D(N288), .E(n1901), .CK(clk), .Q(n556), .QN(n2002) );
  DFFTRX1 \state_reg[2]  ( .D(n2068), .RN(nextState[2]), .CK(clk), .Q(state[2]), .QN(n2083) );
  DFFTRX1 \state_reg[0]  ( .D(n2068), .RN(nextState[0]), .CK(clk), .QN(n2085)
         );
  DFFTRX1 \state_reg[1]  ( .D(nextState[1]), .RN(n2068), .CK(clk), .Q(state[1]), .QN(n2086) );
  EDFFX1 \thresh_reg[4][7]  ( .D(gray_data[7]), .E(n2017), .CK(clk), .Q(
        \thresh[4][7] ), .QN(n2077) );
  EDFFX2 \y_reg[3]  ( .D(N286), .E(n1901), .CK(clk), .QN(n2001) );
  DFFX1 \x_reg[6]  ( .D(n250), .CK(clk), .Q(n562), .QN(n2032) );
  DFFX1 \x_reg[2]  ( .D(n254), .CK(clk), .Q(n566), .QN(n2031) );
  DFFX1 \thresh_reg[1][4]  ( .D(n168), .CK(clk), .Q(n1217) );
  DFFX1 \thresh_reg[2][4]  ( .D(n176), .CK(clk), .Q(n1213) );
  DFFX1 \thresh_reg[6][4]  ( .D(n208), .CK(clk), .Q(n1215) );
  DFFX1 \thresh_reg[3][6]  ( .D(n186), .CK(clk), .Q(n1190), .QN(n2039) );
  DFFX1 \thresh_reg[3][5]  ( .D(n185), .CK(clk), .Q(n1186), .QN(n2054) );
  DFFX1 \thresh_reg[8][6]  ( .D(n226), .CK(clk), .Q(n1191), .QN(n2041) );
  DFFX1 \thresh_reg[8][5]  ( .D(n225), .CK(clk), .Q(n1175), .QN(n2042) );
  DFFX1 \thresh_reg[8][7]  ( .D(n227), .CK(clk), .Q(n1209) );
  DFFX1 \thresh_reg[8][2]  ( .D(n222), .CK(clk), .Q(n1197) );
  DFFX1 \thresh_reg[6][6]  ( .D(n210), .CK(clk), .Q(n1189), .QN(n2038) );
  DFFX1 \thresh_reg[6][5]  ( .D(n209), .CK(clk), .Q(n1169), .QN(n2043) );
  DFFX1 \thresh_reg[6][1]  ( .D(n205), .CK(clk), .QN(n2060) );
  DFFX1 \thresh_reg[6][0]  ( .D(n212), .CK(clk), .Q(n1222), .QN(n2036) );
  DFFX1 \thresh_reg[5][6]  ( .D(n202), .CK(clk), .Q(n1163), .QN(n2037) );
  DFFX1 \thresh_reg[5][5]  ( .D(n201), .CK(clk), .Q(n1168), .QN(n2045) );
  DFFX1 \thresh_reg[5][2]  ( .D(n198), .CK(clk), .QN(n2047) );
  DFFX1 \thresh_reg[5][1]  ( .D(n197), .CK(clk), .QN(n2059) );
  DFFX1 \thresh_reg[5][0]  ( .D(n204), .CK(clk), .Q(n1221), .QN(n2034) );
  DFFX1 \thresh_reg[1][6]  ( .D(n170), .CK(clk), .Q(n1165), .QN(n2063) );
  DFFX1 \thresh_reg[1][5]  ( .D(n169), .CK(clk), .Q(n1167), .QN(n2035) );
  DFFX1 \thresh_reg[1][1]  ( .D(n165), .CK(clk), .QN(n2058) );
  DFFX1 \thresh_reg[1][0]  ( .D(n172), .CK(clk), .Q(n1220), .QN(n2053) );
  DFFX1 \thresh_reg[2][5]  ( .D(n177), .CK(clk), .Q(n1170), .QN(n2044) );
  DFFX1 \thresh_reg[2][2]  ( .D(n174), .CK(clk), .QN(n2046) );
  DFFX1 \thresh_reg[2][1]  ( .D(n173), .CK(clk), .QN(n2056) );
  DFFX1 \thresh_reg[2][0]  ( .D(n180), .CK(clk), .Q(n1219), .QN(n2033) );
  DFFX1 \thresh_reg[7][6]  ( .D(n218), .CK(clk), .Q(n1043), .QN(n2064) );
  DFFX1 \thresh_reg[7][5]  ( .D(n217), .CK(clk), .Q(n1184), .QN(n2055) );
  DFFX1 \thresh_reg[0][6]  ( .D(n162), .CK(clk), .Q(n1192), .QN(n2040) );
  DFFX1 \thresh_reg[0][2]  ( .D(n158), .CK(clk), .QN(n2052) );
  DFFX1 \thresh_reg[0][1]  ( .D(n157), .CK(clk), .QN(n2057) );
  DFFX1 \thresh_reg[6][7]  ( .D(n211), .CK(clk), .Q(n1210) );
  DFFX1 \thresh_reg[0][7]  ( .D(n163), .CK(clk), .Q(n1211) );
  DFFX1 \thresh_reg[1][7]  ( .D(n171), .CK(clk), .Q(n1208) );
  DFFQXL \thresh_reg[0][5]  ( .D(n161), .CK(clk), .Q(\thresh[0][5] ) );
  DFFQXL \thresh_reg[6][3]  ( .D(n207), .CK(clk), .Q(\thresh[6][3] ) );
  DFFQXL \thresh_reg[5][4]  ( .D(n200), .CK(clk), .Q(\thresh[5][4] ) );
  DFFQXL \thresh_reg[5][3]  ( .D(n199), .CK(clk), .Q(\thresh[5][3] ) );
  DFFQXL \thresh_reg[7][4]  ( .D(n216), .CK(clk), .Q(\thresh[7][4] ) );
  DFFQXL \thresh_reg[7][3]  ( .D(n215), .CK(clk), .Q(\thresh[7][3] ) );
  DFFQXL \thresh_reg[3][1]  ( .D(n181), .CK(clk), .Q(\thresh[3][1] ) );
  DFFQXL \thresh_reg[4][5]  ( .D(n193), .CK(clk), .Q(\thresh[4][5] ) );
  DFFQXL \thresh_reg[4][4]  ( .D(n192), .CK(clk), .Q(\thresh[4][4] ) );
  DFFQXL \thresh_reg[4][0]  ( .D(n196), .CK(clk), .Q(\thresh[4][0] ) );
  DFFQXL \thresh_reg[3][4]  ( .D(n184), .CK(clk), .Q(\thresh[3][4] ) );
  DFFQXL \thresh_reg[8][4]  ( .D(n224), .CK(clk), .Q(\thresh[8][4] ) );
  DFFQXL \thresh_reg[8][3]  ( .D(n223), .CK(clk), .Q(\thresh[8][3] ) );
  DFFQXL \thresh_reg[3][3]  ( .D(n183), .CK(clk), .Q(\thresh[3][3] ) );
  DFFQXL \thresh_reg[3][0]  ( .D(n188), .CK(clk), .Q(n1896) );
  DFFQXL \thresh_reg[5][7]  ( .D(n203), .CK(clk), .Q(\thresh[5][7] ) );
  DFFQXL \thresh_reg[1][3]  ( .D(n167), .CK(clk), .Q(\thresh[1][3] ) );
  DFFQXL \thresh_reg[2][3]  ( .D(n175), .CK(clk), .Q(\thresh[2][3] ) );
  DFFQXL \thresh_reg[7][7]  ( .D(n219), .CK(clk), .Q(\thresh[7][7] ) );
  DFFQXL \thresh_reg[7][1]  ( .D(n213), .CK(clk), .Q(\thresh[7][1] ) );
  DFFQXL \thresh_reg[7][0]  ( .D(n220), .CK(clk), .Q(n1897) );
  DFFQXL \thresh_reg[0][4]  ( .D(n160), .CK(clk), .Q(\thresh[0][4] ) );
  DFFQXL \thresh_reg[0][3]  ( .D(n159), .CK(clk), .Q(\thresh[0][3] ) );
  DFFQXL \thresh_reg[0][0]  ( .D(n164), .CK(clk), .Q(n1898) );
  DFFQXL \thresh_reg[8][1]  ( .D(n221), .CK(clk), .Q(\thresh[8][1] ) );
  DFFQXL \thresh_reg[8][0]  ( .D(n228), .CK(clk), .Q(\thresh[8][0] ) );
  DFFQXL \thresh_reg[3][7]  ( .D(n187), .CK(clk), .Q(\thresh[3][7] ) );
  DFFQXL \thresh_reg[6][2]  ( .D(n206), .CK(clk), .Q(\thresh[6][2] ) );
  DFFQXL \thresh_reg[7][2]  ( .D(n214), .CK(clk), .Q(\thresh[7][2] ) );
  DFFQXL \thresh_reg[2][7]  ( .D(n179), .CK(clk), .Q(\thresh[2][7] ) );
  DFFX2 \x_reg[4]  ( .D(n252), .CK(clk), .QN(n2021) );
  DFFX2 \thresh_reg[4][1]  ( .D(n189), .CK(clk), .Q(\thresh[4][1] ), .QN(n1974) );
  DFFX2 \y_reg[4]  ( .D(n246), .CK(clk), .QN(n2020) );
  DFFX1 \x_s_reg[3]  ( .D(n231), .CK(clk), .QN(n1926) );
  DFFX1 \x_s_reg[1]  ( .D(n229), .CK(clk), .QN(n1925) );
  DFFX1 \x_s_reg[4]  ( .D(n232), .CK(clk), .QN(n1924) );
  DFFX1 \x_s_reg[5]  ( .D(n233), .CK(clk), .QN(n1922) );
  DFFX1 \x_s_reg[2]  ( .D(n230), .CK(clk), .QN(n1920) );
  DFFX1 \y_s_reg[4]  ( .D(n239), .CK(clk), .QN(n1928) );
  DFFX1 \y_s_reg[5]  ( .D(n240), .CK(clk), .QN(n1919) );
  DFFX1 \y_s_reg[1]  ( .D(n236), .CK(clk), .QN(n1921) );
  DFFX1 \y_s_reg[2]  ( .D(n237), .CK(clk), .QN(n1927) );
  DFFX1 \y_s_reg[0]  ( .D(n235), .CK(clk), .QN(n1923) );
  DFFX1 \x_s_reg[0]  ( .D(n242), .CK(clk), .QN(n1918) );
  DFFXL \y_s_reg[3]  ( .D(n238), .CK(clk), .QN(n1917) );
  DFFQX2 \thresh_reg[4][2]  ( .D(n190), .CK(clk), .Q(n1195) );
  DFFQX2 \thresh_reg[4][6]  ( .D(n194), .CK(clk), .Q(n1045) );
  EDFFX2 \y_reg[1]  ( .D(N284), .E(n1901), .CK(clk), .Q(n560), .QN(n1999) );
  DFFQX2 \countNine_reg[0]  ( .D(n259), .CK(clk), .Q(n1900) );
  EDFFX2 \y_reg[2]  ( .D(N285), .E(n1901), .CK(clk), .Q(n2089), .QN(n2000) );
  DFFQX2 \x_reg[0]  ( .D(n256), .CK(clk), .Q(N392) );
  DFFX2 \x_reg[5]  ( .D(n251), .CK(clk), .Q(n563), .QN(n2061) );
  DFFX2 \x_reg[1]  ( .D(n255), .CK(clk), .Q(n567), .QN(n1995) );
  EDFFX2 \y_reg[0]  ( .D(N283), .E(n1901), .CK(clk), .Q(n561), .QN(n1998) );
  DFFX2 \x_reg[3]  ( .D(n253), .CK(clk), .Q(n565), .QN(n1993) );
  DFFQX1 \countNine_reg[2]  ( .D(n258), .CK(clk), .Q(n1947) );
  DFFX1 \y_s_reg[6]  ( .D(n241), .CK(clk), .Q(n1562), .QN(n1072) );
  DFFXL \x_s_reg[6]  ( .D(n234), .CK(clk), .Q(n1569), .QN(n1074) );
  OAI31X4 U1080 ( .A0(n2010), .A1(n1852), .A2(n1853), .B0(n2008), .Y(n1824) );
  INVX16 U1081 ( .A(n1813), .Y(n2008) );
  INVX1 U1082 ( .A(n1872), .Y(n2006) );
  INVX6 U1083 ( .A(n1825), .Y(n1912) );
  OAI31X4 U1084 ( .A0(n1853), .A1(n1854), .A2(n2015), .B0(n2008), .Y(n1831) );
  BUFX4 U1085 ( .A(n1830), .Y(n1989) );
  OAI221X4 U1086 ( .A0(n1839), .A1(n2001), .B0(n1838), .B1(n1989), .C0(n1840), 
        .Y(n238) );
  OA21X1 U1087 ( .A0(n2000), .A1(n1989), .B0(n1841), .Y(n1839) );
  NAND4X6 U1088 ( .A(nextState[1]), .B(n1916), .C(n1929), .D(n2068), .Y(n1820)
         );
  NOR3BX1 U1089 ( .AN(n1882), .B(n2019), .C(n1947), .Y(n1852) );
  INVX8 U1090 ( .A(n1912), .Y(n1914) );
  INVX12 U1091 ( .A(n1976), .Y(n1813) );
  INVX12 U1092 ( .A(n1891), .Y(lbp_valid) );
  INVX16 U1093 ( .A(n2021), .Y(lbp_addr[4]) );
  INVX16 U1094 ( .A(n2001), .Y(lbp_addr[10]) );
  INVX12 U1095 ( .A(n2020), .Y(lbp_addr[11]) );
  INVX12 U1096 ( .A(reset), .Y(n2068) );
  CLKINVX8 U1097 ( .A(n1912), .Y(n1913) );
  CLKINVX1 U1098 ( .A(n1947), .Y(n335) );
  NAND4X1 U1099 ( .A(n1994), .B(n2007), .C(n2021), .D(n1993), .Y(n1859) );
  OA21X2 U1100 ( .A0(n1993), .A1(n1914), .B0(n1863), .Y(n1861) );
  NOR4X2 U1101 ( .A(n2019), .B(n1915), .C(n335), .D(n1900), .Y(n1853) );
  NOR4X2 U1102 ( .A(n1915), .B(n328), .C(n335), .D(n1900), .Y(n1850) );
  CLKINVX1 U1103 ( .A(n555), .Y(n1931) );
  CLKINVX1 U1104 ( .A(n1900), .Y(n2022) );
  NAND4XL U1105 ( .A(n1999), .B(n1998), .C(n2000), .D(n2001), .Y(n1838) );
  NAND3BXL U1106 ( .AN(n1844), .B(n1999), .C(n2000), .Y(n1842) );
  INVX12 U1107 ( .A(n1917), .Y(gray_addr[10]) );
  INVX12 U1108 ( .A(n1918), .Y(gray_addr[0]) );
  INVX12 U1109 ( .A(n1923), .Y(gray_addr[7]) );
  INVX12 U1110 ( .A(n1927), .Y(gray_addr[9]) );
  INVX12 U1111 ( .A(n1921), .Y(gray_addr[8]) );
  INVX12 U1112 ( .A(n1919), .Y(gray_addr[12]) );
  INVX12 U1113 ( .A(n1928), .Y(gray_addr[11]) );
  INVX12 U1114 ( .A(n1920), .Y(gray_addr[2]) );
  INVX12 U1115 ( .A(n1922), .Y(gray_addr[5]) );
  INVX12 U1116 ( .A(n1924), .Y(gray_addr[4]) );
  INVX12 U1117 ( .A(n1925), .Y(gray_addr[1]) );
  INVX12 U1118 ( .A(n1926), .Y(gray_addr[3]) );
  OAI211XL U1119 ( .A0(n2008), .A1(n1074), .B0(n1855), .C0(n1856), .Y(n234) );
  AOI32X1 U1120 ( .A0(n2032), .A1(n2061), .A2(n1992), .B0(lbp_addr[6]), .B1(
        n1857), .Y(n1856) );
  BUFX12 U1121 ( .A(n2094), .Y(lbp_data[3]) );
  OAI2BB1X1 U1122 ( .A0N(n1776), .A1N(\thresh[3][7] ), .B0(n1777), .Y(n2094)
         );
  BUFX12 U1123 ( .A(n2096), .Y(lbp_data[1]) );
  OAI2BB1X1 U1124 ( .A0N(n1752), .A1N(n1208), .B0(n1753), .Y(n2096) );
  INVX12 U1125 ( .A(n2000), .Y(lbp_addr[9]) );
  BUFX12 U1126 ( .A(n2091), .Y(lbp_data[6]) );
  OAI2BB2XL U1127 ( .B0(n1712), .B1(n2048), .A0N(n2077), .A1N(n1713), .Y(n2091) );
  INVX12 U1128 ( .A(n2002), .Y(lbp_addr[12]) );
  INVX12 U1129 ( .A(n2031), .Y(lbp_addr[2]) );
  BUFX12 U1130 ( .A(n2090), .Y(lbp_data[7]) );
  OAI2BB2XL U1131 ( .B0(\thresh[4][7] ), .B1(n1728), .A0N(n1729), .A1N(n1209), 
        .Y(n2090) );
  INVX12 U1132 ( .A(n1931), .Y(lbp_addr[13]) );
  INVX12 U1133 ( .A(n2028), .Y(lbp_addr[0]) );
  BUFX12 U1134 ( .A(n2093), .Y(lbp_data[4]) );
  OAI2BB2XL U1135 ( .B0(n1788), .B1(n2088), .A0N(n2077), .A1N(n1789), .Y(n2093) );
  BUFX12 U1136 ( .A(n2092), .Y(lbp_data[5]) );
  OAI2BB2XL U1137 ( .B0(\thresh[4][7] ), .B1(n1800), .A0N(n1801), .A1N(n1210), 
        .Y(n2092) );
  INVX12 U1138 ( .A(n1999), .Y(lbp_addr[8]) );
  INVX12 U1139 ( .A(n1993), .Y(lbp_addr[3]) );
  INVX12 U1140 ( .A(n2032), .Y(lbp_addr[6]) );
  INVX12 U1141 ( .A(n1812), .Y(gray_req) );
  BUFX12 U1142 ( .A(n1562), .Y(gray_addr[13]) );
  BUFX12 U1143 ( .A(n1569), .Y(gray_addr[6]) );
  NAND3X1 U1144 ( .A(n1890), .B(n1007), .C(lbp_valid), .Y(N67) );
  BUFX12 U1145 ( .A(n578), .Y(finish) );
  NOR3X1 U1146 ( .A(n2085), .B(state[1]), .C(n2083), .Y(n578) );
  BUFX12 U1147 ( .A(n2095), .Y(lbp_data[2]) );
  OAI2BB2XL U1148 ( .B0(\thresh[4][7] ), .B1(n1764), .A0N(n1765), .A1N(
        \thresh[2][7] ), .Y(n2095) );
  INVX12 U1149 ( .A(n2061), .Y(lbp_addr[5]) );
  INVX12 U1150 ( .A(n1995), .Y(lbp_addr[1]) );
  INVX12 U1151 ( .A(n1998), .Y(lbp_addr[7]) );
  INVX3 U1152 ( .A(n1969), .Y(N385) );
  NOR2X1 U1153 ( .A(n1971), .B(n1931), .Y(N391) );
  INVX4 U1154 ( .A(n2068), .Y(n1971) );
  INVX3 U1155 ( .A(n1820), .Y(n2066) );
  NAND2XL U1156 ( .A(n1853), .B(n2066), .Y(n1885) );
  OR2X2 U1157 ( .A(reset), .B(n1998), .Y(n1969) );
  OR2X4 U1158 ( .A(n1980), .B(n1813), .Y(n1830) );
  NOR2X4 U1159 ( .A(n1820), .B(n1977), .Y(n1976) );
  CLKINVX1 U1160 ( .A(n1879), .Y(n1970) );
  NAND3XL U1161 ( .A(n335), .B(n2066), .C(n1889), .Y(n1879) );
  OAI2BB2XL U1162 ( .B0(n1901), .B1(n2020), .A0N(N287), .A1N(n1901), .Y(n246)
         );
  OAI211X1 U1163 ( .A0(n1841), .A1(n2000), .B0(n1842), .C0(n1843), .Y(n237) );
  INVX1 U1164 ( .A(n1848), .Y(n2004) );
  NOR2X4 U1165 ( .A(n1971), .B(n1999), .Y(N386) );
  AND2X2 U1166 ( .A(n1973), .B(n1845), .Y(n1841) );
  OA21XL U1167 ( .A0(n1989), .A1(n1998), .B0(n1831), .Y(n1845) );
  OAI211XL U1168 ( .A0(n1998), .A1(n1831), .B0(n1844), .C0(n1847), .Y(n235) );
  INVX1 U1169 ( .A(n2066), .Y(n1972) );
  OR2XL U1170 ( .A(n1989), .B(n1999), .Y(n1973) );
  AND4X1 U1171 ( .A(n1874), .B(n1875), .C(n1876), .D(n1877), .Y(n1977) );
  BUFX12 U1172 ( .A(n2097), .Y(lbp_data[0]) );
  OAI2BB1X1 U1173 ( .A0N(n1740), .A1N(n1211), .B0(n1741), .Y(n2097) );
  CLKINVX1 U1174 ( .A(n1982), .Y(n2013) );
  CLKINVX1 U1175 ( .A(n1984), .Y(n2014) );
  CLKINVX1 U1176 ( .A(n1983), .Y(n2011) );
  CLKINVX1 U1177 ( .A(n1987), .Y(n2009) );
  CLKINVX1 U1178 ( .A(n1988), .Y(n2003) );
  CLKINVX1 U1179 ( .A(n1985), .Y(n2016) );
  CLKINVX1 U1180 ( .A(n1986), .Y(n2018) );
  CLKINVX1 U1181 ( .A(n1884), .Y(n2017) );
  AND2X1 U1182 ( .A(N163), .B(n2006), .Y(n1978) );
  NOR2X1 U1183 ( .A(n1978), .B(n1979), .Y(n1826) );
  NOR3X1 U1184 ( .A(n1851), .B(n1852), .C(n2012), .Y(n1980) );
  OAI21XL U1185 ( .A0(n2061), .A1(n1914), .B0(n1858), .Y(n1857) );
  NAND2XL U1186 ( .A(n1972), .B(n2068), .Y(n1815) );
  OAI221XL U1187 ( .A0(n1858), .A1(n2061), .B0(n563), .B1(n1859), .C0(n1860), 
        .Y(n233) );
  NAND2XL U1188 ( .A(N204), .B(n2004), .Y(n1827) );
  NAND3XL U1189 ( .A(n1997), .B(n2020), .C(n2005), .Y(n1836) );
  OAI211XL U1190 ( .A0(n1863), .A1(n1993), .B0(n1864), .C0(n1865), .Y(n231) );
  NAND3XL U1191 ( .A(n2007), .B(n1993), .C(n1994), .Y(n1864) );
  OAI211XL U1192 ( .A0(n1869), .A1(n1995), .B0(n1870), .C0(n1871), .Y(n229) );
  NAND3XL U1193 ( .A(n2028), .B(n1995), .C(n2007), .Y(n1870) );
  OAI211XL U1194 ( .A0(\thresh[4][1] ), .A1(n2051), .B0(n1727), .C0(n2057), 
        .Y(n1751) );
  OAI211XL U1195 ( .A0(\thresh[4][1] ), .A1(n2053), .B0(n1727), .C0(n2058), 
        .Y(n1763) );
  OAI211XL U1196 ( .A0(\thresh[4][1] ), .A1(n2024), .B0(n1727), .C0(n2023), 
        .Y(n1787) );
  NOR3BX1 U1197 ( .AN(n1882), .B(n335), .C(n2019), .Y(n1854) );
  INVX3 U1198 ( .A(n328), .Y(n2019) );
  CLKINVX1 U1199 ( .A(gray_data[2]), .Y(n2074) );
  NOR4X1 U1200 ( .A(n1947), .B(n2019), .C(n389), .D(n1900), .Y(n1849) );
  AND2XL U1201 ( .A(gray_addr[0]), .B(n1813), .Y(n1979) );
  CLKINVX1 U1202 ( .A(n1989), .Y(n2005) );
  OA21X2 U1203 ( .A0(n1994), .A1(n1914), .B0(n1824), .Y(n1863) );
  CLKINVX1 U1204 ( .A(n1913), .Y(n2007) );
  CLKINVX1 U1205 ( .A(n1859), .Y(n1992) );
  OA21XL U1206 ( .A0(n1997), .A1(n1989), .B0(n1831), .Y(n1835) );
  OAI21XL U1207 ( .A0(n1996), .A1(n1989), .B0(n1831), .Y(n1829) );
  CLKBUFX3 U1208 ( .A(n1886), .Y(n1984) );
  NAND2X1 U1209 ( .A(n2015), .B(n2066), .Y(n1886) );
  CLKBUFX3 U1210 ( .A(n1887), .Y(n1983) );
  NAND2X1 U1211 ( .A(n2012), .B(n2066), .Y(n1887) );
  CLKBUFX3 U1212 ( .A(n1888), .Y(n1982) );
  NAND2X1 U1213 ( .A(n1852), .B(n2066), .Y(n1888) );
  CLKBUFX3 U1214 ( .A(n1881), .Y(n1987) );
  NAND2X1 U1215 ( .A(n2010), .B(n2066), .Y(n1881) );
  CLKINVX1 U1216 ( .A(n1815), .Y(n2065) );
  CLKINVX1 U1217 ( .A(n1866), .Y(n1994) );
  CLKINVX1 U1218 ( .A(n1838), .Y(n1997) );
  CLKINVX1 U1219 ( .A(n1832), .Y(n1996) );
  CLKINVX1 U1220 ( .A(n1818), .Y(n2010) );
  CLKINVX1 U1221 ( .A(n1875), .Y(n2012) );
  NOR4X1 U1222 ( .A(n1853), .B(n2010), .C(n1849), .D(n1851), .Y(n1877) );
  NAND2X1 U1223 ( .A(n2005), .B(n1998), .Y(n1844) );
  OA21XL U1224 ( .A0(n2028), .A1(n1914), .B0(n1824), .Y(n1869) );
  OAI31XL U1225 ( .A0(n1849), .A1(n1850), .A2(n2010), .B0(n2008), .Y(n1848) );
  OAI31XL U1226 ( .A0(n1849), .A1(n1854), .A2(n2012), .B0(n2008), .Y(n1872) );
  AOI2BB1X2 U1227 ( .A0N(n1971), .A1N(n1822), .B0(n2067), .Y(n1901) );
  INVX3 U1228 ( .A(n1823), .Y(n2067) );
  NAND2X2 U1229 ( .A(n2066), .B(n1854), .Y(n1884) );
  OAI22XL U1230 ( .A0(n2017), .A1(n2030), .B0(n2071), .B1(n1884), .Y(n193) );
  OAI22XL U1231 ( .A0(n2017), .A1(n2029), .B0(n2072), .B1(n1884), .Y(n192) );
  OAI22XL U1232 ( .A0(n2017), .A1(n2025), .B0(n2076), .B1(n1884), .Y(n196) );
  OAI22XL U1233 ( .A0(n2017), .A1(n1974), .B0(n2075), .B1(n1884), .Y(n189) );
  NOR2X2 U1234 ( .A(n2067), .B(n1971), .Y(n1821) );
  OAI22XL U1235 ( .A0(n2017), .A1(n2062), .B0(n2070), .B1(n1884), .Y(n194) );
  CLKBUFX3 U1236 ( .A(n1885), .Y(n1985) );
  OAI22XL U1237 ( .A0(n1981), .A1(n2076), .B0(n1970), .B1(n2027), .Y(n228) );
  OAI22XL U1238 ( .A0(n1981), .A1(n2075), .B0(n1970), .B1(n2026), .Y(n221) );
  OAI22XL U1239 ( .A0(n2016), .A1(n2078), .B0(n2073), .B1(n1985), .Y(n183) );
  OAI22XL U1240 ( .A0(n2016), .A1(n2024), .B0(n2076), .B1(n1985), .Y(n188) );
  OAI22XL U1241 ( .A0(n2016), .A1(n2023), .B0(n2075), .B1(n1985), .Y(n181) );
  OAI22XL U1242 ( .A0(n2013), .A1(n2079), .B0(n2073), .B1(n1982), .Y(n159) );
  OAI22XL U1243 ( .A0(n2013), .A1(n2051), .B0(n2076), .B1(n1982), .Y(n164) );
  OAI22XL U1244 ( .A0(n2013), .A1(n2087), .B0(n2072), .B1(n1982), .Y(n160) );
  OAI22XL U1245 ( .A0(n2014), .A1(n2081), .B0(n2073), .B1(n1984), .Y(n175) );
  OAI22XL U1246 ( .A0(n2011), .A1(n2080), .B0(n2073), .B1(n1983), .Y(n167) );
  OAI22XL U1247 ( .A0(n2018), .A1(n2088), .B0(n2069), .B1(n1986), .Y(n203) );
  CLKBUFX3 U1248 ( .A(n1883), .Y(n1986) );
  NAND2X1 U1249 ( .A(n1850), .B(n2066), .Y(n1883) );
  CLKBUFX3 U1250 ( .A(n1880), .Y(n1988) );
  NAND2X1 U1251 ( .A(n1849), .B(n2066), .Y(n1880) );
  OAI22XL U1252 ( .A0(n2003), .A1(n2050), .B0(n2075), .B1(n1988), .Y(n213) );
  OAI22XL U1253 ( .A0(n2003), .A1(n2049), .B0(n2076), .B1(n1988), .Y(n220) );
  OAI22XL U1254 ( .A0(n2003), .A1(n2048), .B0(n2069), .B1(n1988), .Y(n219) );
  NOR2X1 U1255 ( .A(n1971), .B(n2020), .Y(N389) );
  NOR2X1 U1256 ( .A(n1971), .B(n2000), .Y(N387) );
  NOR2X1 U1257 ( .A(n1971), .B(n2001), .Y(N388) );
  NOR2X1 U1258 ( .A(n1971), .B(n2002), .Y(N390) );
  OAI22XL U1259 ( .A0(n1981), .A1(n2071), .B0(n1970), .B1(n2042), .Y(n225) );
  OAI22XL U1260 ( .A0(n1981), .A1(n2070), .B0(n1970), .B1(n2041), .Y(n226) );
  OAI22XL U1261 ( .A0(n2016), .A1(n2054), .B0(n2071), .B1(n1985), .Y(n185) );
  OAI22XL U1262 ( .A0(n2013), .A1(n2052), .B0(n2074), .B1(n1982), .Y(n158) );
  OAI22XL U1263 ( .A0(n2013), .A1(n2057), .B0(n2075), .B1(n1982), .Y(n157) );
  OAI22XL U1264 ( .A0(n2016), .A1(n2039), .B0(n2070), .B1(n1985), .Y(n186) );
  OAI22XL U1265 ( .A0(n2013), .A1(n2040), .B0(n2070), .B1(n1982), .Y(n162) );
  OAI22XL U1266 ( .A0(n2011), .A1(n2063), .B0(n2070), .B1(n1983), .Y(n170) );
  OAI22XL U1267 ( .A0(n2011), .A1(n2058), .B0(n2075), .B1(n1983), .Y(n165) );
  OAI22XL U1268 ( .A0(n2014), .A1(n2056), .B0(n2075), .B1(n1984), .Y(n173) );
  OAI22XL U1269 ( .A0(n2011), .A1(n2053), .B0(n2076), .B1(n1983), .Y(n172) );
  OAI22XL U1270 ( .A0(n2014), .A1(n2046), .B0(n2074), .B1(n1984), .Y(n174) );
  OAI22XL U1271 ( .A0(n2014), .A1(n2044), .B0(n2071), .B1(n1984), .Y(n177) );
  OAI22XL U1272 ( .A0(n2011), .A1(n2035), .B0(n2071), .B1(n1983), .Y(n169) );
  OAI22XL U1273 ( .A0(n2014), .A1(n2033), .B0(n2076), .B1(n1984), .Y(n180) );
  OAI22XL U1274 ( .A0(n2018), .A1(n2059), .B0(n2075), .B1(n1986), .Y(n197) );
  OAI22XL U1275 ( .A0(n2018), .A1(n2047), .B0(n2074), .B1(n1986), .Y(n198) );
  OAI22XL U1276 ( .A0(n2018), .A1(n2045), .B0(n2071), .B1(n1986), .Y(n201) );
  OAI22XL U1277 ( .A0(n2018), .A1(n2037), .B0(n2070), .B1(n1986), .Y(n202) );
  OAI22XL U1278 ( .A0(n2018), .A1(n2034), .B0(n2076), .B1(n1986), .Y(n204) );
  OAI22XL U1279 ( .A0(n2003), .A1(n2055), .B0(n2071), .B1(n1988), .Y(n217) );
  OAI22XL U1280 ( .A0(n2003), .A1(n2064), .B0(n2070), .B1(n1988), .Y(n218) );
  OAI22XL U1281 ( .A0(n2009), .A1(n2060), .B0(n2075), .B1(n1987), .Y(n205) );
  OAI22XL U1282 ( .A0(n2009), .A1(n2043), .B0(n2071), .B1(n1987), .Y(n209) );
  OAI22XL U1283 ( .A0(n2009), .A1(n2038), .B0(n2070), .B1(n1987), .Y(n210) );
  OAI22XL U1284 ( .A0(n2009), .A1(n2036), .B0(n2076), .B1(n1987), .Y(n212) );
  OAI21XL U1285 ( .A0(n1813), .A1(n1818), .B0(n1819), .Y(n257) );
  OAI21XL U1286 ( .A0(n2065), .A1(n2008), .B0(n1915), .Y(n1819) );
  NAND2X2 U1287 ( .A(n1974), .B(n2025), .Y(n1727) );
  ADDHXL U1288 ( .A(N396), .B(\add_103_aco/carry [4]), .CO(
        \add_103_aco/carry [5]), .S(N90) );
  NOR2X1 U1289 ( .A(n1822), .B(n2021), .Y(N396) );
  ADDHXL U1290 ( .A(N395), .B(\add_103_aco/n2 ), .CO(\add_103_aco/carry [4]), 
        .S(N89) );
  NOR2X1 U1291 ( .A(n1822), .B(n1993), .Y(N395) );
  AND2X2 U1292 ( .A(N394), .B(\add_103_aco/carry [2]), .Y(\add_103_aco/n2 ) );
  ADDHXL U1293 ( .A(N397), .B(\add_103_aco/carry [5]), .CO(
        \add_103_aco/carry [6]), .S(N91) );
  NOR2X1 U1294 ( .A(n1822), .B(n2061), .Y(N397) );
  NOR2X1 U1295 ( .A(n1822), .B(n2031), .Y(N394) );
  NAND2X2 U1296 ( .A(n2029), .B(n2030), .Y(n1717) );
  INVX3 U1297 ( .A(n1991), .Y(n2030) );
  NOR2X2 U1298 ( .A(n2029), .B(n2030), .Y(n1718) );
  NAND3X1 U1299 ( .A(n2031), .B(n1995), .C(n2028), .Y(n1866) );
  NAND3X1 U1300 ( .A(n2002), .B(n2020), .C(n1997), .Y(n1832) );
  NOR2X1 U1301 ( .A(n2022), .B(n1915), .Y(n1882) );
  NOR3X1 U1302 ( .A(n1852), .B(n1850), .C(n1854), .Y(n1876) );
  NAND3X1 U1303 ( .A(n2019), .B(n1947), .C(n1882), .Y(n1818) );
  NOR2BX1 U1304 ( .AN(n1878), .B(n2019), .Y(n1851) );
  NAND2X1 U1305 ( .A(n1878), .B(n2019), .Y(n1875) );
  CLKINVX1 U1306 ( .A(n1874), .Y(n2015) );
  NAND2X1 U1307 ( .A(N169), .B(n2006), .Y(n1855) );
  AOI22XL U1308 ( .A0(N168), .A1(n2006), .B0(gray_addr[5]), .B1(n1813), .Y(
        n1860) );
  AOI22XL U1309 ( .A0(N201), .A1(n2004), .B0(gray_addr[10]), .B1(n1813), .Y(
        n1840) );
  OAI211XL U1310 ( .A0(n1861), .A1(n2021), .B0(n1859), .C0(n1862), .Y(n232) );
  AOI22XL U1311 ( .A0(N167), .A1(n2006), .B0(gray_addr[4]), .B1(n1813), .Y(
        n1862) );
  AOI22XL U1312 ( .A0(N200), .A1(n2004), .B0(n1813), .B1(gray_addr[9]), .Y(
        n1843) );
  OAI221XL U1313 ( .A0(n1867), .A1(n2031), .B0(n1914), .B1(n1866), .C0(n1868), 
        .Y(n230) );
  AOI22XL U1314 ( .A0(N165), .A1(n2006), .B0(gray_addr[2]), .B1(n1813), .Y(
        n1868) );
  OA21XL U1315 ( .A0(n1995), .A1(n1914), .B0(n1869), .Y(n1867) );
  OAI211X1 U1316 ( .A0(n2008), .A1(n1072), .B0(n1827), .C0(n1828), .Y(n241) );
  AOI32XL U1317 ( .A0(n1996), .A1(n1931), .A2(n2005), .B0(n555), .B1(n1829), 
        .Y(n1828) );
  OAI221XL U1318 ( .A0(n1833), .A1(n2002), .B0(n1832), .B1(n1989), .C0(n1834), 
        .Y(n240) );
  AOI22XL U1319 ( .A0(N203), .A1(n2004), .B0(gray_addr[12]), .B1(n1813), .Y(
        n1834) );
  OA21XL U1320 ( .A0(n2020), .A1(n1989), .B0(n1835), .Y(n1833) );
  OAI221XL U1321 ( .A0(n560), .A1(n1844), .B0(n1845), .B1(n1999), .C0(n1846), 
        .Y(n236) );
  AOI22XL U1322 ( .A0(N199), .A1(n2004), .B0(gray_addr[8]), .B1(n1813), .Y(
        n1846) );
  AOI22XL U1323 ( .A0(N164), .A1(n2006), .B0(gray_addr[1]), .B1(n1813), .Y(
        n1871) );
  AOI22XL U1324 ( .A0(N166), .A1(n2006), .B0(gray_addr[3]), .B1(n1813), .Y(
        n1865) );
  OAI221XL U1325 ( .A0(n2028), .A1(n1824), .B0(N392), .B1(n1914), .C0(n1826), 
        .Y(n242) );
  OAI211X1 U1326 ( .A0(n1835), .A1(n2020), .B0(n1836), .C0(n1837), .Y(n239) );
  AOI22XL U1327 ( .A0(N202), .A1(n2004), .B0(gray_addr[11]), .B1(n1813), .Y(
        n1837) );
  AOI22XL U1328 ( .A0(N198), .A1(n2004), .B0(n1813), .B1(gray_addr[7]), .Y(
        n1847) );
  AO22X1 U1329 ( .A0(n2067), .A1(n563), .B0(N91), .B1(n1821), .Y(n251) );
  AO22X1 U1330 ( .A0(n2067), .A1(n567), .B0(N87), .B1(n1821), .Y(n255) );
  AO22X1 U1331 ( .A0(n2067), .A1(n565), .B0(N89), .B1(n1821), .Y(n253) );
  AO22XL U1332 ( .A0(N392), .A1(n2067), .B0(N86), .B1(n1821), .Y(n256) );
  INVXL U1333 ( .A(N392), .Y(N86) );
  AO22X1 U1334 ( .A0(n2067), .A1(n566), .B0(N88), .B1(n1821), .Y(n254) );
  XOR2X1 U1335 ( .A(N394), .B(\add_103_aco/carry [2]), .Y(N88) );
  AO22X1 U1336 ( .A0(n2067), .A1(n562), .B0(N92), .B1(n1821), .Y(n250) );
  XOR2X1 U1337 ( .A(\add_103_aco/carry [6]), .B(N398), .Y(N92) );
  NOR2X1 U1338 ( .A(n1822), .B(n2032), .Y(N398) );
  AOI2BB1X1 U1339 ( .A0N(n1900), .A1N(n1813), .B0(n2065), .Y(n1814) );
  OAI2BB1X1 U1340 ( .A0N(n1816), .A1N(n1947), .B0(n1817), .Y(n258) );
  NAND4X1 U1341 ( .A(n2008), .B(n335), .C(n1900), .D(n2019), .Y(n1817) );
  OAI21XL U1342 ( .A0(n2019), .A1(n1813), .B0(n1814), .Y(n1816) );
  AO22X1 U1343 ( .A0(n2067), .A1(lbp_addr[4]), .B0(N90), .B1(n1821), .Y(n252)
         );
  OAI32X1 U1344 ( .A0(n1813), .A1(n2022), .A2(n2019), .B0(n328), .B1(n1814), 
        .Y(n260) );
  AO22X1 U1345 ( .A0(gray_data[7]), .A1(n2016), .B0(n1985), .B1(\thresh[3][7] ), .Y(n187) );
  AO22X1 U1346 ( .A0(gray_data[7]), .A1(n2014), .B0(n1984), .B1(\thresh[2][7] ), .Y(n179) );
  OAI22XL U1347 ( .A0(n1053), .A1(n2016), .B0(n2074), .B1(n1985), .Y(n182) );
  CLKBUFX3 U1348 ( .A(n1879), .Y(n1981) );
  NOR3X1 U1349 ( .A(n2019), .B(n389), .C(n2022), .Y(n1889) );
  OAI22XL U1350 ( .A0(n1057), .A1(n2011), .B0(n2074), .B1(n1983), .Y(n166) );
  OAI22XL U1351 ( .A0(n1225), .A1(n2014), .B0(n2070), .B1(n1984), .Y(n178) );
  AO22X1 U1352 ( .A0(gray_data[2]), .A1(n2003), .B0(n1988), .B1(\thresh[7][2] ), .Y(n214) );
  AO22X1 U1353 ( .A0(n1970), .A1(gray_data[7]), .B0(n1981), .B1(n1209), .Y(
        n227) );
  AO22X1 U1354 ( .A0(n1970), .A1(gray_data[2]), .B0(n1981), .B1(n1197), .Y(
        n222) );
  OAI2BB2XL U1355 ( .B0(n2074), .B1(n1884), .A0N(n1884), .A1N(n1195), .Y(n190)
         );
  AO22X1 U1356 ( .A0(gray_data[7]), .A1(n2013), .B0(n1982), .B1(n1211), .Y(
        n163) );
  AO22X1 U1357 ( .A0(gray_data[2]), .A1(n2009), .B0(n1987), .B1(\thresh[6][2] ), .Y(n206) );
  AO22X1 U1358 ( .A0(gray_data[7]), .A1(n2011), .B0(n1983), .B1(n1208), .Y(
        n171) );
  AO22X1 U1359 ( .A0(gray_data[7]), .A1(n2009), .B0(n1987), .B1(n1210), .Y(
        n211) );
  OAI2BB2XL U1360 ( .B0(n1981), .B1(n2073), .A0N(n1981), .A1N(\thresh[8][3] ), 
        .Y(n223) );
  OAI2BB2XL U1361 ( .B0(n1981), .B1(n2072), .A0N(n1981), .A1N(\thresh[8][4] ), 
        .Y(n224) );
  OAI2BB2XL U1362 ( .B0(n2073), .B1(n1986), .A0N(n1986), .A1N(\thresh[5][3] ), 
        .Y(n199) );
  OAI2BB2XL U1363 ( .B0(n2073), .B1(n1988), .A0N(n1988), .A1N(\thresh[7][3] ), 
        .Y(n215) );
  OAI2BB2XL U1364 ( .B0(n2072), .B1(n1986), .A0N(n1986), .A1N(\thresh[5][4] ), 
        .Y(n200) );
  OAI2BB2XL U1365 ( .B0(n2072), .B1(n1988), .A0N(n1988), .A1N(\thresh[7][4] ), 
        .Y(n216) );
  OAI2BB2XL U1366 ( .B0(n2072), .B1(n1985), .A0N(n1985), .A1N(\thresh[3][4] ), 
        .Y(n184) );
  OAI2BB2XL U1367 ( .B0(n2071), .B1(n1982), .A0N(n1982), .A1N(\thresh[0][5] ), 
        .Y(n161) );
  OAI2BB2XL U1368 ( .B0(n2073), .B1(n1987), .A0N(n1987), .A1N(\thresh[6][3] ), 
        .Y(n207) );
  OAI2BB2XL U1369 ( .B0(n2072), .B1(n1987), .A0N(n1987), .A1N(n1215), .Y(n208)
         );
  OAI2BB2XL U1370 ( .B0(n2072), .B1(n1983), .A0N(n1983), .A1N(n1217), .Y(n168)
         );
  OAI2BB2XL U1371 ( .B0(n2072), .B1(n1984), .A0N(n1984), .A1N(n1213), .Y(n176)
         );
  OAI22XL U1372 ( .A0(n1900), .A1(n1813), .B0(n2022), .B1(n1815), .Y(n259) );
  NOR4X1 U1373 ( .A(nextState[1]), .B(nextState[0]), .C(n1823), .D(n1929), .Y(
        N295) );
  INVX3 U1374 ( .A(gray_data[3]), .Y(n2073) );
  NOR2X1 U1375 ( .A(n2077), .B(n1789), .Y(n1788) );
  OAI21XL U1376 ( .A0(n1045), .A1(n2037), .B0(n1790), .Y(n1789) );
  OAI22XL U1377 ( .A0(n1791), .A1(n1792), .B0(n1163), .B1(n2062), .Y(n1790) );
  AOI211X1 U1378 ( .A0(n1794), .A1(n1990), .B0(n1795), .C0(n1796), .Y(n1791)
         );
  OAI22XL U1379 ( .A0(\thresh[5][4] ), .A1(n2029), .B0(n1168), .B1(n2030), .Y(
        n1795) );
  AOI2BB1X1 U1380 ( .A0N(n1990), .A1N(n1794), .B0(\thresh[5][3] ), .Y(n1796)
         );
  OA21XL U1381 ( .A0(n1797), .A1(n2047), .B0(n1798), .Y(n1794) );
  OAI21XL U1382 ( .A0(n1221), .A1(n1725), .B0(n1799), .Y(n1797) );
  OAI211X1 U1383 ( .A0(\thresh[4][1] ), .A1(n2034), .B0(n1727), .C0(n2059), 
        .Y(n1799) );
  AO21X1 U1384 ( .A0(n1797), .A1(n2047), .B0(n1195), .Y(n1798) );
  CLKINVX1 U1385 ( .A(gray_data[7]), .Y(n2069) );
  NOR2X1 U1386 ( .A(n1210), .B(n1801), .Y(n1800) );
  OAI21XL U1387 ( .A0(n1045), .A1(n2038), .B0(n1802), .Y(n1801) );
  OAI22XL U1388 ( .A0(n1803), .A1(n1804), .B0(n1189), .B1(n2062), .Y(n1802) );
  NOR2X1 U1389 ( .A(n1209), .B(n1729), .Y(n1728) );
  OAI21XL U1390 ( .A0(n1045), .A1(n2041), .B0(n1730), .Y(n1729) );
  OAI22XL U1391 ( .A0(n1731), .A1(n1732), .B0(n1191), .B1(n2062), .Y(n1730) );
  AOI211X1 U1392 ( .A0(n1806), .A1(n1990), .B0(n1807), .C0(n1808), .Y(n1803)
         );
  OAI22XL U1393 ( .A0(n1215), .A1(n2029), .B0(n1169), .B1(n2030), .Y(n1807) );
  AOI2BB1X1 U1394 ( .A0N(n1990), .A1N(n1806), .B0(\thresh[6][3] ), .Y(n1808)
         );
  OA21XL U1395 ( .A0(n1195), .A1(n1809), .B0(n1810), .Y(n1806) );
  AOI211X1 U1396 ( .A0(n1734), .A1(n1990), .B0(n1735), .C0(n1736), .Y(n1731)
         );
  OAI22XL U1397 ( .A0(\thresh[8][4] ), .A1(n2029), .B0(n1175), .B1(n2030), .Y(
        n1735) );
  AOI2BB1X1 U1398 ( .A0N(n1990), .A1N(n1734), .B0(\thresh[8][3] ), .Y(n1736)
         );
  OA21XL U1399 ( .A0(n1195), .A1(n1737), .B0(n1738), .Y(n1734) );
  OAI21XL U1400 ( .A0(n1222), .A1(n1725), .B0(n1811), .Y(n1809) );
  OAI211X1 U1401 ( .A0(\thresh[4][1] ), .A1(n2036), .B0(n1727), .C0(n2060), 
        .Y(n1811) );
  OAI21XL U1402 ( .A0(\thresh[8][0] ), .A1(n1725), .B0(n1739), .Y(n1737) );
  OAI211X1 U1403 ( .A0(\thresh[4][1] ), .A1(n2027), .B0(n1727), .C0(n2026), 
        .Y(n1739) );
  OAI2BB1X1 U1404 ( .A0N(n1809), .A1N(n1195), .B0(\thresh[6][2] ), .Y(n1810)
         );
  OAI2BB1X1 U1405 ( .A0N(n1737), .A1N(n1195), .B0(n1197), .Y(n1738) );
  NOR2X1 U1406 ( .A(\thresh[2][7] ), .B(n1765), .Y(n1764) );
  OAI21XL U1407 ( .A0(n1225), .A1(n1045), .B0(n1766), .Y(n1765) );
  OAI2BB2XL U1408 ( .B0(n1767), .B1(n1768), .A0N(n1045), .A1N(n1225), .Y(n1766) );
  AOI211X1 U1409 ( .A0(n1770), .A1(n2081), .B0(n1771), .C0(n1772), .Y(n1767)
         );
  OAI22XL U1410 ( .A0(n1213), .A1(n2029), .B0(n1170), .B1(n2030), .Y(n1771) );
  OA21XL U1411 ( .A0(n2081), .A1(n1770), .B0(n1990), .Y(n1772) );
  OA21XL U1412 ( .A0(n1773), .A1(n2046), .B0(n1774), .Y(n1770) );
  OAI21XL U1413 ( .A0(n1219), .A1(n1725), .B0(n1775), .Y(n1773) );
  OAI211X1 U1414 ( .A0(\thresh[4][1] ), .A1(n2033), .B0(n1727), .C0(n2056), 
        .Y(n1775) );
  AO21X1 U1415 ( .A0(n1773), .A1(n2046), .B0(n1195), .Y(n1774) );
  NOR2X1 U1416 ( .A(n1713), .B(n2077), .Y(n1712) );
  OAI21XL U1417 ( .A0(n1045), .A1(n2064), .B0(n1714), .Y(n1713) );
  OAI22XL U1418 ( .A0(n1715), .A1(n1716), .B0(n1043), .B1(n2062), .Y(n1714) );
  AOI211X1 U1419 ( .A0(n1990), .A1(n1720), .B0(n1721), .C0(n1722), .Y(n1715)
         );
  OAI22XL U1420 ( .A0(\thresh[7][4] ), .A1(n2029), .B0(n1184), .B1(n2030), .Y(
        n1721) );
  AOI2BB1X1 U1421 ( .A0N(n1990), .A1N(n1720), .B0(\thresh[7][3] ), .Y(n1722)
         );
  OA21XL U1422 ( .A0(n1195), .A1(n1723), .B0(n1724), .Y(n1720) );
  OAI21XL U1423 ( .A0(n1897), .A1(n1725), .B0(n1726), .Y(n1723) );
  OAI211X1 U1424 ( .A0(\thresh[4][1] ), .A1(n2049), .B0(n1727), .C0(n2050), 
        .Y(n1726) );
  OAI2BB1X1 U1425 ( .A0N(n1723), .A1N(n1195), .B0(\thresh[7][2] ), .Y(n1724)
         );
  INVX3 U1426 ( .A(gray_data[4]), .Y(n2072) );
  INVX3 U1427 ( .A(gray_data[5]), .Y(n2071) );
  INVX3 U1428 ( .A(gray_data[0]), .Y(n2076) );
  INVX3 U1429 ( .A(gray_data[1]), .Y(n2075) );
  INVX3 U1430 ( .A(gray_data[6]), .Y(n2070) );
  CLKINVX1 U1431 ( .A(\thresh[4][0] ), .Y(n2025) );
  NAND2X2 U1432 ( .A(\thresh[4][1] ), .B(\thresh[4][0] ), .Y(n1725) );
  CLKINVX1 U1433 ( .A(\thresh[8][0] ), .Y(n2027) );
  CLKINVX1 U1434 ( .A(n1897), .Y(n2049) );
  CLKINVX1 U1435 ( .A(\thresh[8][1] ), .Y(n2026) );
  CLKINVX1 U1436 ( .A(\thresh[7][1] ), .Y(n2050) );
  AND4X2 U1437 ( .A(n566), .B(n565), .C(n567), .D(n1895), .Y(n1822) );
  NOR4XL U1438 ( .A(N392), .B(n2032), .C(n2061), .D(n2021), .Y(n1895) );
  ADDHXL U1439 ( .A(N393), .B(N392), .CO(\add_103_aco/carry [2]), .S(N87) );
  NOR2X1 U1440 ( .A(n1822), .B(n1995), .Y(N393) );
  AOI211X1 U1441 ( .A0(n1717), .A1(n2043), .B0(n1718), .C0(n1805), .Y(n1804)
         );
  AOI2BB1X1 U1442 ( .A0N(n1991), .A1N(n2043), .B0(n1215), .Y(n1805) );
  AOI211X1 U1443 ( .A0(n1717), .A1(n2042), .B0(n1718), .C0(n1733), .Y(n1732)
         );
  AOI2BB1X1 U1444 ( .A0N(n1991), .A1N(n2042), .B0(\thresh[8][4] ), .Y(n1733)
         );
  CLKBUFX3 U1445 ( .A(\thresh[4][5] ), .Y(n1991) );
  AOI211X1 U1446 ( .A0(n1717), .A1(n2045), .B0(n1718), .C0(n1793), .Y(n1792)
         );
  AOI2BB1X1 U1447 ( .A0N(n1991), .A1N(n2045), .B0(\thresh[5][4] ), .Y(n1793)
         );
  AOI211X1 U1448 ( .A0(n1717), .A1(n2055), .B0(n1718), .C0(n1719), .Y(n1716)
         );
  AOI2BB1X1 U1449 ( .A0N(n1991), .A1N(n2055), .B0(\thresh[7][4] ), .Y(n1719)
         );
  AOI211X1 U1450 ( .A0(n1717), .A1(n2044), .B0(n1718), .C0(n1769), .Y(n1768)
         );
  AOI2BB1X1 U1451 ( .A0N(n1991), .A1N(n2044), .B0(n1213), .Y(n1769) );
  INVX3 U1452 ( .A(\thresh[4][4] ), .Y(n2029) );
  OAI21XL U1453 ( .A0(n1211), .A1(n1740), .B0(n2077), .Y(n1741) );
  OAI21XL U1454 ( .A0(n1045), .A1(n2040), .B0(n1742), .Y(n1740) );
  OAI22XL U1455 ( .A0(n1743), .A1(n1744), .B0(n1192), .B1(n2062), .Y(n1742) );
  AOI211X1 U1456 ( .A0(n1746), .A1(n2079), .B0(n1747), .C0(n1748), .Y(n1743)
         );
  OAI22XL U1457 ( .A0(\thresh[0][5] ), .A1(n2030), .B0(\thresh[0][4] ), .B1(
        n2029), .Y(n1747) );
  OA21XL U1458 ( .A0(n2079), .A1(n1746), .B0(n1990), .Y(n1748) );
  OA21XL U1459 ( .A0(n1749), .A1(n2052), .B0(n1750), .Y(n1746) );
  OAI21XL U1460 ( .A0(n1898), .A1(n1725), .B0(n1751), .Y(n1749) );
  AO21X1 U1461 ( .A0(n1749), .A1(n2052), .B0(n1195), .Y(n1750) );
  OAI21XL U1462 ( .A0(n1208), .A1(n1752), .B0(n2077), .Y(n1753) );
  OAI21XL U1463 ( .A0(n1045), .A1(n2063), .B0(n1754), .Y(n1752) );
  OAI22XL U1464 ( .A0(n1755), .A1(n1756), .B0(n1165), .B1(n2062), .Y(n1754) );
  OAI21XL U1465 ( .A0(\thresh[3][7] ), .A1(n1776), .B0(n2077), .Y(n1777) );
  OAI21XL U1466 ( .A0(n1045), .A1(n2039), .B0(n1778), .Y(n1776) );
  OAI22XL U1467 ( .A0(n1779), .A1(n1780), .B0(n1190), .B1(n2062), .Y(n1778) );
  AOI211X1 U1468 ( .A0(n1758), .A1(n2080), .B0(n1759), .C0(n1760), .Y(n1755)
         );
  OAI22XL U1469 ( .A0(n1217), .A1(n2029), .B0(n1167), .B1(n2030), .Y(n1759) );
  OA21XL U1470 ( .A0(n2080), .A1(n1758), .B0(n1990), .Y(n1760) );
  OA21XL U1471 ( .A0(n1057), .A1(n1761), .B0(n1762), .Y(n1758) );
  AOI211X1 U1472 ( .A0(n1782), .A1(n2078), .B0(n1783), .C0(n1784), .Y(n1779)
         );
  OAI22XL U1473 ( .A0(\thresh[3][4] ), .A1(n2029), .B0(n1186), .B1(n2030), .Y(
        n1783) );
  OA21XL U1474 ( .A0(n2078), .A1(n1782), .B0(n1990), .Y(n1784) );
  OA21XL U1475 ( .A0(n1053), .A1(n1785), .B0(n1786), .Y(n1782) );
  OAI21XL U1476 ( .A0(n1220), .A1(n1725), .B0(n1763), .Y(n1761) );
  OAI21XL U1477 ( .A0(n1896), .A1(n1725), .B0(n1787), .Y(n1785) );
  AO21X1 U1478 ( .A0(n1761), .A1(n1057), .B0(n1195), .Y(n1762) );
  AO21X1 U1479 ( .A0(n1785), .A1(n1053), .B0(n1195), .Y(n1786) );
  CLKBUFX3 U1480 ( .A(\thresh[4][3] ), .Y(n1990) );
  CLKINVX1 U1481 ( .A(\thresh[2][3] ), .Y(n2081) );
  CLKINVX1 U1482 ( .A(n1898), .Y(n2051) );
  CLKINVX1 U1483 ( .A(n1896), .Y(n2024) );
  INVX3 U1484 ( .A(n1045), .Y(n2062) );
  CLKINVX1 U1485 ( .A(\thresh[3][1] ), .Y(n2023) );
  AOI211X1 U1486 ( .A0(n1991), .A1(n2087), .B0(n1718), .C0(n1745), .Y(n1744)
         );
  AOI2BB1X1 U1487 ( .A0N(n2087), .A1N(n1717), .B0(\thresh[0][5] ), .Y(n1745)
         );
  AOI211X1 U1488 ( .A0(n1717), .A1(n2035), .B0(n1718), .C0(n1757), .Y(n1756)
         );
  AOI2BB1X1 U1489 ( .A0N(n1991), .A1N(n2035), .B0(n1217), .Y(n1757) );
  AOI211X1 U1490 ( .A0(n1717), .A1(n2054), .B0(n1718), .C0(n1781), .Y(n1780)
         );
  AOI2BB1X1 U1491 ( .A0N(n1991), .A1N(n2054), .B0(\thresh[3][4] ), .Y(n1781)
         );
  NOR3X1 U1492 ( .A(n1915), .B(n1900), .C(n1947), .Y(n1878) );
  CLKINVX1 U1493 ( .A(\thresh[5][7] ), .Y(n2088) );
  CLKINVX1 U1494 ( .A(\thresh[7][7] ), .Y(n2048) );
  CLKINVX1 U1495 ( .A(\thresh[0][4] ), .Y(n2087) );
  CLKINVX1 U1496 ( .A(\thresh[0][3] ), .Y(n2079) );
  CLKINVX1 U1497 ( .A(\thresh[1][3] ), .Y(n2080) );
  CLKINVX1 U1498 ( .A(\thresh[3][3] ), .Y(n2078) );
  NAND3X1 U1499 ( .A(n1882), .B(n2019), .C(n335), .Y(n1874) );
  INVX1 U1500 ( .A(N392), .Y(n2028) );
  NAND3X1 U1501 ( .A(n2085), .B(n2086), .C(state[2]), .Y(n1891) );
  NAND3X1 U1502 ( .A(n2085), .B(n2083), .C(state[1]), .Y(n1812) );
  NAND4XL U1503 ( .A(n1822), .B(lbp_addr[10]), .C(n1893), .D(n1894), .Y(n1890)
         );
  NOR2X1 U1504 ( .A(n1999), .B(n2000), .Y(n1893) );
  NOR4XL U1505 ( .A(lbp_addr[7]), .B(n2020), .C(n1931), .D(n2002), .Y(n1894)
         );
  OAI32X1 U1506 ( .A0(n2085), .A1(state[2]), .A2(state[1]), .B0(n1812), .B1(
        n1930), .Y(n1561) );
  OAI22XL U1507 ( .A0(n1899), .A1(n1812), .B0(n1890), .B1(n1891), .Y(N70) );
  NAND2X1 U1508 ( .A(n1891), .B(n1892), .Y(N68) );
  NAND3X1 U1509 ( .A(n2085), .B(n2086), .C(gray_ready), .Y(n1892) );
  OAI31X1 U1510 ( .A0(n1916), .A1(nextState[2]), .A2(nextState[1]), .B0(n2068), 
        .Y(n1823) );
endmodule

