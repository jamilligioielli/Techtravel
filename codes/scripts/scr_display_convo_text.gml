///scr_display_convo_text
espaco = keyboard_check_pressed(vk_space);
if (currCharIndex < string_length(dialog[convoIndex, 1] + 1))
{
   spriteToDisplay = dialog[convoIndex, 0];
   stringToDisplay += string_char_at(text[convoIndex, 1], currCharIndex++);
}
else{
   if (espaco){
   convoIndex++;
   stringToDisplay = "";
   currCharIndex = 1;
   
   if (covoIndex == ConvoDialogCount){
     active = false;
   }
}}
