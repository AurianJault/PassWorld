// Class for password objects

class Password {
  final int _id; // never change
  String _name;
  String? _website;
  String? _username;
  String? _email;
  String? _note;
  String _password;
  final DateTime _creationDate = DateTime.now(); // never change
  DateTime _modifDate = DateTime.now();

  // Constructor: [x,y] -> x and y are optional
  Password(this._id, this._name, this._password,
      [this._website, this._username, this._email, this._note]);

  // Password Getter ? WHY ?
  Password get password {
    return this;
  }

  // Methods
  void updateModifDate() {
    _modifDate = DateTime.now();
  }

  // Setters
  set setName(String x) {
    _name = x;
  }

  set setWebsite(String x) {
    _website = x;
  }

  set setUsername(String x) {
    _username = x;
  }

  set setEmail(String x) {
    _email = x;
  }

  set setNote(String x) {
    _note = x;
  }

  set setPassword(String x) {
    _password = x;
  }

  // Getters
  String get getName {
    return _name;
  }

  String? get getWebsite {
    return _website;
  }

  String? get getUsername {
    return _username;
  }

  String? get getEmail {
    return _email;
  }

  String? get getNote {
    return _note;
  }

  String? get getPassword {
    return _password;
  }

  // To string
  @override
  String toString() {
    return 'id: $_id\nnom: $_name\npassword: $_password\nwebsite: $_website\nusername: $_username\nemail: $_email\nnote: $_note\nCreation Date: $_creationDate\nModification Date: $_modifDate';
  }
}
