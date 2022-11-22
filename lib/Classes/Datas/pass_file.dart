import 'package:sqlite3/sqlite3.dart';
import 'package:test/Classes/password.dart';
import 'package:test/Classes/Datas/i_data_strategy.dart';
import 'package:test/Classes/vault.dart';
import 'package:path/path.dart' as p;

class PassFile extends IDataStrategy {
  var db;
  PassFile(String identifiant, String docPath) {
    String file = "$identifiant.sqlite";
    String path = p.join(docPath, file);
    db = sqlite3.open(path);
  }

  void initPass() {
    db.execute('''
      CREATE TABLE IF NOT EXISTS Passwords(
        id INTEGER PRIMARY KEY,
        name TEXT,
        website TEXT NOT NULL,
        username TEXT,
        email TEXT,
        note TEXT,
        password TEXT NOT NULL,
        creationDate TEXT,
        modifDate TEXT
      );
    ''');
  }

  @override
  Vault loadPasswords() {
    initPass();
    // Faire un vault a lieu d'une liste de passworlds
    var vault = Vault();
    final ResultSet resultSet = db.select('SELECT * FROM Passwords');
    for (final Row row in resultSet) {
      if (row['creationDate'].toString() != 'null') {
        vault.addPassword(Password.load(
            row['id'],
            row['name'].toString(),
            row['password'],
            DateTime.parse(row['creationDate'].toString()),
            DateTime.parse(row['modifDate'].toString()),
            row['website'].toString(),
            row['username'].toString(),
            row['email'].toString(),
            row['note'].toString()));
      }
    }
    return vault;
  }

  @override
  void savePasswords(Vault passwords) {
    db.execute("DELETE FROM Passwords");
    for (var element in passwords.passwordList) {
      insertValue(
          element.getId,
          element.getName,
          element.getWebsite,
          element.getUsername,
          element.getEmail,
          element.getNote,
          element.getPassword,
          element.getCreationDate?.toIso8601String(),
          element.getModifDate?.toIso8601String());
    }
  }

  void insertValue(
      int id,
      String? name,
      String? website,
      String? username,
      String? email,
      String? note,
      String? password,
      String? creationDate,
      String? modifDate) {
    db.execute("INSERT INTO Passwords VALUES (?,?,?,?,?,?,?,?,?)", [
      id,
      name,
      website,
      username,
      email,
      note,
      password,
      creationDate,
      modifDate
    ]);
  }
}
