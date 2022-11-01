import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 5,
        decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
