import 'package:encrypt/encrypt.dart' as encrypt;
import 'chiffrement.dart';
import 'compte.dart';
import 'dart:io';
import 'storage_item.dart';
import 'secureStorage.dart';

class Storage{
  static final SecureStorage storage = SecureStorage();
  late encrypt.Key key;
  late encrypt.IV iv;

  void setKey(String id) async{
    var test = await storage.containsKeyInSecureData(id+"Key");
    if(test){
      key = encrypt.Key.fromBase64(await storage.readSecureData(id+"Key")??"");
    }
    else{
      key = encrypt.Key.fromSecureRandom(32);
      storage.writeSecureData(StorageItem(id+"Key", key.base64));
    }
  }

  encrypt.Key getKey() {
    return key;
  }

  void setIV(String id) async{
    var test = await storage.containsKeyInSecureData(id+"IV");
    if(test){
      iv = encrypt.IV.fromBase64(await storage.readSecureData(id+"IV")??"");
    }
    else{
      iv = encrypt.IV.fromSecureRandom(16);
      storage.writeSecureData(StorageItem(id+"IV", iv.base64));
    }
  }

  encrypt.IV getIV(){
    return iv;
  }

}