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
      print(_passwordList[i]);
    }
  }

  //Operator
  Password operator [](int i) {
    return _passwordList[i];
  }
}
