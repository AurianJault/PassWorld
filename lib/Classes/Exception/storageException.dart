class StorageException implements Exception {

  final String message;

  StorageException(String m)
    :message = m;
}