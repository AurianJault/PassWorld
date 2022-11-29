import 'dart:io';
import 'package:bcrypt/bcrypt.dart';
import 'package:encrypt/encrypt.dart';
import 'package:test/Classes/account.dart';
import 'storage.dart';
import 'config.dart';
import 'package:path/path.dart' as p; // used in line 31

String account = "file.txt";

class Authentification {
  static Future<bool> authentification(String login, String mdp) async {
    var cp = Config();
    await cp.setAppDirPath();
    var list = await allUser(cp.appDirPath.path);
    var it = list.iterator;
    while (it.moveNext()) {
      if (it.current.id == login) {
        // vas chercher key + iv avec Storage.getKey(String id) / Storage.getIV(String id)
        var iv = Storage.getIV(it.current.id);
        var encrypter = Encrypter(AES(await Storage.getKey(it.current.id)));
        var sel = encrypter.decrypt(it.current.salt, iv: await iv);
        var tmp = BCrypt.hashpw(mdp, sel);
        return tmp == encrypter.decrypt(it.current.hash, iv: await iv);
      }
    }
    return false;
  }

// Charge les comptes déjà existant pour notre appli depuis un fichier texte (à upgrade)
  static Future<List<Account>> allUser(String path) async {
    var file = File(p.join(path, account));
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

  static Future<bool> register(String login, String mdp) async {
    var cp = Config();
    await cp.setAppDirPath();
    var listCpt = await allUser(cp.appDirPath.path);
    for (var i in listCpt) {
      if (i.id == login) return false;
    }
    listCpt.add(Account(login, mdp));
    ecriture(listCpt, p.join(cp.appDirPath.path, account));
    return true;
  }

// Ecrit dans un fichier
  static void ecriture(List<Account> list, String fichier) async {
    for (var i in list) {
      File(fichier).writeAsStringSync(
          "${i.id} ${i.salt.base64} ${i.hash.base64}\n",
          mode: FileMode.writeOnlyAppend);
    }
  }
}
