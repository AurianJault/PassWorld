import 'dart:io';
import 'package:aes_crypt/aes_crypt.dart';
import 'storage.dart';
import 'package:flutter_test/flutter_test.dart';

class EncryptFile{
  // ignore: non_constant_identifier_names
  static void encrypt_file(String path) async{
    AesCrypt crypt = AesCrypt();
    crypt.setOverwriteMode(AesCryptOwMode.on);
    crypt.setPassword('my cool password');
    String encFilepath;
    try {
      encFilepath = crypt.encryptTextToFileSync((await Storage.getKey("Pierre")).base64, path);
      print('The encryption has been completed successfully.');
      print('Encrypted file: $encFilepath');
    } catch (e) {
      /*if (e.type == AesCryptExceptionType.destFileExists) {
        print('The encryption has been completed unsuccessfully.');
        print(e.message);
      }
      else{
        // message d'erreur
      }*/
    }
  }

  static String decrypt_file(String path) {
    AesCrypt crypt = AesCrypt();
    crypt.setOverwriteMode(AesCryptOwMode.on);
    crypt.setPassword('my cool password');
    String key;
    try {
      key = crypt.decryptTextFromFileSync(path);
      print('The decryption has been completed successfully.');
      print('Decrypted file 1: $path');
      print('File content: ' + File(path).path);
      return key;
    } catch (e) {
      if (e == AesCryptExceptionType.destFileExists) {
        print('The decryption has been completed unsuccessfully.');
        print('e.message');
        throw(e);
      }
      else{
        return 'ERROR';
      }
    }
  }
}

void main(List<String> args) {
  TestWidgetsFlutterBinding.ensureInitialized();
  Storage.ajouterKeyIV("Pierre");
  print(EncryptFile.decrypt_file("./lib/test.txt"));
}