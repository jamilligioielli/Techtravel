

//Declarando as váriaveis

txt = argument0;
font = argument1;
key_press = argument2;
txtSpeed = argument3;
sfx = argument4;

//Normalizando a velocidade do texto
if txtSpeed <= 1 textSpeed = 1;
if txtSpeed >= 15 textSpeed = 15;

//Definindo a velocidade do texto
global.maxPrintTimer = txtSpeed;

//para medidas
draw_set_font(font);

// sample text para espaçamento
sampleTxt = "sample";
sTxt_height = string_height(sampleTxt)*2;

// armazenando o texto em uma pasta 'Cache' 
if global.txtCache == ""{
    global.txtCache = txt;
}

//Padding para o dialogo da caixa interna
var padding = 32;

//maxima altura e largura
max_width = view_wview - (padding*2);
max_height = (view_hview/2)-(.50*(view_hview/2));

// medida de texto
txt_length = string_length(txt);
txt_width = string_width(txt);

// variaveis para fixar o lygar
new_txt = "";
current_txtW = string_width(new_txt);
ntl = string_length(new_txt); // new_txt_length

//agrupa a "parede" do texto, se necessário
if (txt_width > max_width) {
    
    for (i=1; i < txt_length+1; i++)
    {
        new_txt += string_copy(txt,i,1); //não captura a tecla enter
        current_txtW = string_width(new_txt);
        ntl = string_length(new_txt); // novo tamanho do texto
        
        if current_txtW > max_width
        {
            if string_char_at(new_txt,ntl) == " " {
                new_txt = string_delete(new_txt,ntl,1);
                new_txt += "#";
                new_txt += string_copy(txt,i,1);
                ntl = string_length(new_txt);
                if string_char_at(new_txt,ntl) == " "
                {
                    new_txt = string_delete(new_txt,ntl,1);    
                }
            } else {
                for (n = ntl; string_char_at(new_txt,n) != " "; n--){
                    var num = n;   
                }
                var temp_txt =  string_copy(new_txt,num,30);
                new_txt =  string_delete(new_txt,num,30);
                new_txt += "#";
                new_txt += temp_txt;           
            }
        }
    }
}

//Conversão
if new_txt != "" {txt = new_txt; txt_width = string_width(txt);}

//Variavel para a proxima parte...
new_txt_height = string_height_ext(txt,sTxt_height,max_width);

//dividira o paragrafo se necessario e colocara uma fixação 
//irá rodar o tanto de vezes o necessario
if (new_txt_height > max_height){
    new_txt = txt; // mais uma conversão
    new_txt_height = string_height_ext(new_txt,sTxt_height,max_width);
    
    // colocando na fixação
     while(new_txt_height > max_height)
     {
        var tempChar = string_copy(new_txt,string_length(new_txt),1);
        global.temp_placeholderTxt += tempChar;
        new_txt = string_delete(new_txt,string_length(new_txt),1);
        new_txt_height = string_height_ext(new_txt,sTxt_height,max_width);
     }
     //revertendo a ordem
     while(string_length(global.temp_placeholderTxt) > 0){
        global.placeholderTxt += string_copy(global.temp_placeholderTxt,string_length(global.temp_placeholderTxt),1);
        global.temp_placeholderTxt = string_delete(global.temp_placeholderTxt,string_length(global.temp_placeholderTxt),1);
     }
}

//ultima conversão
if new_txt != "" {txt = new_txt;}

//checando para pular ou aumentar a velocidade do texto
if !keyboard_check(key_press)
{
    if global.maxPrintTimer >= 1 global.maxPrintTimer = 0;
} else {
    global.maxPrintTimer = txtSpeed;
} 

//txt_length = string_length(txt);

// imprimindo de um txt
if global.printTimer <= 0 && (global.txtIndex < txt_length+1) {
    global.display_txt += string_copy(txt,global.txtIndex,1);
    global.printTimer = global.maxPrintTimer;
    global.txtIndex++;

    //se houver uma musica/ som, então toque-a
    if sfx != noone {    
        //Sound Effects
        var charSFX = global.display_txt;
        charSFX = string_char_at(global.display_txt,string_length(global.display_txt));
        
        if charSFX != " " {
            if audio_is_playing(sfx)
            {
                audio_stop_sound(sfx);
                audio_play_sound(sfx,5,false);
            }
            audio_sound_gain(sfx,.1,0);
            audio_play_sound(sfx,5,false);
        }
    }
}

//movendo para a proxima pagina ou saindo
if global.txtIndex >= txt_length && key_press
{
    global.display_txt = "";
    txt = global.placeholderTxt;
    global.placeholderTxt = "";
    global.temp_placeholderTxt = "";
    global.txtIndex = 1;
    global.maxPrintTimer = txtSpeed;
}

//timer para a velocidade na qual as letras aparecem na tela
if global.printTimer > 0 global.printTimer--;

// Desenhe variaveis
draw_set_font(font);

// Desenhe caixa de dialogo
draw_set_color(c_black);
draw_rectangle(view_xview,((view_yview+view_hview)-max_height)-(padding*1.5),view_wview,view_yview+view_hview,false);

// bordas do retangulo
var bw = 4; // largura da borda
draw_set_color(c_white);
draw_line_width(view_xview, ((view_yview+view_hview)-max_height)-(padding*1.5), view_xview, (view_yview+view_hview), bw);
draw_line_width(view_xview-(bw/2), ((view_yview+view_hview)-max_height)-(padding*1.5), view_xview+view_wview, ((view_yview+view_hview)-max_height)-(padding*1.5), bw);
draw_line_width(view_xview+view_wview-bw/2, ((view_yview+view_hview)-max_height)-(padding*1.5), view_xview+view_wview-bw/2, (view_yview+view_hview), bw);
draw_line_width(view_xview, (view_yview+view_hview)-bw/2, view_xview+view_wview, (view_yview+view_hview)-bw/2, bw);



// desenhando o texto na tela
draw_set_color(c_white);
draw_text_ext(view_xview+padding,((view_yview+view_hview)-max_height)-(padding/2),global.display_txt,sTxt_height,max_width);

// saindo do dialogo
if txt == "" && global.placeholderTxt == ""{
    global.tboxActive = false;
    txt = global.txtCache;
    global.txtCache = "";
}

return txt;

