class Usuario {
  
  String usuario;
  String senha;
  String cargo;

  /*
  Usuario(String usuario, String senha){
    this.usuario = usuario;
    this.senha = senha;
    print("Configurações inicias do objeto...");
  }*/
  
  Usuario(this.usuario, this.senha);
  
  //Named Constructor
  Usuario.diretor(this.usuario, this.senha){
    this.cargo = "Diretor";
    print("Libera privilégios para o " + this.cargo);
  }
    
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
  
  Usuario usuario = Usuario("xxx", "123456");
  Usuario usuarioDiretor = Usuario.diretor("xxx", "123456");

  usuario.autenticarUsuario();
  usuarioDiretor.autenticarUsuario();
   
}