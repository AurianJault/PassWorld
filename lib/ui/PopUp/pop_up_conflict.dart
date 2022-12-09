import 'package:flutter/material.dart';
import 'package:io/ansi.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:test/Classes/password.dart';

showConflictDialog(BuildContext context,Password passDown,Password passSaved) {
  var frstState = '❌';
  var scndState = '❌';

  //✔️

  // set up the button
  var col = Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child:  
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: 
            Text('$frstState ${passDown.getName}'),
        ),
    ),
    
    Padding(
      
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child:
      Container(
        alignment: 
          Alignment.centerLeft,
        decoration: const BoxDecoration(
          color: Colors.white),
        child: 
      
        
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: 
            Text('$scndState ${passSaved.getName}'),
        )
      )
    )
  ]);

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(  
    title:const Text("Conflicts : "),
    actions: [
      col,
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

