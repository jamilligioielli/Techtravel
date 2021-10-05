///scr_menu_p
switch(mpos){
  case 0: 
  obj_start.state = "start"
   break;
  
  case 1: room_goto(rm_tutorial); break;
  
  case 2: game_end(); break; 
  
  default: break;
  
}
