import 'dart:io';
import 'package:encryptor/encryptor.dart';

void main() {
  String test = "test";
  String? s = stdin.readLineSync();
  final key = s ?? "";
  var encrypted = Encryptor.encrypt(key, test);
  print(encrypted);
}
