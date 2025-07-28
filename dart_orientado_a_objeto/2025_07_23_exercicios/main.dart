import 'dart:io';

void atividade1() {
  print('primeiro número:');
  int n1 = int.tryParse(stdin.readLineSync().toString()) ?? 1;
  print('segundo número:');
  int n2 = int.tryParse(stdin.readLineSync().toString()) ?? 1;
  print('operador: (0 = "+", 1 = "-", 2 = "/", 3 = "*")');
  int operacao = int.tryParse(stdin.readLineSync().toString()) ?? 0;

  Map<int, Map<String, Function(int, int)>> operacoes = {
    0: {'+': (a, b) => a + b},
    1: {'-': (a, b) => a - b},
    2: {'/': (a, b) => b != 0 ? a / b : throw Exception('Divisão por zero')},
    3: {'*': (a, b) => a * b},
  };

  try {
    if (!operacoes.containsKey(operacao)) {
      print('operação inválida!');
      return;
    }

    var operacaoMap = operacoes[operacao]!;
    var simbolo = operacaoMap.keys.first;
    var funcao = operacaoMap[simbolo]!;

    var resultado = funcao(n1, n2);
    print('$n1 $simbolo $n2 = $resultado');
  } catch (e) {
    print('Erro: \n${e.toString()}');
  }
}

void atividade2() {
  while (true) {
    print('Digite sua idade: ');
    int idade = int.tryParse(stdin.readLineSync().toString()) ?? -1;

    if (idade < 0) {
      print('Digite uma idade válida');
      continue;
    }

    if (idade < 18) {
      stdout.writeln('Acesso negado');
      continue;
    } else {
      stdout.writeln('Acesso permitido');
      break;
    }
  }
}

void atividade3() {
  int? n;
  while (true) {
    print('digite um número inteiro positivo: ');
    n = int.tryParse(stdin.readLineSync().toString());
    n ??= -1;
    if (n <= 0) {
      print('digite um número válido');
    } else {
      break;
    }
  }

  for (int i = n; i >= 0; i--) {
    stdout.writeln('Faltam $i segundos');
  }
}

void atividade4() {
  double media(List<double> notas) {
    double soma = notas.reduce((acumulador, elemento) => acumulador + elemento);
    return soma / notas.length;
  }

  Map<String, List<double>> aproveitamentoAluno = {};

  for (int i = 0; i < 3; i++) {
    print('digite o nome da ${i + 1}° disciplina');
    String disciplina = stdin.readLineSync() ?? 'nome não informado';
    aproveitamentoAluno[disciplina] = [];
  }

  aproveitamentoAluno.forEach((disciplina, _) {
    List<double> notas = [];
    int i = 0;
    while (i < 3) {
      print('digite a ${i + 1}° nota para a disciplina $disciplina');
      double? nota = double.tryParse(stdin.readLineSync().toString());

      if (nota != null && nota >= 0 && nota <= 10) {
        notas.add(nota);
        i++;
      } else {
        print('digite uma nota válida');
      }
    }
    aproveitamentoAluno[disciplina] = notas;
  });

  print('\nMédias do aluno por disciplina:');
  aproveitamentoAluno.forEach((disciplina, notas) {
    double mediaAluno = media(notas);
    print('$disciplina: ${mediaAluno.toStringAsFixed(2)}');
    if (mediaAluno >= 7) {
      print('aprovado');
    } else if (mediaAluno >= 5 && mediaAluno <= 6.9) {
      print('em recuperação');
    } else if (mediaAluno < 5) {
      print('reprovado');
    }
  });
}

void atividade5() {
  print('Digite uma frase:');
  String frase = stdin.readLineSync() ?? '';

  List<String> vogais = ['a', 'e', 'i', 'o', 'u'];
  List<String> consoantes = [
    'b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm',
    'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z'
  ];

  Map<String, int> contagem = {
    'vogais': 0,
    'consoantes': 0,
  };

  List<String> caracteres = frase.split('');

  for (String caractere in caracteres) {
    caractere = caractere.toLowerCase();

    if (!vogais.contains(caractere) && !consoantes.contains(caractere)) {
      continue;
    }

    if (vogais.contains(caractere)) {
      contagem['vogais'] = contagem['vogais']! + 1;
    } else {
      contagem['consoantes'] = contagem['consoantes']! + 1;
    }
  }

  print('Quantidade de vogais: ${contagem['vogais']}');
  print('Quantidade de consoantes: ${contagem['consoantes']}');
}

void main() {

}
