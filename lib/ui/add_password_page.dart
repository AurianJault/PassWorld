import 'package:flutter/material.dart';
import 'package:test/ui/widget/add_password_input.dart';

class AddPasswordPage extends StatefulWidget {
  const AddPasswordPage({Key? key}) : super(key: key);

  @override
  State<AddPasswordPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<AddPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          //-----------
          // PAGE TITLE
          //-----------
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.deepPurple[300],
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: const Center(
              child: Text(
                'Add Password',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //----------------
          // INPUT LIST VIEW
          //----------------
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                AddPasswordInputWidget(),
                AddPasswordInputWidget(),
                AddPasswordInputWidget(),
                AddPasswordInputWidget(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
