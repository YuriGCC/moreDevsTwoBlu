class Produto {
  String nome;
  double _preco;

  double get preco => _preco;

  void set preco(double novo_preco) {
    if (novo_preco < 0) {
      return;
    }
    _preco = novo_preco;
  }

  Produto({required this.nome, required double preco})
      : _preco = (preco < 0) ? 0 : preco;

  exibir() {
    print('\n nome: $nome, preço: $preco');
  }
}


void main() {
  Produto produto1 = Produto(nome: 'produto1', preco: -5.52);
  print('\n Pelo preço ter sido instaciado negativo, é atribuído 0.');
  produto1.exibir();
  print('\n Tentando alterar por atribuição para ficar negativo, sem mantém 0.');
  produto1.preco = -1;
  produto1.exibir();
  print('\n Atribuindo um valor válido, o preço é alterado.');
  produto1.preco = 10;
  produto1.exibir();

  Produto produto2 = Produto(nome: 'produto2', preco: 15.72);
  produto2.exibir();
}