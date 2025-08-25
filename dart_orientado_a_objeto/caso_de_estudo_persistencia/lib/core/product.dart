import '../repositories/mysql_interface.dart';

class Product {
  int? productId;
  String name;
  double price;

  Product({this.productId, required this.name, required this.price});

  Future<void> save(MySQLInterface sqlInterface) async {
    final result = await sqlInterface.conn.execute(
      'INSERT INTO Product (productName, price) VALUES (:name, :price)',
      {'name': name, 'price': price},
    );
    productId = result.lastInsertID.toInt();
  }

  Future<void> linkToOrder(MySQLInterface sqlInterface, int orderId, int quantity) async {
    await sqlInterface.conn.execute(
      'INSERT INTO OrderProduct (clientOrderId, productID, quantity) VALUES (:orderId, :productId, :quantity)',
      {'orderId': orderId, 'productId': productId, 'quantity': quantity},
    );
  }
}
