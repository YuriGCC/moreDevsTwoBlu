import 'mysql_interface.dart';

abstract class Persistent {
  Future<void> save(MySQLInterface sqlInterface);
}