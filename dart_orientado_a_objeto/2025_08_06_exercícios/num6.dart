
class Retangulo {
  double _largura = 0;
  double _altura = 0;

  double get largura => _largura;
  double get altura => _altura;

  set largura(double novaLargura) {
    if (novaLargura < 0)  {
      return;
    }
    _largura = novaLargura;
  }

  set altura(double novaAltura) {
    if (novaAltura < 0) {
      return;
    }
    _altura = novaAltura;
  }

  double area() {
    return altura * largura;
  }

  double perimetro() {
    return (altura * 2 ) + (largura * 2);
  }
}