import 'dart:io';
import 'package:bcrypt/bcrypt.dart';
import 'package:encrypt/encrypt.dart';
import 'package:test/Classes/account.dart';
import 'storage.dart';

class Authentification {
  static Future<bool> authentification(String login, String mdp) async {
    var list = await allUser();
    var it = list.iterator;
    while (it.moveNext()) {
      if (it.current.id == login) {
        // vas chercher key + iv avec Storage.getKey(String id) / Storage.getIV(String id)
        var key = Storage.getKey(it.current.id);
        var iv = Storage.getIV(it.current.id);
        var encrypter = Encrypter(AES(key));
        var sel = encrypter.decrypt(it.current.salt, iv: iv);
        var tmp = BCrypt.hashpw(mdp, sel);
        return tmp ==
            encrypter.decrypt(it.current.hash, iv: iv);
      }
    }
    return false;
  }

// Charge les comptes déjà existant pour notre appli depuis un fichier texte (à upgrade)
  static Future<List<Account>> allUser() async {
    var file = File("file.txt");
    List<Account> lst = List.empty(growable: true);
    List<String> stream = file.readAsLinesSync();
    stream.forEach((element) {
      var arr = element.split(' ');
      var salt = Encrypted.fromBase64(arr[1]);
      var hash = Encrypted.fromBase64(arr[2]);
      lst.add(Account.old(arr[0], salt, hash));
    });
    return lst;
  }

  static Future<bool> register(String login, String mdp) async {
    var listCpt = await allUser();
    for (var i in listCpt) {
      if (i.id == login) return false;
    }
    listCpt.add(Account(login, mdp));
    ecriture(listCpt, "file.txt");
    return true;
  }

// Ecrit dans un fichier
  static void ecriture(List<Account> list, String fichier) async {
    for (var i in list) {
      File(fichier).writeAsStringSync(
          "${i.id} ${i.salt.base64} ${i.hash.base64}\n",
          mode: FileMode.append);
    }
  }
}
