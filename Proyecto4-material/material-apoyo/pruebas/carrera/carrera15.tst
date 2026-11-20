// carrera15: Dos choques en el mismo paso
load,
output-file carrera15.out,
compare-to carrera15.cmp,
set RAM[16382] 15,
set RAM[16383] 0,
while RAM[16383] = 0 { vmstep; }
output-list RAM[16383]%D1.6.1 RAM[16300]%D1.6.1 RAM[16301]%D1.6.1;
output;
