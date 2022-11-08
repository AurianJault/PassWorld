import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'storage_item.dart';

class SecureStorage{

  // Initialisation du storage
  final _secureStorage = const FlutterSecureStorage();

  // Ajoute l'item au storage
  Future<void> writeSecureData(StorageItem newItem) async {
    await _secureStorage.write(key: newItem.key, value: newItem.value);
  }

  // Lit l'item du storage
  Future<String?> readSecureData(String key) async {
    var readData = await _secureStorage.read(key: key);
    return readData;
  }

  // Vérifie si l'item avec la clé existe
  Future<bool> containsKeyInSecureData(String key) async {
    var containsKey = await _secureStorage.containsKey(key: key);
    return containsKey;
  }

  // Supprime tout le storage
  Future<void> deleteAllSecureData() async {
    await _secureStorage.deleteAll();
  }
}