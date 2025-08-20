import 'product.dart';

class Order {
  List<Product> products = [];
  DateTime date;

  Order({
    required this.date
  });

  List<Product> addProduct(Product product) {
    products.add(product);
    return products;
  }
  
}