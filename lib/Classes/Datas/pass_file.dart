import 'package:sqlite3/sqlite3.dart';
import 'package:test/Classes/password.dart';
import 'package:test/Classes/Datas/i_data_strategy.dart';

class PassFile extends IDataStrategy{
var db;
  PassFile(String identifiant){
    db=sqlite3.open("lib/Classes/Datas/passwords/$identifiant.txt");
  }

  void initPass(){
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
  List<Password> loadPasswords(){
    initPass();
    var passwords = List<Password>.empty(growable: true);
    final ResultSet resultSet = db.select('SELECT * FROM Passwords');
    for(final Row row in resultSet){
      if(row['creationDate'].toString()!='null'){
        passwords.add(Password(row['id'],row['name'].toString(),row['password'],row['website'].toString(),row['username'].toString(),row['email'].toString(),row['note'].toString(),DateTime.parse(row['creationDate'].toString()),DateTime.parse(row['modifDate'].toString())));
      }
    }
    return passwords;
  }

  @override
  void savePasswords(List<Password> passwords){
    db.execute("DELETE FROM Passwords");
    for (var element in passwords) { 
      insertValue(element.getId, element.getName, element.getWebsite, element.getUsername,element.getEmail,element.getNote,element.getPassword,element.getCreationDate?.toIso8601String(),element.getModifDate?.toIso8601String());
    }
  }

  void insertValue(int id,String? name,String? website,String? username,String? email,String? note, String? password,String? creationDate,String? modifDate){
    db.execute("INSERT INTO Passwords VALUES (?,?,?,?,?,?,?,?,?)",[id,name,website,username,email,note,password,creationDate,modifDate]);
  }

}