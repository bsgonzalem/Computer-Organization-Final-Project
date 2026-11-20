// carrera16: La parte trasera de un camion tambien choca
load,
output-file carrera16.out,
compare-to carrera16.cmp,
set RAM[16382] 16,
set RAM[16383] 0,
while RAM[16383] = 0 { vmstep; }
output-list RAM[16383]%D1.6.1 RAM[16300]%D1.6.1 RAM[16301]%D1.6.1 RAM[16302]%D1.6.1;
output;
