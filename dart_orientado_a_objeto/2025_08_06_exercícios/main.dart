import 'num7.dart';

void main() {
  Usuario usuario = Usuario(nome: 'eu');
  Livro livro = Livro(nome: 'livro');
  Emprestimo emprestimo = Emprestimo.registrar(usuario, livro, DateTime.now().subtract(Duration(days: 1)));
  emprestimo.exibir();
}