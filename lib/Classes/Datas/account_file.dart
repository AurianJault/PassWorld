import 'package:test/Classes/Datas/pass_file.dart';
import 'package:test/Classes/account.dart';
import 'package:sqlite3/sqlite3.dart';

class account_file {
  var db;
  PassFile(String ident) {
    db = sqlite3.open("lib/Classes/Datas/Accounts/$ident.txt");
  }

  void initPass() {
    db.execute('''
      CREATE TABLE IF NOT EXISTS ACCOUNTS(
        id TEXT PRIMARY KEY,
        hash TEXT NOT NULL,
        salt TEXT NOT NULL
      )
    ''');
  }

  
}
