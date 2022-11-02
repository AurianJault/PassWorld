import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
