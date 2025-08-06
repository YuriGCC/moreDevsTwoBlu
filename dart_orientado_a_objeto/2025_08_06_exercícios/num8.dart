
class Pessoa {
  late String nome;
  late int _idade;

  int get idade => _idade;

  set idade(int novaIdade) {
    if (novaIdade < 0) {
      return;
    }
    _idade = novaIdade;
  }
}