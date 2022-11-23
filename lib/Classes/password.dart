// Class for password objects

class Password {
  // Fields
  final int _id; // never change
  String _name;
  String? _website;
  String? _username;
  String? _email;
  String? _note;
  String _password;
  DateTime? _creationDate; // Can't be final is complete non-sense
  DateTime? _modifDate;

  // Constructor: [x,y] -> x and y are optional
  Password(this._id, this._name, this._password,
      [this._website, this._username, this._email, this._note]) {
    _creationDate = DateTime.now();
    _modifDate = DateTime.now();
  }

  Password.load(
      this._id, this._name, this._password, this._creationDate, this._modifDate,
      [this._website, this._username, this._email, this._note]);

  // Methods
  // Update modifDate when password is modified
  void updateModifDate() {
    _modifDate = DateTime.now();
  }

  // Setters
  set setName(String s) {
    _name = s;
  }

  set setWebsite(String s) {
    _website = s;
  }

  set setUsername(String s) {
    _username = s;
  }

  set setEmail(String s) {
    _email = s;
  }

  set setNote(String s) {
    _note = s;
  }

  set setPassword(String s) {
    _password = s;
  }

  set setCreationDate(DateTime d) {
    _creationDate = d;
  }

  // Getters
  int get getId {
    return _id;
  }

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

  String get getPassword {
    return _password;
  }

  DateTime? get getCreationDate {
    return _creationDate;
  }

  DateTime? get getModifDate {
    return _modifDate;
  }

  // Getter to obtain the root of website url
  String get getWebsiteImage {
    String d = '.';
    String s = _website!.toLowerCase();
    int index = s.indexOf(d);
    if (index == -1) {
      return 'null';
    }
    return s.substring(0, index);
  }

  // To string
  @override
  String toString() {
    return 'id: $_id\nnom: $_name\npassword: $_password\nwebsite: $_website\nusername: $_username\nemail: $_email\nnote: $_note\nCreation Date: $_creationDate\nModification Date: $_modifDate';
  }
}
