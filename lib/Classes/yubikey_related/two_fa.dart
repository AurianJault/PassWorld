/*
* Cette classe represente un facteur de double authentification
* _nom : nom du facteur choisi par l'utilisateur
*/

abstract class TwoFA{
  late String nom;

  TwoFA(String n){
    nom = n;
  }
}