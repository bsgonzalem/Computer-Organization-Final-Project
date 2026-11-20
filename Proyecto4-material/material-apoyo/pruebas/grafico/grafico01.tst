// grafico01: Celda (0, 0): esquina superior izquierda
load,
output-file grafico01.out,
compare-to grafico01.cmp,
set RAM[16382] 1,
set RAM[16383] 0,
while RAM[16383] = 0 { vmstep; }
output-list RAM[16383]%D1.6.1 RAM[16300]%D1.6.1 RAM[16301]%D1.6.1 RAM[16302]%D1.6.1 RAM[16303]%D1.6.1 RAM[16304]%D1.6.1 RAM[16305]%D1.6.1 RAM[16306]%D1.6.1 RAM[16307]%D1.6.1 RAM[16308]%D1.6.1 RAM[16309]%D1.6.1 RAM[16310]%D1.6.1 RAM[16311]%D1.6.1 RAM[16312]%D1.6.1 RAM[16313]%D1.6.1 RAM[16314]%D1.6.1;
output;
output-list RAM[16315]%D1.6.1 RAM[16316]%D1.6.1 RAM[16317]%D1.6.1 RAM[16318]%D1.6.1 RAM[16319]%D1.6.1 RAM[16320]%D1.6.1;
output;
