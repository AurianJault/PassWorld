import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/Classes/password.dart';

class RedPassword extends StatefulWidget {
  Password password;
  RedPassword({super.key, required this.password});

  @override
  State<RedPassword> createState() => _RedPasswordState();
}

class _RedPasswordState extends State<RedPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
