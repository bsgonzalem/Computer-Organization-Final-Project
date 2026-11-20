// bono02: desplazarFila(6)
load,
output-file bono02.out,
compare-to bono02.cmp,
set RAM[16382] 2,
set RAM[16383] 0,
while RAM[16383] = 0 { vmstep; }
output-list RAM[16383]%D1.6.1 RAM[16300]%D1.6.1 RAM[16301]%D1.6.1 RAM[16302]%D1.6.1 RAM[16303]%D1.6.1 RAM[16304]%D1.6.1 RAM[16305]%D1.6.1 RAM[16306]%D1.6.1 RAM[16307]%D1.6.1 RAM[16308]%D1.6.1 RAM[16309]%D1.6.1 RAM[16310]%D1.6.1 RAM[16311]%D1.6.1 RAM[16312]%D1.6.1 RAM[16313]%D1.6.1;
output;
