import 'package:flutter/material.dart';

// Widget for all inputs of addPasswordPage
class AddPasswordInputWidget extends StatelessWidget {
  // Variables
  final String name;
  final TextEditingController controlleur;

  // Constructor
  const AddPasswordInputWidget(
      {super.key, required this.name, required this.controlleur});

  @override
  Widget build(BuildContext context) {
    // Media Query
    var size = MediaQuery.of(context).size;
    var w = size.width;

    // Widget
    return Padding(
      padding: EdgeInsets.all(w * 0.02),
      child: TextFormField(
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: w * 0.032),
        cursorColor: Colors.black,
        controller: controlleur,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: w * 0.004)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: w * 0.004)),
            labelText: name,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[500],
            )),
      ),
    );
  }
}
