/*import 'dart:io';
import 'package:aes_crypt/aes_crypt.dart';
import 'package:flutter/widgets.dart';
import 'package:test/Classes/Exception/storageException.dart';
import 'dart:typed_data';
import 'storage.dart';

class EncryptFile implements Exception{
  static void encrypt_file(String path,String id) async{
    AesCrypt crypt = AesCrypt();
    crypt.setOverwriteMode(AesCryptOwMode.warn);
    crypt.setPassword('my cool password'); // à changer
    String encFilepath;
    try {
      encFilepath = crypt.encryptTextToFileSync((await Storage.getKey("${id}Key")).base64+(await Storage.getIV("${id}IV")).base64, path);
    } on AesCryptException catch (e) {
      if (e.type == AesCryptExceptionType.destFileExists) {
        throw AesCryptException("Fichier déjà existant !!", e.type);
      }
      else{
        throw AesCryptArgumentError("Erreur lors du chiffrage du fichier.");
      }
    }
  }

  static String decrypt_file(String path) {
    AesCrypt crypt = AesCrypt();
    crypt.setOverwriteMode(AesCryptOwMode.warn);
    crypt.setPassword('my cool password');  // voir pour mettre le mdp de l'utilisateur
    String key;
    try{
      key = crypt.decryptTextFromFileSync(path);
      if(key.isEmpty){
        throw AesCryptArgumentError("Erreur lors du déchiffrage du fichier");
      }
      return key;
    } on AesCryptException catch (e){
      if (e.type == AesCryptExceptionType.destFileExists) {
        throw AesCryptException("Erreur lors du déchiffrage du fichier", e.type);
      }
      else{
        throw AesCryptArgumentError("Erreur lors du déchiffrage du fichier");
      }
    }
  }
}*/