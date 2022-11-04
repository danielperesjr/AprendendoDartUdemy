void exibirDados(String nome, int idade, double altura){
  print("Nome: $nome");
  print("Idade: $idade");
  print("Altura: $altura");
}

void calcularBonus(){
  print("Seu bônus é de: 20");
}

void calcularSalario(double salario, Function funcaoParametro){
  print("Seu salário é de: $salario ");
  funcaoParametro();
}

void main() {
 
  exibirDados("Daniel", 18, 1.80);
  calcularBonus();
  calcularSalario(100, (){
    print("Calculo Customizado");
  });
  
}