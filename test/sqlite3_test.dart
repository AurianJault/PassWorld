import 'package:sqlite3/sqlite3.dart';

void main() {
  var db = sqlite3.openInMemory();
  db.execute('''
      CREATE TABLE IF NOT EXISTS Passwords(
        id INTEGER PRIMARY KEY,
        name TEXT ,
        website TEXT NOT NULL,
        username TEXT,
        email TEXT,
        note TEXT,
        password TEXT NOT NULL,
        creationDate TEXT,
        modifDate TEXT
      );
    ''');

    DateTime d1 = DateTime.now();

    db.execute('''INSERT INTO Passwords VALUES(1,'name','website','username','email','note','password','creationDate',?);''',[d1.toIso8601String()]);

    db.select('''SELECT * FROM Passwords''');

    var d2;
    
    final ResultSet resultSet = db.select('SELECT * FROM Passwords');
    for (var row in resultSet){
      d2 = DateTime.parse(row['modifDate'].toString());
      print(row['modifDate'].toString());
    }

    print(d2);
}