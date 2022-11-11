/*
Collection ou coleções: são implementações de estruturas de dados, que são utilizados para armazenar itens.
 - List
 - Maps
*/

class Usuario {
  
  String nome;
  int idade;
  
  Usuario(this.nome, this.idade);
  
}

void main() {
  
  List<String> frutas = ["Morango", "Manga", "Melancia"];
  List numeros = [1, 5, "Daniel", 10.60];
  
  print(frutas);
  print(numeros);

  //adicionar itens
  frutas.add("Pera");
  //Inserir em uma posição
  frutas.insert(1, "Abacaxi");
  
  print(frutas);

  //Remover item
  frutas.removeAt(1);
  
  //Verificar item na lista
  print(frutas.contains("Pera"));
  
  //Tamanho da lista
  print(frutas.length);
  print(frutas);
  
  //Armazenar objetos
	
  /*
  List<Usuario> usuarios = List();
  usuarios.add(Usuario("Daniel", 18));
  usuarios.add(Usuario("Bruce", 45));
  usuarios.add(Usuario("Steve", 30));
  
  print(usuarios);

  for(Usuario usuario in usuarios){
    print( "Nome: ${usuario.nome} idade: ${usuario.idade}");
  }
  */
  
}