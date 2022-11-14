import 'package:test/Classes/yubikey_related/two_fa.dart';
import 'package:encrypt/encrypt.dart';
import 'chiffrement.dart';
import 'vault.dart';
import 'Datas/pass_file.dart';

class Account {
  late String _id;
  late Chiffrement _masterPassword;
  late Map<String, bool>
      authMethod; // conventional, yubikey_only, twoFA_with_yubikey
  late Vault _vault;
  late List<TwoFA> _secondFactors;

  Account(String id, String mdp) 
  :_id = id
  {
    _masterPassword = Chiffrement(mdp, id);
    _vault = Vault();
    _secondFactors = List.empty(growable: true);
    authMethod = {
      "conventional": true,
      "yubikey_only": false,
      "twoFA_with_yubikey": false
    };
  }

  Account.old(String id, Encrypted salty, Encrypted hashy) 
  :_id = id
  {
    _masterPassword = Chiffrement.old(salty, hashy);
    // Fonction chargeant _vault
    //fillVault();
  }

  void fillVault() {
    PassFile base = PassFile(_id);
    _vault.passwordList = base.loadPasswords();
  }

  void saveFile() {
    PassFile base = PassFile(_id);
    // Check File ?
    base.savePasswords(_vault.passwordList);
  }

  Encrypted get hash {
    return _masterPassword.hash;
  }

  Encrypted get salt {
    return _masterPassword.salt;
  }

  Vault get vlt {
    return _vault;
  }

  String get id {
    return _id;
  }

  List<TwoFA> get secondFactors {
    return _secondFactors;
  }

  @override
  bool operator ==(Object c) {
    if (identical(this, c)) {
      return true;
    }
    return false;
  }
}
