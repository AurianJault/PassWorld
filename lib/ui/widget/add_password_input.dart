import 'package:flutter/material.dart';

class AddPasswordInputWidget extends StatelessWidget {
  const AddPasswordInputWidget({super.key});

  // Variable for data binding -- will change when list of password
  // final String website;
  // final String image;
  // final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.grey[300], fontSize: 18),
        cursorColor: Colors.black,
        controller: null,
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2)),
            labelText: 'Name',
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[500],
            )),
      ),
    );
  }
}
