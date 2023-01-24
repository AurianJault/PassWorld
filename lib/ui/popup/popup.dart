import 'package:flutter/material.dart';

showNormalDialog(BuildContext context, String message, String title) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text('Ok'),
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
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
