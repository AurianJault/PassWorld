import 'package:bcrypt/bcrypt.dart';
import 'package:encrypt/encrypt.dart';

void display(bool res) {
  print("Check password: $res");
  return;
}

void trueFunc(password, hash) {
  bool res = BCrypt.checkpw(password, hash);
  display(res);
  return;
}

void aurianFunc(String password, String salt, String hash) {
  var newHash = BCrypt.hashpw(password, salt);
  display(newHash == hash);
  return;
}

void main() async {
  var password = "coucou123";
  var salt = BCrypt.gensalt();
  var hash = BCrypt.hashpw(password, salt);
  aurianFunc(password, salt, hash);
  trueFunc(password, hash);

  var iv = IV.fromSecureRandom(16);
  var key = Key.fromSecureRandom(32);
  var encrypter = Encrypter(AES(key));

  print(encrypter.encrypt(hash, iv: iv).base64);
  print(encrypter.encrypt(hash, iv: iv).base64);
}
