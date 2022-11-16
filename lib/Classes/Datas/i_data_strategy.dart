import 'package:test/Classes/password.dart';
import 'package:test/Classes/vault.dart';

abstract class IDataStrategy{
  Vault loadPasswords();
  void savePasswords(Vault passwords);
}