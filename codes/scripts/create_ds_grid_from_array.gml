///create_ds_grid_from_array

var ds_grid;
var matriz = argument0;
var matriz_num_missoes = array_length_1d(matriz);
var matriz_tam = array_length_1d(matriz[0]);


ds_grid = ds_grid_create(matriz_tam, matriz_num_missoes);

var i = 0; 
repeat(matriz_num_missoes){
   var missao_matriz =  matriz[i];
   var j =0;
   repeat(matriz_tam){
     ds_grid[# i, j] = missao_matriz [i];
   j++;}

  i++;
}
return ds_grid;
