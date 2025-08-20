import 'mysql_interface.dart';
import 'persistent.dart';
import '../core/product.dart';

class ProductRepository implements Persistent {

  @override
  Future<void> save(MySQLInterface sqlInterface) async {
    try {
      sqlInterface.conn.execute('INSERT INTO ', {});
    } catch (e) {
      print(e);
    } finally {
      sqlInterface.conn.close();
    }
  }
}