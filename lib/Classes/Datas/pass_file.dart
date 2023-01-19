import 'package:sqlite3/sqlite3.dart';
import 'package:test/Classes/password.dart';
import 'package:test/Classes/Datas/i_data_strategy.dart';
import 'package:test/Classes/vault.dart';
import 'package:path/path.dart' as p;
import 'package:test/Classes/yubikey_related/two_fa.dart';
import 'package:test/Classes/yubikey_related/yubikey.dart';

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

    db.execute('''
        CREATE TABLE IF NOT EXISTS Yubikey(
          id TEXT PRIMARY KEY,
          name TEXT,
          staticPassword TEXT
        );
     ''');

     db.execute('''
        CREATE TABLE IF NOT EXISTS Authentification(
          conventional INTEGER
          yubikey_only INTEGER
          twoFA_with_yubikey INTEGER
          twoFA_with_biometric INTEGER
          biometric_only INTEGER
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
      insertValueP(
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

  @override
  void saveSecondFactors(List<TwoFA> secondFactors) {
    db.execute("DELETE FROM Yubikey");
    for (var element in secondFactors) {
      if(element is Yubikey) {
        insertValueY(
        element.id,
        element.nom,
        element.staticPassword,
        );
      }
    }
  }

  void insertValueP(
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

  @override
  List<TwoFA> loadSecondFactors() {
    initPass();
    List<TwoFA> secondFactors = List.empty(growable: true);
    final ResultSet resultSet = db.select('SELECT * FROM Yubikey');
    for (final Row row in resultSet) {
      secondFactors.add(
        Yubikey( 
          row['id'].toString(), 
          row['name'].toString(), 
          row['staticPassword'].toString())
      );
    }
    return secondFactors;
  }

    void insertValueY(
      String? id,
      String? name,
      String? sp) {
    db.execute("INSERT INTO Yubikey VALUES (?,?,?)", [
      id,
      name,
      sp
    ]);
  }
  
  @override
  Map<String, bool> loadAuth() {
    Map<String,bool> authMethod = {
      "conventional": false,
      "yubikey_only": false,
      "twoFA_with_yubikey": false,
      "twoFA_with_biometric": false,
      "biometric_only": false
    };

    final ResultSet resultSet = db.select('SELECT * FROM Authentification');
    for (final Row row in resultSet) {
      if(row['conventional'] == 0){
        authMethod['conventional'] = false;
      } else {
        authMethod['conventional'] = true;
      }
      if(row['yubikey_only'] == 0){
        authMethod['yubikey_only'] = false;
      } else {
        authMethod['yubikey_only'] = true;
      }
      if(row['twoFA_with_yubikey'] == 0){
        authMethod['twoFA_with_yubikey'] = false;
      } else {
        authMethod['twoFA_with_yubikey'] = true;
      }
      if(row['twoFA_with_biometric'] == 0){
        authMethod['twoFA_with_biometric'] = false;
      } else {
        authMethod['twoFA_with_biometric'] = true;
      }
      if(row['biometric_only'] == 0){
        authMethod['biometric_only'] = false;
      } else {
        authMethod['biometric_only'] = true;
      }
    }

    return authMethod;
  }
  
  @override
  void saveMethodesAuth(Map<String, bool> authMethod) {
    db.execute("DELETE FROM Authentification");
    int conv = 0;
    int yubikey_only = 0;
    int twoFA_with_yubikey = 0;
    int twoFA_with_biometric = 0;
    int biometric_only = 0;

    authMethod.forEach((key, value) {
      if(key == "conventional"){
        if(value == true){
          conv = 1;
        } else {
          conv = 0;
        }
      }
      if(key == "yubikey_only"){
        if(value == true){
          yubikey_only = 1;
        } else {
          yubikey_only = 0;
        }
      }
      if(key == "twoFA_with_yubikey"){
        if(value == true){
          twoFA_with_yubikey = 1;
        } else {
          twoFA_with_yubikey = 0;
        }
      }
      if(key == "twoFA_with_biometric"){
        if(value == true){
          twoFA_with_biometric = 1;
        } else {
          twoFA_with_biometric = 0;
        }
      }
      if(key == "biometric_only"){
        if(value == true){
          biometric_only = 1;
        } else {
          biometric_only = 0;
        }
      }
    });
    insertValueA(
      conv, 
      yubikey_only, 
      twoFA_with_yubikey, 
      twoFA_with_biometric, 
      biometric_only);
  }

  void insertValueA(
      int? conv,
      int? yubikey_only,
      int? twoFA_with_yubikey,
      int? twoFA_with_biometric,
      int? biometric_only) {
    db.execute("INSERT INTO Authentification VALUES (?,?,?,?,?)", [
      conv,
      yubikey_only,
      biometric_only,
      twoFA_with_yubikey,
      twoFA_with_biometric
    ]);
  }
}
