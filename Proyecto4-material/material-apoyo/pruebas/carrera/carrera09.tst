// carrera09: Cambiar de carril hacia un obstaculo produce choque
load,
output-file carrera09.out,
compare-to carrera09.cmp,
set RAM[16382] 9,
set RAM[16383] 0,
while RAM[16383] = 0 { vmstep; }
output-list RAM[16383]%D1.6.1 RAM[16300]%D1.6.1 RAM[16301]%D1.6.1;
output;
