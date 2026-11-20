// carrera06: Una moto avanza dos celdas por paso
load,
output-file carrera06.out,
compare-to carrera06.cmp,
set RAM[16382] 6,
set RAM[16383] 0,
while RAM[16383] = 0 { vmstep; }
output-list RAM[16383]%D1.6.1 RAM[16300]%D1.6.1 RAM[16301]%D1.6.1 RAM[16302]%D1.6.1;
output;
