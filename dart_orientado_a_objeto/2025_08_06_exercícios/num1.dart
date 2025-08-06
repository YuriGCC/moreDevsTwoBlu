class Produto {
  late String _nome;
  double _preco = 0;
  double _quantidade = 0;

  String get nome => _nome;
  double get preco => _preco;
  double get quantidade => _quantidade;

  set nome(String novoNome) {
    _nome = novoNome;
  }

  set preco(double novoPreco) {
    if (novoPreco < 0) {
      return;
    }

    _preco = novoPreco;
  }

  set quantidade(double quantidadeNova) {
    if (quantidadeNova <  0) {
      return;
    }
    _quantidade = quantidadeNova;
  }

  double totalEsotque() {
    return _preco * _quantidade;
  }
}