import 'package:mysql1/mysql1.dart';

class Mysql {
  late MySqlConnection _conn;

  Mysql() {
    connect();
  }

  Future<void> connect() async {
    var settings = ConnectionSettings(
      host: '192.168.1.35',
      port: 3306,
      user: 'root',
      password: 'pass',
      db: 'redone',
    );

    _conn = await MySqlConnection.connect(settings);
  }

  MySqlConnection get connection => _conn;
}
