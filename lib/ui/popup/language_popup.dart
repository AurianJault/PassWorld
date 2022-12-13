import 'package:flutter/material.dart';

import '../../Classes/localization/translation.dart';

languageSelector(BuildContext context) {
  // set up the button

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Choisissez une langue"),
    actions: [
      InkWell(
        onTap: () {
          LanguageTranslation.load(const Locale("fr"));
          Navigator.pop(context);
        },
        child: const Text("FR"),
      ),
      InkWell(
        onTap: () {
          LanguageTranslation.load(const Locale("en"));
          Navigator.pop(context);
        },
        child: const Text("EN"),
      ),
      InkWell(
        onTap: () {
          LanguageTranslation.load(const Locale("pt"));
          Navigator.pop(context);
        },
        child: const Text("PT"),
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
