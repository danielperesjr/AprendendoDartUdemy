class Configuracoes {
  
  static String identificadorApp = "ASDASD1234560987";
  static String notificacaoSom = "Sim";
  
  static void configuracaoInicial(){
    print("Executa configurações iniciais!");
  }
  
}

class Conta {
  var textoQualquer;
}

void main() {
  
  //Modificadores Static e Final

  //Acesso direto ao método
  Configuracoes.configuracaoInicial();
  //Acesso direto ao atributo
  print(Configuracoes.notificacaoSom);
  
  final Conta conta = Conta();
  conta.textoQualquer = "123456";
  
  print(conta.textoQualquer);
  
  //O modificador final impossibilita uma nova instância
  //conta = Conta();
  
}