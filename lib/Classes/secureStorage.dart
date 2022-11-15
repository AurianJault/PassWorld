import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'storage_item.dart';

class SecureStorage{

  final options = IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
     encryptedSharedPreferences: true,
   );

  // Initialisation du storage
  final _secureStorage = const FlutterSecureStorage();

  // Ajoute l'item au storage
  Future<void> writeSecureData(StorageItem newItem) async {
    await _secureStorage.write(key: newItem.key, value: newItem.value, aOptions: _getAndroidOptions(), iOptions: options);
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