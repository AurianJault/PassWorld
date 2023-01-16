import 'dart:io';
import 'package:bcrypt/bcrypt.dart';
import 'package:encrypt/encrypt.dart';
import 'package:http/http.dart';
import 'package:test/Classes/account.dart';
import 'package:test/Classes/api_client.dart';
import 'storage.dart';
import 'config.dart';
import 'package:path/path.dart' as p; // used in line 31

class Authentification {
  static String accountFile = "file.txt";

  static Future<bool> authentication(String login, String mdp) async {
    var cp = Config();
    await cp.setAppDirPath();
    var list = allUser(cp.appDirPath.path);
    var it = list.iterator;
    while (it.moveNext()) {
      if (it.current.id == login) {
        // vas chercher key + iv avec Storage.getKey(String id) / Storage.getIV(String id)
        var iv = await Storage.getIV(it.current.id);
        var encrypter = Encrypter(AES(await Storage.getKey(it.current.id)));
        var hash = encrypter.decrypt(it.current.hash, iv: iv);
        return BCrypt.checkpw(mdp, hash);
      }
    }
    return false;
  }

// Charge les comptes déjà existant pour notre appli depuis un fichier texte (à upgrade)
  static List<Account> allUser(String path) {
    var file = File(p.join(path, accountFile));
    List<Account> lst = List.empty(growable: true);
    List<String> stream = file.readAsLinesSync();
    for (var element in stream) {
      var arr = element.split(' ');
      var salt = Encrypted.fromBase64(arr[1]);
      var hash = Encrypted.fromBase64(arr[2]);
      lst.add(Account.old(arr[0], salt, hash));
    }
    return lst;
  }

  static Future<bool> register(String email, String password) async {
    // TODO : add global config to parameter
    var cp = Config();
    await cp.setAppDirPath();
    var listCpt = await allUser(cp.appDirPath.path);
    for (var i in listCpt) {
      if (i.id == email) return false;
    }
    Account newAccount = Account(email, password);
    var requestResponse = await ClientAPI.register(
        email, newAccount.hash.base64, newAccount.salt.base64);

    if (requestResponse.statusCode != 201) {
      print("Register status code = ${requestResponse.statusCode}");
      return false;
    }

    listCpt.add(newAccount);
    ecriture(listCpt, p.join(cp.appDirPath.path, accountFile));
    return true;
  }

// Ecrit dans un fichier
  static void ecriture(List<Account> list, String fichier) async {
      File(fichier).writeAsStringSync("");
    for (var i in list) {
      File(fichier).writeAsStringSync(
          "${i.id} ${i.salt.base64} ${i.hash.base64}\n",
          mode: FileMode.writeOnlyAppend
      );
    }
  }

  static Future<bool> apiAuthentication(String mail, String password) async {
    // TODO
    Response requestResponse = await ClientAPI.authenticator(mail, password);

    if (requestResponse.statusCode != 200) {
      print("Problem request status code is ${requestResponse.statusCode}");
      return false;
    }

    bool res = requestResponse.body as bool;
    return res;
  }
}
