abstract class Funcionario {
  double calcularSalario();
}

class Gerente implements Funcionario {
  double salario = 0;
  @override
  double calcularSalario() {
    salario += 1000;
    return salario;
  }
}

class Desenvolvedor implements Funcionario {
  double saldo = 0;

  @override
  double calcularSalario() {
    saldo += 500;
    return saldo;
  }
}