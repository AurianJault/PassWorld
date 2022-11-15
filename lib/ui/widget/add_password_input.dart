import 'package:flutter/material.dart';

class AddPasswordInputWidget extends StatelessWidget {
  final String name;

  const AddPasswordInputWidget({super.key, required this.name});

  // Variable for data binding -- will change when list of password
  // final String website;
  // final String image;
  // final String email;

  @override
  Widget build(BuildContext context) {
    // Media Query
    var size = MediaQuery.of(context).size;
    var w = size.width;
    var h = size.height;
    // Widget
    return Padding(
      padding: EdgeInsets.all(w * 0.02),
      child: TextFormField(
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: w * 0.032),
        cursorColor: Colors.black,
        controller: null,
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
