import 'package:flutter/material.dart';

generatorInfo(BuildContext context) {
  // set up the button

  // set up the AlertDialog
  AlertDialog alert = const AlertDialog(
    title: Icon(
      IconData(0xe33d, fontFamily: 'MaterialIcons'),
    ),
    content: Text('''Les caractères sont divisés en 5 boutons : 
    - L'alphabet en minuscule 
    - L'alphabet en majuscule 
    - Les chiffres
    - Les caractères de base ( )
    - Les caractères spéciaux ( ) '''),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
