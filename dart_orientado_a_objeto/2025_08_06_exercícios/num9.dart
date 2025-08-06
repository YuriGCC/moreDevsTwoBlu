
interface class Imprimivel {
  imprimir() {}
}

class Documento implements Imprimivel {
  @override
  imprimir() {
    print('Imprimindo documento...');
  }
}

class Relatorio implements Imprimivel {
  @override
  imprimir() {
    print('Imprimindo relatório...');
  }

}