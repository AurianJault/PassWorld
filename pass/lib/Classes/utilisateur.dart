import 'chiffrement.dart';
import 'compte.dart';
import 'package:encrypt/encrypt.dart';
import 'dart:io';

class Utilisateur
{
  late String _identifiant;
  late Chiffrement _motDePasse;
  late List<Compte> _vault;
  // pas sûr;
  // besoin de le créer avec l'iv et la clé que quand nécessaire
  Key key; // marche pas avec une autre clé
  IV iv = IV.fromLength(16);


  Utilisateur(String id, String mdp)
    : key = Key.fromUtf8("my 32 length key...............u")
  {
    _identifiant = id;
    _motDePasse = Chiffrement(mdp,key,iv);
    _vault = List.empty(growable: true);
    // Charge la liste des comptes liés a ce compte
    // chargement("listCompte.txt");
  }

  Utilisateur.old(String id,Encrypted salty,Encrypted hashy,Key key, IV iv)
  : this.key = key
  {
    iv = iv;
    _identifiant = id;
    _motDePasse=Chiffrement.old(salty,hashy);
    _vault=List.empty(growable: true);
    chargement("listCompte.txt");
  }
  Encrypted get hash {
    return _motDePasse.hash;
  }
  Encrypted get salt {
    return _motDePasse.salt;
  }

  Key get cle {
    return key;
  }

  List<Compte> get vlt 
  {
    return _vault;
  }

  String get identifiant {
    return _identifiant;
  }

  @override
  bool operator ==(Object c)
  {
    if(identical(this, c)) {
      return true;
    }
    return false;
  }
  // Recherche un mot de passe dans la liste de mdp stocké pour un compte donné
  // String rechercherMdp(String nom, String id)
  // {
  //   _vault.forEach((element) {
  //     if(nom == element.nom && id == element.identifiant)
  //     return mdp;
  //   });
  // }
  // Ajoute un mdp à stocker
  void ajouterMdp(Compte compte)
  {
    _vault.add(compte);
  }
  //supprime un mdp stocké
  void supprimerMdp(Compte compte)
  {
    _vault.remove(compte);
  }
  // Charge les mots de passe stockés dans un fichier (à upgrade)
  void chargement(String fichier){
    var file = File(fichier);
    List<String> stream = file.readAsLinesSync();
    stream.forEach((element) {
    var arr = element.split(' ');
     _vault.add(Compte(arr[0],arr[1],arr[2],arr[3]));
    });
  }
}
