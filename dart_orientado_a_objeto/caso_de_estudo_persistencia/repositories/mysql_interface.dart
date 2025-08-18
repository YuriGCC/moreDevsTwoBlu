import 'package:mysql_client/mysql_client.dart';
import 'persistent.dart';

class MySQLInterface {

  late String _host;
  late int _port;
  late String _userName;
  late String _password;
  late String _dataBaseName;

  String get host => _host;
  int get port => _port;
  String get userName => _userName;
  String get password => _password;
  String get dataBaseName => _dataBaseName;

  void set host(String newHost) => _host = newHost;
  void set port(int newPort) => _port = newPort;
  void set userName(String newUserName) => _userName = newUserName;
  void set password(String newPassword) => _password = newPassword;
  void set dataBaseName(String newDbName) => _dataBaseName = newDbName;

  MySQLInterface._(
      this._host,
      this._port,
      this._userName,
      this._password,
      this._dataBaseName,
      );

  static Future<MySQLInterface> createConnection({
    required String host,
    required int port,
    required String userName,
    required String password,
    required String dataBaseName,
  }) async {
      final conn = await MySQLConnection.createConnection(host: host, port: port, userName: userName, password: password);

      await conn.connect();

      return MySQLInterface._(host, port, userName, password, dataBaseName);
  }

  void save(Persistent object) {
    object.save();
  }
}
