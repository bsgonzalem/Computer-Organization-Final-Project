// carrera08: Una moto que salta sobre el carro tambien choca
load,
output-file carrera08.out,
compare-to carrera08.cmp,
set RAM[16382] 8,
set RAM[16383] 0,
while RAM[16383] = 0 { vmstep; }
output-list RAM[16383]%D1.6.1 RAM[16300]%D1.6.1 RAM[16301]%D1.6.1;
output;
