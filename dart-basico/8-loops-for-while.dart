
void main() {
  
  var numero = 5;
  var postagens = [
    "Viagem entre amigos para a praia!",
    "Natal em família!",
    "Almoço de domingo na casa da mãe!"
  ]; 
  
  while(numero >= 1){
    print("Executado o número dentro do while: $numero ");
    numero--;
  }
  
  print("--------------");
  
  for(int numero = 1; numero <= 5; numero += 2 ){
     print("Executado o número dentro do for: $numero ");
  }
  
  print("--------------");
  
  for(var postagem in postagens){
    print("Título da postagem: $postagem ");
    print("--------------");
  }
  
  numero = 1;
  
  do{
    print("Executado o número dentro do do/while: $numero");
    numero++;
  }while(numero <= 5);
  
}