///scr_definindo_caixa_de_dialogo


//outter box properties (white)
superficie = 50; // padding on x axis between box and window
largura = window_get_width() - (superficie * 2);
altura = 200;
xorigin = superficie;
yorigin = 10;

//inner box properties (black)
bordatam = 20;
largura_interna = largura - bordatam;
altura_interna = altura - bordatam;
xorigin_interna = xorigin + (bordatam / 2);
yorigin_interna = yorigin + (bordatam / 2);

//dialog display properties
avatarScale = 2;
avatar_xorigin = xorigin_interna + 15;
avatar_yorigin = yorigin_interna + 20;

text_xorigin = avatar_xorigin + 150;
text_yorigin = yorigin_interna + 25;


for(i=0; i<100; i++){
   dialog[i,0] = -1; //sprite index
   dialog[i,1] = " "; //conv dialog
}

active = false;
convoDialogCount = 0;
convoIndex = 0;
spriteToDisplay = -1; //avatar
stringToDisplay = ""; //conversation line
currCharIndex = 1; 
