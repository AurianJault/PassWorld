import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test/Classes/Exception/storageException.dart';
import 'storage_item.dart';
import 'secureStorage.dart';
import 'fileEncrypt.dart';

class Storage implements Exception{
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
      throw StorageException("L'utilisateur n'existe pas");
    }
    var base =await storer.read(key: "${id}Key")??"";
    if(base.isEmpty){
      throw StorageException("Problème de récupération de clé !!");
    }
    late final cle = encrypt.Key.fromBase64(base);
    return cle;
  }


  static Future<encrypt.IV> getIV(String id) async {
    const storer = FlutterSecureStorage();
    bool testIV = await storer.containsKey(key: "${id}IV");
    if(!testIV){
      throw StorageException("L'utilisateur n'existe pas !!");
    }
    String base =await storer.read(key: "${id}IV")??"";
    if(base.isEmpty){
      throw StorageException("Problème de récupation de l'IV !!");
    }
    late final iv = encrypt.IV.fromBase64(base);
    return iv;
  }

  static Future<void> ajouterKeyIV(String id) async{
    const storer = FlutterSecureStorage();
    bool testKey = await storer.containsKey(key: "${id}Key");
    bool testIV = await storer.containsKey(key: "${id}IV");
    if(testKey && testIV){
      throw StorageException("Clé et IV déjà existante");
    }
    storing(encrypt.Key.fromSecureRandom(32), encrypt.IV.fromSecureRandom(16), id);
  }

  static Future<void> newMasterKey(String id) async{
    const storer = FlutterSecureStorage();
    bool testKey = await storer.containsKey(key: "${id}IV");
    bool testIV = await storer.containsKey(key: "${id}IV");
    if(!testKey && !testIV){
      throw StorageException("Clé et IV inexistante");
    }
    // vérifier que tout est bien déchiffré avant
    storing(encrypt.Key.fromSecureRandom(32), encrypt.IV.fromSecureRandom(16), id);
  }

  static Future<void> newMasterKeyFromFile(String path,String id) async{
    const storer = FlutterSecureStorage();    
    String keyIv = EncryptFile.decrypt_file(path);
    bool testKey = await storer.containsKey(key: "${id}Key");
    bool testIV = await storer.containsKey(key: "${id}IV");
    if(!testKey && !testIV){
      //mettre message d'erreur ici
    }
    storing(encrypt.Key.fromBase64(keyIv.substring(0,43)), encrypt.IV.fromBase64(keyIv.substring(44)), id);
  }
}
