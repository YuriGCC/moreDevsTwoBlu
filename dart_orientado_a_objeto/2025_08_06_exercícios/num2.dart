class ContaBancaria {
  String titular;
  int numero;
  double _saldo = 0;

  ContaBancaria({
    required this.titular,
    required this.numero
  });

  get saldo => _saldo;

  set saldo(novoSaldo) {
    if (novoSaldo < 0) {
      return;
    }

    _saldo = novoSaldo;
  }

  depositar(double valor) {
    if (valor < 0) {
      return 'Número inválido';
    }

    saldo = saldo + valor;
    return saldo;
  }

  sacar(double valor) {
    if (valor > saldo) {
      return 'Você não tem crédito o suficiente';
    }
    saldo = saldo - valor;
  }

  mostrarSaldo() {
    print(saldo);
  }
}