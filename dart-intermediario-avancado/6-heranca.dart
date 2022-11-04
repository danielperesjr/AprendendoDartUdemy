class Animal {
  var cor;
  void dormir(){
    print("Dormir");
  } 
}

class Cao extends Animal { 
  var corOrelha;
  void latir(){
    print("Latir");
  }
}

class Passaro extends Animal {
  var corBico;
  void voar(){
    print("Voar");
  }
}

void main() {
  
  Cao cao = Cao();
  Passaro passaro = Passaro();
  
  cao.cor = "Branco";
  cao.corOrelha = "Preto";
  print("Cor do cão: " + cao.cor);
  print("Cor da orelha do cão: " + cao.corOrelha);
  cao.latir();
  
  passaro.cor = "Marrom";
  print(passaro.cor);
  passaro.voar();

}