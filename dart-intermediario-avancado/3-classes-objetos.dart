//Classe
class Casa {
  
  //Atributos
  var cor;
  
  //Métodos
  //void abrirJanela(int qtdJanelas){
  void abrirJanela(){
    print("Abrir janela da casa $cor");
    //print("Janelas: $qtdJanelas ");
  }
  
  void abrirPorta(){
    print("Abrir porta da casa $cor");
  }
  
  void abrirCasa(){
    this.abrirJanela();
    this.abrirPorta();
  }
  
}

class Usuario {
  
  var usuario;
  var senha;
  
  void autenticarUsuario(){
    
    //Recuperar de um banco de dados
    var usuario = "user";
    var senha = "123";
    
    if(this.usuario == usuario && this.senha == senha){
      print("Acesso autorizado!");
    }else{
      print("Acesso negado!");
    }
   
  }
  
}

void main() {
  
  Usuario usuario = new Usuario();
  
  usuario.usuario = "xxx";
  usuario.senha = "123456";
  usuario.autenticarUsuario();
  
  print("---------------");
  
  Casa minhaCasa = Casa();
  minhaCasa.cor = "Amarela";
  minhaCasa.abrirJanela();
  minhaCasa.abrirPorta();
  minhaCasa.abrirCasa();
  
  print("---------------");
  
  
  Casa minhaCasa2 = Casa();
  minhaCasa2.cor = "Vermelha";
  //minhaCasa2.abrirJanela(3);
  print(minhaCasa2.cor);
  
}