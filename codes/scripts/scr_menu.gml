///scr_menu
switch(mpos){
  case 0: room_goto(rm_level_1); break;
  
  case 1:
      room_goto(rm_historinha) break;
  
  case 2: room_goto(rm_tutorial); break;
  

  case 3: game_end(); break; 
  
  default: break;
  
}
