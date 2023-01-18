import 'package:test/Classes/vault.dart';
import 'package:test/Classes/yubikey_related/two_fa.dart';

abstract class IDataStrategy{
  Vault loadPasswords();
  List<TwoFA> loadSecondFactors();
  void savePasswords(Vault passwords);
  void saveSecondFactors( List<TwoFA> secondFactors);
}