import '../repositories/mysql_interface.dart';
import 'order.dart';

class Client {
  int? clientId;
  String name;
  List<Order> orders = [];

  Client({required this.name});

  void addOrder(Order order) {
    orders.add(order);
  }

  Future<void> save(MySQLInterface sqlInterface) async {
    final result = await sqlInterface.conn.execute(
      'INSERT INTO Client (clientName) VALUES (:name)',
      {'name': name},
    );
    clientId = result.lastInsertID.toInt();

    for (Order order in orders) {
      await order.save(sqlInterface, clientId: clientId!);
    }
  }
}
