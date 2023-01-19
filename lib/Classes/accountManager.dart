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

  static Map<String, bool> chooseAuthentificationMethod(Account a, int i) {
    switch (i) {
      case 1:
        a.authMethod.forEach((key, value) {
          a.authMethod[key] = false;
        });
        a.authMethod['conventional'] = true;
        break;
      case 2:
        a.authMethod.forEach((key, value) {
          a.authMethod[key] = false;
        });
        a.authMethod['yubikey_only'] = true;
        break;
      case 3:
        a.authMethod.forEach((key, value) {
          a.authMethod[key] = false;
        });
        a.authMethod['twoFA_with_yubikey'] = true;
        break;
      case 4:
        a.authMethod.forEach((key, value) {
          a.authMethod[key] = false;
        });
        a.authMethod['twoFA_with_biometric'] = true;
        break;
      case 5:
        a.authMethod.forEach((key, value) {
          a.authMethod[key] = false;
        });
        a.authMethod['biometric_only'] = true;
        break;
    }
    return a.authMethod;
  }

  static getAuthMethod(Account a){
    String res = '';
    a.authMethod.forEach((key, value) {
      if(a.authMethod[key] == true) {
        res = key;
      }
    });
    return res;
  }
}
