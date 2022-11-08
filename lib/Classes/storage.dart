import 'dart:io';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'storage_item.dart';
import 'secureStorage.dart';

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
    var base = storer.read(key: "${id}Key");
    // Problème avec String? et String
      // Ne peut pas être nul on check si le login existe avant
      // On peut afficher au user qu'il n'a pas importer sa clé sinon
    late final cle = encrypt.Key.fromBase64(base);
    return cle;
  }


  static Future<encrypt.IV> getIV(String id) async {
    const storer = FlutterSecureStorage();
    var base = storer.read(key: "${id}IV");
    // Problème avec String? et String
      // Ne peut pas être nul on check si le login existe avant
      // On peut afficher au user qu'il n'a pas importer sa clé sinon
    late final iv = encrypt.IV.fromBase64(base);
    return iv;
  }
}
