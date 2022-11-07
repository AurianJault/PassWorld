import 'dart:io';
import 'package:bcrypt/bcrypt.dart';
import 'package:encrypt/encrypt.dart';
import 'package:test/Classes/account.dart';
import 'package:test/Classes/yubikey_related/sendCode.dart';

Future<bool> authentification(String login,String mdp)async{
  var list=await allUser();
  var it = list.iterator;
  while(it.moveNext()){
    if(it.current.id == login)
    {
      var encrypter = Encrypter(AES(it.current.cle));
      var sel = encrypter.decrypt(it.current.salt, iv: it.current.iv);
      var tmp = BCrypt.hashpw(mdp, sel);
      return tmp == encrypter.decrypt(it.current.hash,iv: it.current.iv);
    }
  }
    return false;
}

// Charge les comptes déjà existant pour notre appli depuis un fichier texte (à upgrade)
Future<List<Account>> allUser()async{
  var file = File("file.txt");
  List<Account> lst=List.empty(growable: true);
  List<String> stream = file.readAsLinesSync();
    stream.forEach((element) {
    var arr = element.split(' ');
    var salt = Encrypted.fromBase64(arr[1]);
    var hash = Encrypted.fromBase64(arr[2]);
    Key key = Key.fromBase64(arr[3]);
    IV vi = IV.fromBase64(arr[4]);
    print(key.base64);
    lst.add(Account.old(arr[0], salt,hash , key, vi));
  }
  ); 
  return lst;
}

Future<bool> register(String login, String mdp)async{
  var listCpt=await allUser();
  for (var i in listCpt){
    if(i.id==login)return false;
  }
  listCpt.add(Account(login, mdp));
  ecriture(listCpt, "file.txt");
  return true;
}
// Ecrit dans un fichier 
void ecriture(List<Account> list,String fichier)async{
  for(var i in list){
    print("${i.key.base64} ${i.iv.base64}");
    var file = File(fichier).writeAsStringSync("${i.id} ${i.salt.base64} ${i.hash.base64} ${i.key.base64} ${i.iv.base64}\n",mode: FileMode.append);
  }
}