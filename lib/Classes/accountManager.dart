import 'package:test/Classes/yubikey_related/two_fa.dart';
import 'package:test/Classes/yubikey_related/yubikey.dart';

import 'account.dart';

class AccountManager {
  // static void changeMasterPassword(Account a, string m)

  static void addYubikey(Account a, String name, String id, String sp) {
    TwoFA yubikey = Yubikey(name, id,sp);
    a.secondFactors.add(yubikey);
  }

  static bool isNewYubikey(Account a, String id){
    for (TwoFA y in a.secondFactors) {
      if(y is Yubikey){
        if(y.id == id){
          return false;
        }
      }
    }
    return true;
  }

  static void removeYubikey(Yubikey y, Account a) {
    a.secondFactors.remove(y);
  }

  static void chooseAuthentificationMethod(Account a, int i) {
    switch (i) {
      case 1:
        switch_auth_method(a.authMethod, "conventional");
        break;
      case 2:
        switch_auth_method(a.authMethod, "yubikey_only");
        break;
      case 3:
        switch_auth_method(a.authMethod, "twoFA_with_yubikey");
        break;
      case 4:
        switch_auth_method(a.authMethod, "twoFA_with_biometric");
        break;
      case 5:
        switch_auth_method(a.authMethod, "biometric_only");
        break;
    }
  }

  static void switch_auth_method(Map<String, bool> m, String method) {
    m.forEach((key, value) {
      if (key == method) {
        value = true;
      } else {
        value = false;
      }
    });
  }
}
