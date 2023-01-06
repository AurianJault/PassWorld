import 'package:flutter/widgets.dart';
import 'password.dart';

class Vault with ChangeNotifier {
  // Fields
  final List<Password> _passwordList = List.empty(growable: true);

  set passwordList(List<Password> passwordList) {}

  List<Password> get passwordList {
    return _passwordList;
  }

  // Methods
  // Add Password to passwordList
  void addPassword(Password p) {
    _passwordList.add(p);
    notifyListeners();
  }

  int getMaxInt() {
    int max = 0;
    var it = passwordList.iterator;
    while (it.moveNext()) {
      if (it.current.getId > max) max = it.current.getId;
    }
    return max + 1;
  }

  // Remove Password from passwordList
  void removePassword(int id) {
    int index = searchPassword(id);
    _passwordList.removeAt(index);
  }

  // Return index of Password in vault by id
  int searchPassword(id) {
    return _passwordList.indexWhere((element) => element.getId == id);
  }

  Password access(int i) {
    return _passwordList[i];
  }

  // Return passwordList lenght
  int lenght() {
    return _passwordList.length;
  }

  // Display all Password in passwordList
  void display() {
    for (int i = 0; i < lenght(); i++) {
      print(_passwordList[i]); // TODO
    }
  }

  //Operatordart
  Password operator [](int i) {
    return _passwordList[i];
  }

  // Edit a password
  void editPassword(id, name, password,
      website, username, email, note){
    int idx = searchPassword(id);
    _passwordList[idx].setName = name;
    _passwordList[idx].setPassword = password;
    _passwordList[idx].setWebsite = website;
    _passwordList[idx].setUsername = username;
    _passwordList[idx].setEmail = email;
    _passwordList[idx].setNote = note;
  }
}
