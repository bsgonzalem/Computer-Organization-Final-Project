// carrera17: Generacion: 300 pasos; regla de paso libre, uno por paso, 3 carriles, 3 tipos
load,
output-file carrera17.out,
compare-to carrera17.cmp,
set RAM[16382] 17,
set RAM[16383] 0,
while RAM[16383] = 0 { vmstep; }
output-list RAM[16383]%D1.6.1 RAM[16300]%D1.6.1 RAM[16301]%D1.6.1 RAM[16302]%D1.6.1 RAM[16303]%D1.6.1 RAM[16304]%D1.6.1;
output;
