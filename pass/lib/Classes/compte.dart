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