import 'package:encrypt/encrypt.dart';
import 'package:bcrypt/bcrypt.dart';
import 'dart:io';
import 'dart:convert';

final key = Key.fromSecureRandom(32);
final iv = IV.fromLength(16);

Encrypted encrypt(String text){
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final finalCrypt = encrypter.encrypt(text, iv: iv);
  return finalCrypt;
} 

String decrypt(Encrypted text){
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final decrypt = encrypter.decrypt(text,iv: iv);
  return decrypt;
}

void hash(){
    final String salt = BCrypt.gensalt();
    final String password = 'password123';

    final String hash = BCrypt.hashpw(
    password,
    salt,
    );

    final bool check = BCrypt.checkpw(
    password,
    hash,
    );
    print("--------INFO--------");
    print("Password: $password");
    print("Salt: $salt");
    print("Hash: $hash");
    print("Check: $check");
}

/*void main() {
  final String login = "Pierre";
  final String salt = BCrypt.gensalt();
  final String password = 'password123';

  final String hash = BCrypt.hashpw(
    password,
    salt,
  );
  final crypt = encrypt(hash);

  var login1,password1;
  login1 = stdin.readLineSync(encoding: utf8);
  password1 = stdin.readLineSync(encoding: utf8);

  if(login1 == login){
    final String hash1 = BCrypt.hashpw(password1, salt);
    if(decrypt(crypt) == hash1){
      print("Vous êtes connecté");
    }
}*/