import 'dart:io';

void exercicio1_fazer() {
  print('primerio número:');
  int n1 = int.tryParse(stdin.readLineSync().toString()) ?? 1;
  print('segundo número:');
  int n2 = int.tryParse(stdin.readLineSync().toString()) ?? 1;
  print('operador: (0 = "+", 1 = "-", 2 = "/", 3 = "*" ');
  int operacao = int.tryParse(stdin.readLineSync().toString()) ?? 0;

  Map<int, Map<String, Function(int, int)>> operacoes = {
    0: {'+' : (a, b) => a + b},
    1: {'-' : (a, b) => a - b},
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
  } catch(e) {
    print('Erro: \n ${e.toString()}');
  }
}

void main() {
  exercicio1_fazer();
}