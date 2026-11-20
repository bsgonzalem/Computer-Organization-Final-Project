// carrera11: Una moneda suma 10 puntos y no quita vidas
load,
output-file carrera11.out,
compare-to carrera11.cmp,
set RAM[16382] 11,
set RAM[16383] 0,
while RAM[16383] = 0 { vmstep; }
output-list RAM[16383]%D1.6.1 RAM[16300]%D1.6.1 RAM[16301]%D1.6.1 RAM[16302]%D1.6.1;
output;
