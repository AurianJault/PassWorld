import 'package:flutter/widgets.dart';
import 'package:test/Classes/yubikey_related/two_fa.dart';
import 'package:encrypt/encrypt.dart';
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
      "conventional": true,
      "yubikey_only": false,
      "twoFA_with_yubikey": false
    };
  }

  Account.manager() {
    _id = 'null';
    _masterPassword = Chiffrement('null', _id);
    _secondFactors = List.empty(growable: true);
    authMethod = {
      "conventional": true,
      "yubikey_only": false,
      "twoFA_with_yubikey": false
    };
  }

  Account.old(String id, Encrypted salty, Encrypted hashy) : _id = id {
    _masterPassword = Chiffrement.old(salty, hashy);
    // Fonction chargeant _vault
    fillVault();
  }

  // Methods
  void fillVault() {
    PassFile base = PassFile(_id);
    _vault = base.loadPasswords();
  }

  void saveFile() {
    PassFile base = PassFile(_id);
    // Check File ?
    base.savePasswords(_vault);
  }

  void changeMasterPassword(String mdp) {
    _masterPassword = Chiffrement(mdp, _id);
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

  @override
  bool operator ==(Object c) {
    if (identical(this, c)) {
      return true;
    }
    return false;
  }
}
