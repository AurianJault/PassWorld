import 'package:flutter/widgets.dart';
import 'package:test/Classes/yubikey_related/two_fa.dart';
import 'package:encrypt/encrypt.dart';
import 'package:test/Classes/yubikey_related/yubikey.dart';
import 'chiffrement.dart';
import 'vault.dart';
import 'Datas/pass_file.dart';

class Account with ChangeNotifier {
  // Fields
  late String _id;
  late Chiffrement _masterPassword;
  late Map<String, bool>
      authMethod; // conventional, yubikey_only, twoFA_with_yubikey
  Vault _vault = Vault();
  late List<TwoFA> _secondFactors;

  // Constructors
  Account(String id, String mdp) : _id = id {
    _masterPassword = Chiffrement(mdp, id);
    _secondFactors = List.empty(growable: true);
    authMethod = {
      "conventional": false,
      "yubikey_only": true,
      "twoFA_with_yubikey": false,
      "twoFA_with_biometric": false,
      "biometric_only": false
    };
  }

  Account.manager() {
    _id = 'null';
    _masterPassword = Chiffrement('null', _id);
    _secondFactors = List.empty(growable: true);
    authMethod = {
      "conventional": false,
      "yubikey_only": true,
      "twoFA_with_yubikey": false,
      "twoFA_with_biometric": false,
      "biometric_only": false
    };
  }

  Account.old(String id, Encrypted salty, Encrypted hashy) : _id = id {
    _masterPassword = Chiffrement.old(salty, hashy);
    // Fonction chargeant _vault
    //fillVault(); // Maybe uncomment
  }

  // Methods
  void fillVault(String appDirPath) {
    PassFile base = PassFile(_id, appDirPath);
    _vault = base.loadPasswords();
    _secondFactors = base.loadSecondFactors();
    authMethod = base.loadAuth();
  }

  void saveFile(String appDirPath) {
    PassFile base = PassFile(_id, appDirPath);
    // Check File ?
    base.savePasswords(_vault);
    base.saveSecondFactors(secondFactors);
    base.saveMethodesAuth(authMethod);
  }

  void changeMasterPassword(String mdp) {
    _masterPassword = Chiffrement(mdp, _id);
  }

  bool findYubikey(String otp){
    bool res = false;
    secondFactors.forEach((element) {
      if(element is Yubikey){
        if(element.id == otp.substring(0,12)){
          res = true;
        }
      }
    });
    return res;
  }

  // Getter
  Encrypted get hash {
    return _masterPassword.hash;
  }

  Encrypted get salt {
    return _masterPassword.salt;
  }

  Vault get vault {
    return _vault;
  }

  String get id {
    return _id;
  }

  List<TwoFA> get secondFactors {
    return _secondFactors;
  }

  // Setter

  set setId(String s) {
    _id = s;
  }

  TwoFA? accessTfa(int i) {
    if (_secondFactors.isEmpty) {
      return null;
    } else {
      return _secondFactors[i];
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return false;
  }
}
