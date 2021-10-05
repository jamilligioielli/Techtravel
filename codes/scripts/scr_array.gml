///scr_array
//a GML 1.4.9999 não permite que sejam definidos automaticamente, portanto:
//a função abaixo permite definir os argumentos dentro de uma matriz
var _arr = 0;
for(var i=0; i<argument_count; i++){
  _arr[i] = argument[i];
}
return(_arr);
