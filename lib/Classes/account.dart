import 'package:encrypt/encrypt.dart';
import 'package:test/Classes/yubikey_related/two_fa.dart';
import 'chiffrement.dart';
import 'package:test/Classes/vault.dart';
import 'dart:io';

class Account {
  late String _id;
  late Chiffrement _masterPassword;
  late Map<String,bool> authMethod; // conventional, yubikey_only, twoFA_with_yubikey
  late Vault _vault;
  late List<TwoFA> _secondFactors;

  // pas sûr;
  // besoin de le créer avec l'iv et la clé que quand nécessaire
  Key key; // marche pas avec une autre clé
  IV iv = IV.fromLength(16);

  Account(String id, String mdp)
      : key = Key.fromUtf8("my 32 length key...............u") {
    _id = id;
    _masterPassword = Chiffrement(mdp, key, iv);
    _secondFactors = List.empty(growable: true);
    authMethod = {"conventional":true, "yubikey_only":false, "twoFA_with_yubikey":false};
    // Charge la liste des comptes liés a ce compte
    // chargement("listCompte.txt");
  }

  Account.old(String id, Encrypted salty, Encrypted hashy, Key key, IV iv)
      : this.key = key {
    iv = iv;
    _id = id;
    _masterPassword = Chiffrement.old(salty, hashy);
    //chargement("listCompte.txt");
  }
  Encrypted get hash {
    return _masterPassword.hash;
  }

  Encrypted get salt {
    return _masterPassword.salt;
  }

  Key get cle {
    return key;
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

  // Recherche un mot de passe dans la liste de mdp stocké pour un compte donné
  // String rechercherMdp(String nom, String id)
  // {
  //   _vault.forEach((element) {
  //     if(nom == element.nom && id == element.id)
  //     return mdp;
  //   });
  // }
  // Ajoute un mdp à stocker

  // AURIAN: Charge les mots de passe stockés dans un fichier (à upgrade)
  // REMI: Ne sert à rien pour l'appli finale
  /*
  void chargement(String fichier) {
    var file = File(fichier);
    List<String> stream = file.readAsLinesSync();
    stream.forEach((element) {
      var arr = element.split(' ');
      _vault.add(Password(arr[0], arr[1], arr[2], arr[3]));
    });
  }
  */
}
