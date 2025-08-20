import 'persistent.dart';
import 'mysql_interface.dart';
import '../core/client.dart';

class ClientRepository implements Persistent{
  @override
  void save(MySQLInterface sqlInterface) {
    sqlInterface.conn.execute('');
  }
}