import 'dart:io';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'storage_item.dart';
import 'secureStorage.dart';
import 'fileEncrypt.dart';

class Storage {
  static final SecureStorage storage = SecureStorage();

  static storing(encrypt.Key cle, encrypt.IV iv, String nom) {
    // créer un storageElement
    var itemKle = StorageItem("${nom}Key", cle.base64);
    var itemIV = StorageItem("${nom}IV", iv.base64);
    // Instacie un FlutterSecureStorage()
    const storer = FlutterSecureStorage();
    // Ajoute Clé + IV
    storer.write(key: itemKle.key, value: itemKle.value);
    storer.write(key: itemIV.key, value: itemIV.value);
  }

  static Future<encrypt.Key> getKey(String id) async {
    const storer = FlutterSecureStorage();
    bool testCle = await storer.containsKey(key: "${id}Key");
    if(!testCle){
      //mettre message d'erreur ici
    }
    var base =await storer.read(key: "${id}Key")??"";
    late final cle = encrypt.Key.fromBase64(base);
    return cle;
  }


  static Future<encrypt.IV> getIV(String id) async {
    const storer = FlutterSecureStorage();
    bool testIV = await storer.containsKey(key: "${id}IV");
    if(!testIV){
      //mettre message d'erreur ici
    }
    String base =await storer.read(key: "${id}IV")??"";
    late final iv = encrypt.IV.fromBase64(base);
    return iv;
  }

  static Future<void> ajouterKeyIV(String id) async{
    const storer = FlutterSecureStorage();
    bool testKey = await storer.containsKey(key: "${id}Key");
    bool testIV = await storer.containsKey(key: "${id}IV");
    if(testKey && testIV){
      //mettre message d'erreur ici
    }
    storing(encrypt.Key.fromSecureRandom(32), encrypt.IV.fromSecureRandom(16), id);
  }

  static Future<void> newMasterKey(String id) async{
    const storer = FlutterSecureStorage();
    bool testKey = await storer.containsKey(key: "${id}IV");
    bool testIV = await storer.containsKey(key: "${id}IV");
    if(!testKey && !testIV){
      //mettre message d'erreur ici
    }
    // vérifier que tout est bien déchiffré avant
    storing(encrypt.Key.fromSecureRandom(32), encrypt.IV.fromSecureRandom(16), id);
  }

  static Future<void> newMasterKeyFromFile(String path,String id) async{
    const storer = FlutterSecureStorage();    
    String keyIv = EncryptFile.decrypt_file(path)??"";
    bool testKey = await storer.containsKey(key: "${id}Key");
    bool testIV = await storer.containsKey(key: "${id}IV");
    if(!testKey && !testIV){
      //mettre message d'erreur ici
    }
    storing(encrypt.Key.fromBase64(keyIv.substring(0,43)), encrypt.IV.fromBase64(keyIv.substring(44)), id);
  }
}
