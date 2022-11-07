// Class for password objects

class Password {
  int _id;
  String _name;
  String? _website;
  String? _username;
  String? _email;
  String? _note;
  String _password;

  // Minimal constructor
  Password(this._id, this._name, this._password,
      [this._website, this._username, this._email, this._note]);

  // Password Getter ? Why ?
  Password get password {
    return this;
  }

  @override
  String toString() {
    return 'id: $_id\nnom: $_name\npassword: $_password';
  }
}
