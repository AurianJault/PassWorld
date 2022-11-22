import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

class Try {
  static Path() async {
    var path = await getApplicationDocumentsDirectory();
    print(path.path);
    var res = "${path.path}/test.sqlite3";
    print(res);

    var db = sqlite3.open(res);
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
    db.execute("INSERT INTO Passwords VALUES (?,?,?,?,?,?,?,?,?)", [
      1,
      "name",
      "website",
      "username",
      "email",
      "note",
      "password",
      "creationDate",
      "modifDate"
    ]);
  }
}
