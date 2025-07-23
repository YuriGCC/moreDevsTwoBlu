import 'dart:io';

/*
Descrição atividade:

Desenvolva um programa que utilize comandos condicionais e coalescência na entrada de dados:
Instruções:
    Pesquise sobre os seguintes tópicos em Dart:
    Comandos condicionais: if, else, else if, switch.
    Coalescência Nula (??): O operador ?? deve ser utilizado para fornecer valores padrão em caso de entradas nulas.

Documente o código explicando:
  O que o operador ?? faz no código.
  O que está sendo testado nos comandos condicionais
*/

void main() {

  // comandos condicionais, if, else, else if, switch
  try {
    print('Quantos pulos você deu?');
    int numPulos = int.parse(stdin.readLineSync().toString());
    stdout.write('quantos pulos você deu? ${numPulos}?');
    // if
    bool condicao = numPulos == 100;
    if (condicao) {
      print('Você atendeu as condições necessárias para o desconto! O total é: ');

      // switch
      switch(numPulos) {
        case 150:
          print('Você tem o desconto mínimo de 15%!');
        case 200:
          print('Você tem um desconto de 20%!');
        case 250:
          print('Você tem um desconto de 25%');
        default:
          print('Você tem o desconto mínimo de 10%!');
      }
    }
    // else if, sempre antes de um else e depois de um if
    else if (numPulos == 50) {
      print('Apesar de ainda não antender as condições, você terá um desconto um pouco menor.');
    }
    // else, sempre seguido de um if
    else {
      print('Você não atendeu as condições para o desconto.');
    }


  } on FormatException {
    print('Número inválido');
  } catch (e) {
    print('Erro: ${e.toString()}');
  }

  // operadores condicionais >, <, <=, >=, !, !=, ==
  try {
    print('Digite sua idade para verificarmos sua condição');
    int idade = int.parse(stdin.readLineSync().toString());
    stdout.write('digite sua idade para verificarmos sua condição: ${idade}');
    // >
    if (idade > 18) {
      print('Você tem mais de 18 anos!');
    }

    // <
    if (idade < 18) {
      print('Você ainda é menor de idade!');
    }

    // <=
    if (idade <= 0) {
      print('Você ainda vai nascer em ${idade * -1} anos!');
    }

    // >=
    if (idade >= 150) {
      print('Você é um grande ancião que já existiu entre nós!');
    }

    // ! opererador not
    if (idade == 0) {
      print('Você tem exatamente 0 anos! Quantos meses?');
      String meses = stdin.readLineSync().toString();

      if (!(meses == '-5 meses')) {
        print('Ainda bem que você não tem exatamente -5 meses');
      }
    }

    // !=
    if (idade != 50) {
      print('Além disso, você não tem exatos 50 anos!');
    }

    // ==
    if (idade == 13) {
      print('Você está na melhor época de sua vida tendo exatamente 13 anos, aproveite.');
    }

  } on FormatException {
    print('Número inválido');
  }
  catch (e) {
    print('Erro: ${e.toString()}');
  }

  // o básico para lidar com valores nulos ?? ? ! ??=
  try {
    // ? indica que pode vir vazio (null )
    int? numero;

    // ??= atribui um valor caso esteja vazio
    numero ??= 30; // numero é null, então atribuirá 30
    numero ??= 40; // numero não e null, pois possui um valor, então 40 não será atribuído
    print(numero);

    // ! garante que não será nula a variável, observe que ao retirar a atribuição da variável não causa erro de compilação com o !
    String? alfabeto;
    alfabeto = 'abc';
    String alfabetoMaiusculo = alfabeto!.toUpperCase();

    // ?? é um operador que indica o que usar caso algo seja nulo
    String? objetoNulo;
    String objeto = objetoNulo ?? 'Plano B ser for nulo';
    print(objeto);

  } catch (e) {
    print('Erro: ${e.toString()}');
  }
}
