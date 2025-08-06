abstract class Veiculo {
  ligar() {}
  desligar() {}
}

class Carro implements Veiculo {
  @override
  desligar() {
    return 'Carro ligando';
  }

  @override
  ligar() {
    return 'Carro desligando';
  }

}

class Moto implements Veiculo {
  @override
  desligar() {
    return 'Moto ligando';
  }

  @override
  ligar() {
    return 'Moto desligando';
  }

}