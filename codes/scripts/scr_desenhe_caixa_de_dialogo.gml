///scr_desenhe_caixa_de_dialogo
if (active){
draw_set_font(font_principal);
draw_set_color(c_white);
draw_rectangle(xorigin, yorigin, xorigin + largura, yorigin + altura, false);

draw_set_color(c_black);
draw_rectangle(xorigin_interna, yorigin_interna, xorigin_interna + largura_interna, yorigin_interna + altura_interna, false);

draw_set_color(c_white);
draw_text(text_xorigin, text_yorigin, stringToDisplay);
draw_sprite_ext(spriteToDisplay, -1, avatar_xorigin, avatar_yorigin, avatarScale, avatarScale, 0, s_white, 1);
}
