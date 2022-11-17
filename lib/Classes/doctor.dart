import 'package:test/Classes/account.dart';
import 'package:test/Classes/password.dart';

class Doctor {
  // list des fonctions a faire
  // Check nbr de fois used pour un mdp
  static List reused(Account user) {
    List<Password> list = user.vlt.passwordList;
    var res = [];
    // Pour chaque element de la list :
    // Check si ce mdp est plus d'une fois dans la même liste
    list.forEach((element) {
      int count = 0;
      var pwd = element.getPassword;
      for (var i in list) {
        if (i.getPassword == pwd) count++;
      }
      if (count > 1) {
        if (!res.contains(element)) res.add(element);
      }
    });
    return res;
  }
  // Check la force de chaque mdp

  // Si le mdp est updated
  static List timeUsed(Account user) {
    List<Password> list = user.vlt.passwordList;
    var res = [];
    var toDay = DateTime.now();
    list.forEach((element) {
      var date = element.getModifDate!;
      if (toDay.year != date.year) {
        res.add(element);
      }
      else{if (toDay.month - date.month > 1) res.add(element);}
    });
    return res;
  }
}
