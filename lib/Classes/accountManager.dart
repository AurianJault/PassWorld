import 'package:test/Classes/yubikey_related/two_fa.dart';
import 'package:test/Classes/yubikey_related/yubikey.dart';

import 'account.dart';

class AccountManager{

  // static void changeMasterPassword(Account a, string m)
  
  static void addYubikey(Account a, String name, String id){
    TwoFA yubikey = Yubikey(name, id); 
    a.secondFactors.add(yubikey);
  }

  static void chooseAuthentificationMethod(Account a, int i){
    if(i == 1) {
      a.authMethod = "conventional";
    }
    if(i == 2) {
      a.authMethod = "yubikey_only";
    }
    if(i == 3) {
      a.authMethod = "twoFA_with_yubikey";
    }
  }
}