// carrera10: Cambiar de carril a tiempo esquiva el obstaculo
load,
output-file carrera10.out,
compare-to carrera10.cmp,
set RAM[16382] 10,
set RAM[16383] 0,
while RAM[16383] = 0 { vmstep; }
output-list RAM[16383]%D1.6.1 RAM[16300]%D1.6.1 RAM[16301]%D1.6.1 RAM[16302]%D1.6.1 RAM[16303]%D1.6.1;
output;
