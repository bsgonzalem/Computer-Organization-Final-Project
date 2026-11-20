// carrera05: Un camion ocupa tres celdas; las celdas fuera de pantalla no cuentan
load,
output-file carrera05.out,
compare-to carrera05.cmp,
set RAM[16382] 5,
set RAM[16383] 0,
while RAM[16383] = 0 { vmstep; }
output-list RAM[16383]%D1.6.1 RAM[16300]%D1.6.1 RAM[16301]%D1.6.1 RAM[16302]%D1.6.1 RAM[16303]%D1.6.1 RAM[16304]%D1.6.1 RAM[16305]%D1.6.1 RAM[16306]%D1.6.1 RAM[16307]%D1.6.1 RAM[16308]%D1.6.1;
output;
