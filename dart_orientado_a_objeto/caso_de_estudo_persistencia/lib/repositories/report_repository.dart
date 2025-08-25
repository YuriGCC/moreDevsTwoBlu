import 'mysql_interface.dart';

class ReportRepository {
  final MySQLInterface sqlInterface;

  ReportRepository(this.sqlInterface);

  Future<void> listOrdersWithClients() async {
    final result = await sqlInterface.conn.execute('''
      SELECT co.clientOrderId, co.dateOrder, c.clientName
      FROM ClientOrder co
      JOIN Client c ON co.clientId = c.clientId
    ''');

    print('\n--- Clientes com Pedidos ---');
    for (final row in result.rows) {
      print('Order ID: ${row.colByName('clientOrderId')} | Data: ${row.colByName('dateOrder')} | Cliente: ${row.colByName('clientName')}');
    }
  }

  Future<void> listClientSummary() async {
    final result = await sqlInterface.conn.execute('''
      SELECT c.clientName, SUM(p.price * op.quantity) AS totalSpent
      FROM Client c
      JOIN ClientOrder co ON c.clientId = co.clientId
      JOIN OrderProduct op ON co.clientOrderId = op.clientOrderId
      JOIN Product p ON op.productID = p.productID
      GROUP BY c.clientName
    ''');

    print('\n--- Sumário de Cada Cliente ---');
    for (final row in result.rows) {
      print('Cliente: ${row.colByName('clientName')} | Total Gasto: ${row.colByName('totalSpent')}');
    }
  }
}
