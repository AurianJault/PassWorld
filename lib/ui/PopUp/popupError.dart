import 'package:flutter/material.dart';

showAlertDialog(BuildContext context,String message) {

  // set up the button
  Widget okButton = TextButton(
    child: const Text('Ok'),
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(  
    title:const Text("Error"),
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

