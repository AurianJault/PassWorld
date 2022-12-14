import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/doctor.dart';
import 'package:test/Classes/password.dart';
import 'package:test/Classes/strength_password.dart';
import 'package:test/Classes/vault.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import 'package:test/ui/widget/password_widget.dart';
import 'package:test/ui/widget/red_password.dart';

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
    List<List<Password>> list = Doctor.strenght(context.read<Account>());
    Password selected;
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "Critical password(s) strenght",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.035),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            color: Colors.red,
            height: 50,
            width: w * 0.80,
            child: DropdownButton<Password>(
                icon: const Icon(Icons.arrow_drop_down),
                items: list[0]
                    .map<DropdownMenuItem<Password>>(
                        (val) => DropdownMenuItem<Password>(
                            value: val,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: DoctorPassword(
                                password: val,
                                color: Colors.red,
                              ),
                            )))
                    .toList(),
                onChanged: ((value) {})),
          ),
          const SizedBox(
            width: 100,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "Medium password(s) strenght",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.035),
                ),
              )
            ],
          ),
          Container(
            color: Colors.orange,
            height: 50,
            width: w * 0.80,
            child: DropdownButton<Password>(
                icon: const Icon(Icons.arrow_drop_down),
                items: list[1]
                    .map<DropdownMenuItem<Password>>((val) =>
                        DropdownMenuItem<Password>(
                            value: val,
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: DoctorPassword(
                                    password: val, color: Colors.orange))))
                    .toList(),
                onChanged: ((value) {})),
          ),
          const SizedBox(
            width: 100,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "Reused password(s)",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.035),
                ),
              )
            ],
          ),

          Container(
            color: Colors.blueGrey,
            height: 50,
            width: w * 0.80,
            child: DropdownButton<Password>(
                icon: const Icon(Icons.arrow_drop_down),
                items: Doctor.reused(context.read<Account>())
                    .map<DropdownMenuItem<Password>>((val) =>
                        DropdownMenuItem<Password>(
                            value: val,
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: DoctorPassword(
                                    password: val, color: Colors.orange))))
                    .toList(),
                onChanged: ((value) {})),
          ),



          const SizedBox(
            width: 100,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  "Too old password(s)",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: w * 0.035),
                ),
              )
            ],
          ),

          Container(
            color: Colors.lightGreen,
            height: 50,
            width: w * 0.80,
            child: DropdownButton<Password>(
                icon: const Icon(Icons.arrow_drop_down),
                items: Doctor.timeUsed(context.read<Account>())
                    .map<DropdownMenuItem<Password>>((val) =>
                        DropdownMenuItem<Password>(
                            value: val,
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: DoctorPassword(
                                    password: val, color: Colors.orange))))
                    .toList(),
                onChanged: ((value) {})),
          ),


        ],
      )),
    );
  }
}
