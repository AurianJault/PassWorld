//import 'dart:ffi';
//import 'dart:indexed_db';
import 'package:bcrypt/bcrypt.dart';
import 'package:encrypt/encrypt.dart';
import 'package:test/crypt.dart';
import 'dart:io';


final key = Key.fromSecureRandom(32);
final iv = IV.fromLength(16);

// Compte pour chaque site
class Compte
{
  late String identifiant;
  late String nom;
  late String lien;
  late String _motDePasse;

  Compte(String id, String n, String l, String mdp)
  {
    identifiant = id;
    nom = n;
    lien = l;
    _motDePasse = mdp;
  }
  // getter
  Compte get compte
  {
    return this;
  }

  @override
  String toString()
  {
    return 'Compte: $identifiant\nnom: $nom\nlink: $lien';
  }
}
// Stockage des éléments du mot de passe de notre application
class Chiffrement
{
  late Encrypted salt;
  late Encrypted hash;

  Chiffrement(String mdp)
  {
    salt = encrypt(BCrypt.gensalt());
    hash = encrypt(BCrypt.hashpw(mdp, decrypt(salt)));
  }
  Chiffrement.old(Encrypted salty,Encrypted hashy)
  {
    salt = salty;
    hash = hashy;
  }
  @override
  bool operator ==(Object c)
  {
    if(identical(this, c))
      return true;
    return false;
  }
}
// Compte pour NOTRE application
class Utilisateur
{
  late String _identifiant;
  late Chiffrement _motDePasse;
  late List<Compte> _vault;

  Utilisateur(String id, String mdp)
  {
    _identifiant = id;
    _motDePasse = Chiffrement(mdp);
    _vault = List.empty(growable: true);
    // Charge la liste des comptes liés a ce compte
    chargement("listCompte.txt");
  }

  Utilisateur.old(String id,Encrypted salty,Encrypted hashy)
  {
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
  List<Compte> get vlt 
  {
    return _vault;
  }

  @override
  bool operator ==(Object c)
  {
    if(identical(this, c))
      return true;
    return false;
  }
  // Recherche un mot de passe dans la liste de mdp stocké pour un compte donné
  String rechercherMdp(String nom, String id)
  {
    String mdp = "";
    _vault.forEach((element) {
      if(nom == element.nom && id == element.identifiant)
        mdp = element._motDePasse;
    });
    return mdp;
  }
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

// Vérifie s'il existe un compte pou notre applic utilisant ce login(email) + mdp
// Lis la liste des comptes depuis un fichier texte(à upgrade)
Future<bool> authentification(String login,String mdp)async{
  var list=await allUser();
  for (var i in list){
    if(i._identifiant == login){
      print(decrypt(i.salt));
      var tmp = BCrypt.hashpw(mdp, decrypt(i.salt));
      print(tmp);
      return tmp==decrypt(i.hash);
    }
  }
    return false;
}

// salt = encrypt(BCrypt.gensalt());
// hash = encrypt(BCrypt.hashpw(mdp, decrypt(salt)));


// Charge les comptes déjà existant pour notre appli depuis un fichier texte (à upgrade)
Future<List<Utilisateur>> allUser()async{
  var file = File("file.txt");
  List<Utilisateur> lst=List.empty(growable: true);
    List<String> stream = file.readAsLinesSync();
    stream.forEach((element) {
    var arr = element.split(' ');
    var salt = Encrypted.fromBase16(arr[1]);
    var hash = Encrypted.fromBase16(arr[2]);
    lst.add(Utilisateur.old(arr[0], salt, hash));
  }
  );
  return lst;
}

Future<bool> register(String login, String mdp)async{
  var listCpt=await allUser();
  for (var i in listCpt){
    if(i._identifiant==login)return false;
  }
  listCpt.add(Utilisateur(login, mdp));
  ecriture(listCpt, "file.txt");
  return true;
}

// Ecrit dans un fichier 
void ecriture(List<Utilisateur> list,String fichier)async{
  for(var i in list){
    var file = File(fichier).writeAsString("${i._identifiant} ${i.salt.base16} ${i.hash.base16}");
  }
}

void main()async
{
  await register("Aurian", "123soleil");
  if(await authentification("Aurian", "123soleil"))
  {
    print("Ca marche la con de moi");
  }
  else{
    print("cpt");
  }
}