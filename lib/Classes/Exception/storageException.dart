class StorageException implements Exception {

  String message;

  StorageException(String m)
    :message = m;
}