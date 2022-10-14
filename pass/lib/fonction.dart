import 'dart:collection';
import 'dart:core';
import 'dart:io';
import 'dart:convert';

String coucou()
{
  return "J'ai réussis ????";
}

class Compte{
  var id;
  var mdp;
  setId(String di){
    id=di;
  }
  Compte(){
    var id;
    var mdp;
  }
}

class ListCompte<E> extends ListBase<E>{
  final List<E> l=[];
  void set length(int newLength) { l.length = newLength; }
  int get length => l.length;
  E operator [](int index) => l[index];
  void operator []=(int index, E value) { l[index] = value; }
}

// void main(List<String> args) {
//   var cmpt=Compte();
//   cmpt.id="Aurian";
//   cmpt.mdp="1234";
// }

void main()async{
  var listcpt= ListCompte();
  var moi=Compte();
  moi.id="Aurian";
  moi.mdp="1234";
  listcpt=await chargement("file.txt");
  if(await authentification(moi))print("Succes !");
}

Future<ListCompte> chargement(String fichier)async{

  var listcpt= ListCompte();
  final file = File(fichier);

  Stream<String> lines = file.openRead()
    .transform(utf8.decoder)       // Decode bytes to UTF-8.
    .transform(LineSplitter());    // Convert stream to individual lines.
  try {
    await for (var line in lines) {
      var compte = Compte();
      var arr = line.split(' ');
      compte.id=arr[0];
      compte.mdp=arr[1];
      listcpt.add(compte);
    }
    print('File is now closed.');
  } catch (e) {
    print('Error: $e');
  }
  return listcpt;
}

Future<bool> authentification(Compte user)async{
// la Await permet de dire qu'il faut attendre que la fonction chargement soit fini pour continuer
  var listcpt=await chargement("file.txt");
  for (var i in listcpt){
    if(i.id == user.id && i.mdp == user.mdp)return true;
  }
  return false;
}