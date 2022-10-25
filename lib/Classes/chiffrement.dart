import 'package:bcrypt/bcrypt.dart';
import 'package:encrypt/encrypt.dart';


class Chiffrement
{
  late Encrypted salt;
  late Encrypted hash;

  Chiffrement(String mdp,Key key,IV iv)
  {
    var ec = Encrypter(AES(key));
    salt = ec.encrypt(BCrypt.gensalt(),iv: iv);
    hash = ec.encrypt(BCrypt.hashpw(mdp, ec.decrypt(salt)),iv: iv);
  }
  Chiffrement.old(Encrypted salty,Encrypted hashy)
  {
    salt = salty;
    hash = hashy;
  }
  @override
  bool operator ==(Object c)
  {
    if(identical(this, c))
      return true;
    return false;
  }
}