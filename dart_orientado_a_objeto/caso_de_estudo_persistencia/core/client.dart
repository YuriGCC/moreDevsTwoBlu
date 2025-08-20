import 'order.dart';

class Client {
  String name;
  List<Order> orders = [];

  Client({
    required this.name
  });

  List<Order> addOrder(Order order) {
    orders.add(order);
    return orders;
  }
}