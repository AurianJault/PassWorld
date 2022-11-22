import 'package:test/Classes/account.dart';
import 'package:test/Classes/password.dart';
import 'package:password_strength/password_strength.dart';

class Doctor {
  static List reused(Account user) {
    List<Password> list = user.vault.passwordList;
    var res = [];
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

  // retourne une liste de deux tableaux
  // Res[0] --> Listes de Passwords "Moyen" (Affichage Orange)
  // Res[1] --> Listes de Passwords "Trop faible" (Affichage Rouge)
  static List strenght(Account user) {
    var orange = [];
    var red = [];
    List<Password> list = user.vault.passwordList;
    list.forEach((element) {
      double strength = estimatePasswordStrength(element.getPassword);
      if (strength < 0.5) {
        red.add(element);
      } else {
        if (strength < 0.7) {
          orange.add(element);
        }
      }
    });
    var res = [orange, red];
    return res;
  }

  static List timeUsed(Account user) {
    List<Password> list = user.vault.passwordList;
    var res = [];
    var toDay = DateTime.now();
    list.forEach((element) {
      var date = element.getModifDate!;
      if (toDay.year != date.year) {
        res.add(element);
      } else {
        if (toDay.month - date.month > 6) res.add(element);
      }
    });
    return res;
  }
}
