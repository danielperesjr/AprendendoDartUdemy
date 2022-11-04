
void exibirMensagem(String nome, int idade){
  print("Alerta, você não preencheu todos os campos $nome!");
  print("Sua idade é: $idade");
}

/*
double calcularSalario(double salario){
  var total = salario - (salario * 0.1);
  return total;
  //print("Salário total: $total");
}
*/
double calcularSalario(double salario) => salario - (salario * 0.1);

void main() {
  
  double bonus = 500;
  double resultado = calcularSalario(1000);
  double total = resultado + bonus;
  print("Salário total: $total");
  
  
  exibirMensagem("Daniel", 18);
  exibirMensagem("Pedro", 45);
  
}