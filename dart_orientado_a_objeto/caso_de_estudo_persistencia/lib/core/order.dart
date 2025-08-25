import '../repositories/mysql_interface.dart';
import 'product.dart';

class Order {
  int? orderId;
  DateTime date;
  List<Map<String, dynamic>> products = [];

  Order({required this.date});

  void addProduct(Product product, int quantity) {
    products.add({'product': product, 'quantity': quantity});
  }

  Future<void> save(MySQLInterface sqlInterface, {required int clientId}) async {
    final result = await sqlInterface.conn.execute(
      'INSERT INTO ClientOrder (dateOrder, clientId) VALUES (:dateOrder, :clientId)',
      {'dateOrder': date.toIso8601String().substring(0, 10), 'clientId': clientId},
    );
    orderId = result.lastInsertID.toInt();

    for (var item in products) {
      Product product = item['product'];
      int quantity = item['quantity'];

      if (product.productId == null) {
        await product.save(sqlInterface);
      }
      await product.linkToOrder(sqlInterface, orderId!, quantity);
    }
  }
}
