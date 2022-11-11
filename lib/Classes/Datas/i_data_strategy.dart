import 'package:test/Classes/password.dart';

abstract class IDataStrategy{
  List<Password> loadPasswords();
  void savePasswords(List<Password> passwords);
}