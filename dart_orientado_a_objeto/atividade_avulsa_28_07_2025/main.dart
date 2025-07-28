/*
    Crie uma classe Carro com atributos marca, modelo e ano
    Crie um construtor e um metodo exibirDetalhes()
    Instancie a classe Carro e chame o metodo.
    Depois, crie uma classe Produto com atributo privado _preco,
    use getter e setter para validar que o preço nunca seja negativo
 */

class Carro {
  String marca;
  String modelo;
  String ano;

  Carro({required this.marca, required this.modelo, required this.ano});

  String exibirDetalhes() {
    return 'Marca: ${this.marca}, Modelo: ${this.modelo}, Ano: ${this.ano}';
  }
}

class Produto {
  double _preco = 0;

  double get preco => this._preco;
  Produto(double novo_preco);

  set preco(novo_preco) {
    if (novo_preco > 10000) {
      this._preco = novo_preco;
    }
  }
}

void main() {
  Carro carro = new Carro(marca: 'marca', modelo: 'modelo 2.15', ano: '2015');
  print(carro.exibirDetalhes());

  Produto p1 = Produto(10.0);
  p1.preco = 120.0;
  print("O preço é: ${p1.preco}");

}