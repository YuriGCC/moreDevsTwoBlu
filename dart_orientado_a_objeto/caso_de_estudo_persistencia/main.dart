import 'core/client.dart';
import 'core/order.dart';
import 'core/product.dart';
import 'repositories/mysql_interface.dart';

void main() async {
  // Make sure to execute in your mysql the mysql_setup.sql or alternate the properties to work properly.

  final sqlInterface = await MySQLInterface.createConnection(
      host: '127.0.0.1',
      port: 3306,
      userName: 'usuario',
      password: 'senha',
      dataBaseName: 'loja',
  );

  Product produto1 = Product(name: 'produto1', price: 10);
  Product produto2 = Product(name: 'produto2', price: 20);
  Product produto3 = Product(name: 'produto3', price: 30);

  Order order1 = Order(date: DateTime.now());
  Order order2 = Order(date: DateTime.now());

  Client client1 = Client(name: 'cliente1');
  Client client2 = Client(name: 'cliente2');

  sqlInterface.save(persistentObject)

}