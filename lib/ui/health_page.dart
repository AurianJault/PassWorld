import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/doctor.dart';
import 'package:test/Classes/password.dart';
import 'package:test/Classes/strength_password.dart';
import 'package:test/Classes/vault.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import 'package:test/ui/widget/password_widget.dart';

import '../Classes/account.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    // Passwords's Strenght
    List list = Doctor.strenght(context.read<Account>());
    // Media Query
    var size = MediaQuery.of(context).size;
    var w = size.width;
    var h = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Container(
                  padding: const EdgeInsets.all(25),
                  child: const PageTitleW(title: 'Health')),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            padding: const EdgeInsets.all(25),
            child: Text(
              "We are taking care of your passwords",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: w * 0.045),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      )),
    );
  }
}
