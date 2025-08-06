
class Pessoa {
  String nome;
  int idade;

  Pessoa({
    required this.nome,
    required this.idade
  });

  @override
  String toString() {
    return 'Nome ${nome}, Idade: ${idade}';
  }
}