import '../core/client.dart';
import '../core/order.dart';
import '../core/product.dart';
import '../repositories/mysql_interface.dart';
import '../repositories/report_repository.dart';

void main() async {
  // Make sure to execute in your mysql the mysql_setup.sql or alternate the properties to work properly.
  final sqlInterface = await MySQLInterface.createConnection(
    host: '127.0.0.1',
    port: 3306,
    userName: 'usuario',
    password: 'senha',
    dataBaseName: 'loja',
  );

  final report = ReportRepository(sqlInterface);

  Product p1 = Product(name: 'Produto A', price: 10.0);
  Product p2 = Product(name: 'Produto B', price: 20.0);
  Product p3 = Product(name: 'Produto C', price: 30.0);

  await p1.save(sqlInterface);
  await p2.save(sqlInterface);
  await p3.save(sqlInterface);

  Client c1 = Client(name: 'Cliente 1');
  Client c2 = Client(name: 'Cliente 2');

  Order o1 = Order(date: DateTime.now());
  o1.addProduct(p1, 2);
  o1.addProduct(p2, 1);

  Order o2 = Order(date: DateTime.now());
  o2.addProduct(p2, 3);
  o2.addProduct(p3, 1);

  c1.addOrder(o1);
  c2.addOrder(o2);

  await c1.save(sqlInterface);
  await c2.save(sqlInterface);

  await report.listOrdersWithClients();
  await report.listClientSummary();
}
