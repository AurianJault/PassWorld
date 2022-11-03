/*
* Cette classe represente un facteur de double authentification
* _nom : nom du facteur choisi par l'utilisateur
*/

abstract class TwoFA{
  late String _nom;

  String? get Nom{
    return _nom;
  }
  
  set nom(String n){
    _nom = n;
  }

  TwoFA(String n){
    _nom = n;
  }
}