
class Livro {
  String nome;
  Livro({required this.nome});
}

class Usuario {
  String nome;
  Usuario({ required this.nome});
}

class Emprestimo {
  DateTime _dataLimite = DateTime.now();
  Map<Usuario, Livro> usuario_livro = {};

  DateTime get dataLimite => _dataLimite;

  set dataLimite(DateTime novaData) {
    if (DateTime.now().isBefore(novaData)) {
      return;
    }
    _dataLimite = novaData;
  }

  static Emprestimo registrar(Usuario usuario, Livro livro, DateTime? dataLimite) {
    Emprestimo emprestimo = Emprestimo();

    if (dataLimite != null) {
      emprestimo.dataLimite = dataLimite;
    }
    emprestimo.usuario_livro = {usuario : livro };

    return emprestimo;
  }

  exibir() {
    usuario_livro.forEach((usuario, livro) {
      print('Usuário: ${usuario.nome}, Livro: ${livro.nome}, data: ${dataLimite}');
    });
  }
}