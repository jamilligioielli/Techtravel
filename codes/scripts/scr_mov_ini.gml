///scr_mov_ini
movX = 0;
movY =0;

//Movimento pretendido
temp_mov = tam_grid;
movY += vel;

if (movY == 0) { 
temp_mov = tam_grid;
movX = (direita - esquerda)* vel;}
