///criar_ds_grid_da_matriz
//@argumento array
//@qual missão é de acordo com a matriz controladora = yy
//@informações dentro das matrizes de cada missão = xx
var ds_grid;
var array = scr_array();
script_execute(array);
array = argument0;
var array_num_missoes = scr_array();
script_execute(array_num_missoes);
var array_num_missoes = array_length_1d(array);
var array_larg = scr_array();
script_execute(array_larg);
array_larg = array_length_1d(array[0]);
ds_grid = ds_grid_create(array_larg, array_num_missoes);

var yy=0;
 repeat(array_num_missoes){
  var missao_matriz = array[yy];
  
  var xx=0;
   repeat(array_larg){
   ds_grid[# xx, yy]= missao_matriz[xx];
   } 
   
  yy++;

}

return ds_grid;

