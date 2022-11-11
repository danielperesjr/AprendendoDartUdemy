/* 
  Pode-se dizer que uma interface é um contrato que quando assumido por uma classe deve ser implementado.
  A interface é utilizada, pois podemos ter muitas classes que podem possuir a mesma ação, porém podem executá-las de maneiras diferentes.
*/

abstract class Presidenciavel {
  void participarEleicao();
}

abstract class Jornalismo {
  void escreverArtigoJornal();
}

abstract class Cidadao {
  void direitosDeveres(){
    print("Todo cidadão tem direitos e deveres...");
  }
}

class Obama extends Cidadao 
  implements Presidenciavel, Jornalismo  {
  
  @override
  void escreverArtigoJornal(){
    print("Escrever artigo para o Jornal...");
  }
  
  @override
  void participarEleicao(){
    print("Eleição nos Estados Unidos para o Obama...");
  } 
  
}

class Fulano extends Cidadao {
  
}

void main() {
	
  Obama obama = Obama();
  obama.direitosDeveres();
  obama.participarEleicao();
  obama.escreverArtigoJornal();
  
  print("-----------");
  
  Fulano fulano = Fulano();
  fulano.direitosDeveres();
  
}