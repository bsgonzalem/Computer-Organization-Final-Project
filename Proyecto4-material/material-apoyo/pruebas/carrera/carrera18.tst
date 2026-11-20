// carrera18: Fugas de memoria: con el heap casi lleno, 800 obstaculos y 120 carreras se liberan
load,
output-file carrera18.out,
compare-to carrera18.cmp,
set RAM[16382] 18,
set RAM[16383] 0,
while RAM[16383] = 0 { vmstep; }
output-list RAM[16383]%D1.6.1 RAM[16300]%D1.6.1 RAM[16301]%D1.6.1 RAM[16302]%D1.6.1;
output;
