///scr_mov
//função de movimento
scr_input(); //chama função de entrada
//função para movimento
//Alterando a velocidade
//vefificando o movimento 
// se esta pressionando duas teclas ao mesmo tempo, ela para, ou seja, cancela.

if(andando or correndo){
     //o "-" está sendo usado matematicamente devido a caracteristica booleanica das checagens de teclado
     //estas checagens estão nas variaveis de moviemento (andando, correndo, direita, esq, etc)
    vel = abs((andando*andando_vel) - (correndo * correndo_vel)); // abs = absolute value, ou seja, o valor absoluto 
}else{
    vel = normal_vel;}
//Resetando as variáveis de movimento
movX = 0;
movY =0;


//Movimento pretendido

movY = ((pbaixo - pcima) * vel);

if (movY == 0) { 
movX = (direita - esquerda)* vel;}

//Checagem de colisões
//Horizontal
if (movX !=0){
if(place_meeting(x+ movX,y, pai_colisao)){
   repeat(abs(movX)){
   if(!place_meeting(x + sign(movX), y, pai_colisao)){ x += sign(movX);}
   else{ break;}
   }
   movX = 0;
}}

//Vertical
if (movY !=0){
if(place_meeting(x,y + movY, pai_colisao)){
   repeat(abs(movY)){
   if(!place_meeting(x, y + sign(movY), pai_colisao)){ y += sign(movY);}
   else{ break;}
   }
   movY = 0;

}
}


//Aplicando o movimento
x += movX;
y += movY;





///controle da animação de acordo com a entrada
// para esquerda
if(esquerda){
sprite_index = spr_playermov_left;
image_speed=.2;
}
//para direita
if(direita){
sprite_index = spr_playermov_right;
image_speed=.2;
}
// para cima
if(pcima){
sprite_index = spr_playermov_up;
image_speed=.2;
}
//para baixo
if(pbaixo){
sprite_index = spr_playermov_down;
image_speed=.2;
}
//parado
if (!esquerda and !direita and !pcima and !pbaixo){
image_speed = 0;
image_index = 0;}

