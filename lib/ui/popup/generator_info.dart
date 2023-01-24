import 'package:flutter/material.dart';

import '../../Classes/localization/translation.dart';

generatorInfo(BuildContext context) {
  // set up the button

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Icon(
      IconData(0xe33d, fontFamily: 'MaterialIcons'),
    ),
    content: Text(LanguageTranslation.of(context)!.text('generator_info')),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
