
abstract class Pagamento {
  processarPagamento() {}
}

class PagamentoBoleto extends Pagamento {
  processarPagamento() {
    print('Pagando usando boleto...');
  }
}

class PagamentoCartao extends Pagamento {
  processarPagamento() {
    print('Pagando usando cartão...');
  }
}