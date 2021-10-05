///check_colisao
//Checagem de colisões
//Horizontal
if (movX !=0){
if(place_meeting(x+ movX,y, pai_colisao)){
   repeat(abs(movX)){
   if(!place_meeting(x + sign(movX), y, pai_colisao)){ x += sign(movX);}
   else{ break;}
   }
   movX = 0;
}
}
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
