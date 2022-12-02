class Strength{
  static checkStrength(String value)
  {
      RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");
    var pwd = value.trim();

    if (pwd.isEmpty) {
        return 0;
    } else if (pwd.length < 6) {
        return (1 / 4);
    } else if (pwd.length < 8) {
        return  (2 / 4);
    } else {
      if (!letterReg.hasMatch(pwd) || !numReg.hasMatch(pwd)) {
          return (3 / 4);
      } else {
          return 1;
      }
    }
  }
}