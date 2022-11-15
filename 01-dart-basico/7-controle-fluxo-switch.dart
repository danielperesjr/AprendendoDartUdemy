
void main() {
  
  var comando = "teste";
  
  switch(comando){
    case "Depositar" :
      print("Desposite um valor...");
      break;
    case "Sacar" :
      print("Realize um saque...");
      break;
    default :
      print("Nenhuma opção válida, tente novamente.");
  }
  
  if(comando == "Depositar"){
    print("Desposite um valor...");
  }else if(comando == "Sacar"){
    print("Realize um saque...");
  }else{
    print("Nenhuma opção válida, tente novamente.");
  }
  
}