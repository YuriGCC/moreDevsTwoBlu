
class Produto {
  late String nome;
  double _quantidade = 0;


  double get quantidade => _quantidade;
  set quantidade(double novaQuantidade) {
    if (novaQuantidade < 0) {
      return;
    }
    _quantidade = quantidade;
  }
}

class Carrinho {
  List<Produto> produtos = [];

  adicionarProduto(Produto produto) {
    produtos.add(produto);
  }

  removerProduto(Produto produtoRemovido) {
    produtos.removeWhere((produto) => produto.nome == produtoRemovido.nome);
  }

  List<Produto> listarProdutos() {
    return produtos;
  }

  double totalCarrinho() {
    double quantidadeItens = 0;
    produtos.forEach((produto) {
      quantidadeItens += produto.quantidade;
    });
    return quantidadeItens;
  }
}