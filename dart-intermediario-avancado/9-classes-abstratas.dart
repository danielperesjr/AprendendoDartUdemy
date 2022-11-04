abstract class Animal {
  
  var cor;
  
  void correr();
  
}

class Cao extends Animal {
  
  @override
  void correr(){
    print("Correr");
  }
  
  void latir(){
    print("Latir");
  }
}

class Passaro extends Animal {
  @override
  void correr(){
    print("Correr");
  }
  
  void voar(){
    print("Voar");
  }
  
}

void main() {
  
  //Classes Abstratas não podem ser instanciadas.
  //Animal animal = Animal();
  
  //Classe Concreta
  Cao cao = Cao();

}