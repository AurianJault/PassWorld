import 'package:flutter/material.dart';
import 'package:flag/flag.dart';

import '../../Classes/localization/translation.dart';

languageSelector(BuildContext context) {
  var size = MediaQuery.of(context).size;
  double w = size.width; //*

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
      title: Text(LanguageTranslation.of(context)!.text('language_select')),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              LanguageTranslation.load(const Locale("fr"));
              Navigator.pop(context);
            },
            child: const Flag.fromString('FR',
                height: 50, width: 75, fit: BoxFit.fill),
          ),
          SizedBox(
            width: w * 0.02,
          ),
          InkWell(
            onTap: () {
              LanguageTranslation.load(const Locale("en"));
              Navigator.pop(context);
            },
            child: const Flag.fromString('GB',
                height: 50, width: 75, fit: BoxFit.fill),
          ),
          SizedBox(
            width: w * 0.02,
          ),
          InkWell(
            onTap: () {
              LanguageTranslation.load(const Locale("pt"));
              Navigator.pop(context);
            },
            child: const Flag.fromString('PT',
                height: 50, width: 75, fit: BoxFit.fill),
          ),
        ],
      ));

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
