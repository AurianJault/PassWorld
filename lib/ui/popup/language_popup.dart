import 'package:flutter/material.dart';
import 'package:flag/flag.dart';

import '../../Classes/localization/translation.dart';

languageSelector(BuildContext context) {
  var size = MediaQuery.of(context).size;
  double w = size.width;
  double h = size.height; //*

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
            child: Flag.fromString('FR',
                height: w * 0.07, width: w * 0.09, fit: BoxFit.fill),
          ),
          SizedBox(
            width: w * 0.02,
          ),
          InkWell(
            onTap: () {
              LanguageTranslation.load(const Locale("en"));
              Navigator.pop(context);
            },
            child: Flag.fromString('GB',
                height: w * 0.07, width: w * 0.09, fit: BoxFit.fill),
          ),
          SizedBox(
            width: w * 0.02,
          ),
          InkWell(
            onTap: () {
              LanguageTranslation.load(const Locale("pt"));
              Navigator.pop(context);
            },
            child: Flag.fromString('BR',
                height: w * 0.07, width: w * 0.09, fit: BoxFit.fill),
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
