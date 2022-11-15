class Animal {
  
  String cor;
  
  Animal(this.cor);
  
  void dormir(){
    print("Dormir");
  } 
  
  void correr(){
    print("Correr");
    print("como");
    print("um");
  }
  
}

class Cao extends Animal { 
  String corOrelha;
  
  Cao(String cor, this.corOrelha) : super(cor);
  
  void latir(){
    print("Latir");
  }
  
  @override //sobrepor
  void correr(){
    super.correr();
    print("cão!");
  }
  
}

class Passaro extends Animal {
  String corBico;
  
  Passaro(String cor, this.corBico) : super(cor);
  
  void voar(){
    print("Voar");
  }
  
  @override
  void correr(){
    super.correr();
    print("passaro!");
  }
  
}

void main() {
  
  Cao cao = Cao("Marrom", "Branco");
  Passaro passaro = Passaro("Vermelho", "Amarelo");
  
  cao.correr();
  passaro.correr();
  
  print("Cor do Pássaro: ${passaro.cor} Cor do Bico: ${passaro.corBico}");
  
}