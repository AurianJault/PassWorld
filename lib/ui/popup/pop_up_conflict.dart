import 'package:flutter/material.dart';
import 'package:io/ansi.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:test/Classes/password.dart';

Future<int> showConflictDialog(
    BuildContext context, Password passDown, Password passSaved) {
  var frstState = false;
  var fSign = '❌';
  var fColor = Color.fromARGB(120, 190, 20, 20);
  var scndState = false;
  var sSign = '❌';
  var sColor = Color.fromARGB(120, 190, 20, 20);

  //✔️❌

  int selectedButton = 0;
  // set up the button
  var col = Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
            alignment: Alignment.centerLeft,
            //decoration: const BoxDecoration(color: Colors.white),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: fColor),
              onPressed: () => {
                TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(143, 81, 231, 35)),
                if (frstState == false)
                  {
                    frstState = !frstState,
                    scndState = false,
                    fSign = '',
                    fColor = Color.fromARGB(120, 190, 20, 20)
                  }
                else
                  {fSign = '', fColor = Color.fromARGB(143, 81, 231, 35)}
              },
              child: Text('${passDown.getName} : ${passDown.getPassword}'),
            ))),
    Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
            alignment: Alignment.centerRight,
            //decoration: const BoxDecoration(color: Colors.white),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: sColor),
              onPressed: () => {
                if (scndState == false)
                  {
                    scndState = !scndState,
                    frstState = false,
                    sSign = '',
                    sColor = Color.fromARGB(120, 190, 20, 20)
                  }
                else
                  {sSign = '', sColor = Color.fromARGB(143, 81, 231, 35)}
              },
              child: Text('${passSaved.getName} : ${passSaved.getPassword} '),
            ))),
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
        child: Container(
            alignment: Alignment.center,
            //decoration:
            //    const BoxDecoration(color: Color.fromARGB(223, 224, 224, 224)),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 230, 230, 230)),
              onPressed: () => {
                if (frstState == true || scndState == true)
                  {
                    if (frstState == true)
                      {selectedButton = 1}
                    else if (scndState == true)
                      {selectedButton = 2},
                    Navigator.pop(context, selectedButton)
                  }
                else
                  {
                    //print error message to select
                  }
              },
              child: const Text("Ok"),
            )))
  ]);

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Conflicts : "),
    actions: [
      col,
    ],
  );

  // show the dialog
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  ).then((value) {
    return value;
  });
}
