import 'package:bcrypt/bcrypt.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:test/Classes/account.dart';
import 'package:test/Classes/authentification.dart';
import 'config.dart';
import 'storage.dart';

class Chiffrement {
  late encrypt.Encrypted salt;
  late encrypt.Encrypted hash;

  Chiffrement(String mdp, String id) {
    // Création Salt + hash
    var sel = BCrypt.gensalt();
    var chat = BCrypt.hashpw(mdp, sel);
    // Création Clé + IV
    var key = encrypt.Key.fromSecureRandom(32);
    var iv = encrypt.IV.fromSecureRandom(16);
    // Méthode de chiffrement
    var ec = encrypt.Encrypter(encrypt.AES(key));
    // Chiffrement de hash + sel
    salt = ec.encrypt(sel, iv: iv);
    hash = ec.encrypt(chat, iv: iv);
    // Stockage de clé dans storage
    Storage.storing(key, iv, id);
  }

  Chiffrement.old(encrypt.Encrypted salty, encrypt.Encrypted hashy) {
    salt = salty;
    hash = hashy;
    //Storage.storing(key, iv, id);
  }

  Chiffrement.last(String path, List<Account> listAccount) {
    for (Account account in listAccount) {
      salt = account.salt;
      hash = account.hash;
    }
  }

  @override
  bool operator ==(Object c) {
    if (identical(this, c)) return true;
    return false;
  }
}
