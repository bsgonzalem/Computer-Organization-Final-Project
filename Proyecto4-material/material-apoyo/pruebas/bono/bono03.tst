// bono03: Aleatorio: semilla 1 y semilla -3
load,
output-file bono03.out,
compare-to bono03.cmp,
set RAM[16382] 3,
set RAM[16383] 0,
while RAM[16383] = 0 { vmstep; }
output-list RAM[16383]%D1.6.1 RAM[16300]%D1.6.1 RAM[16301]%D1.6.1 RAM[16302]%D1.6.1 RAM[16303]%D1.6.1 RAM[16304]%D1.6.1 RAM[16305]%D1.6.1 RAM[16306]%D1.6.1 RAM[16307]%D1.6.1 RAM[16308]%D1.6.1;
output;
