/*
Collection ou coleções: são implementações de estruturas de dados, que são utilizados para armazenar itens.
 - List
 - Maps
*/

void main() {
	
  List frutasList = ["Morango", "Manga"];
  print(frutasList[0]);
  
  Map frutasMap = Map();
  frutasMap[0] = "Morango";
  frutasMap[1] = "Manga";
  print(frutasMap[0]);
  
  //Chave e Valor
  Map<String, dynamic> usuarios = Map();
  usuarios["nome"] = "Daniel";
  usuarios["idade"] = 18;
  
  //Chave e Valor
  Map<String, String> estados = Map();
  estados["SP"] = "São Paulo";
  estados["MG"] = "Minas Gerais";
  estados["RJ"] = "Rio de Janeiro";
  
  print(estados.keys);
  print(estados.values);
  print(estados.containsKey("MG"));
  print(estados.containsValue("São Paulo"));
  print(estados.length);
  
  print(estados);

  estados.forEach(
  	(chave, valor) => print(" $chave - $valor ")
  );
  
}