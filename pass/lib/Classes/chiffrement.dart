import 'package:bcrypt/bcrypt.dart';
import 'package:encrypt/encrypt.dart';
import 'package:test/crypt.dart';


class Chiffrement
{
  late Encrypted salt;
  late Encrypted hash;

  Chiffrement(String mdp,Key key,IV iv)
  {
    late final encrypter = Encrypter(AES(key));
    salt = encrypter.encrypt(BCrypt.gensalt(),iv : iv);
    hash = encrypter.encrypt(BCrypt.hashpw(mdp, encrypter.decrypt(salt,iv: iv),),iv: iv);
  }
  Chiffrement.old(Encrypted salty,Encrypted hashy)
  {
    salt = salty;
    hash = hashy;
  }
  @override
  bool operator ==(Object c)
  {
    if(identical(this, c)) {
      return true;
    }
    return false;
  }
}