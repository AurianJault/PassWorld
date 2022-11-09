import 'package:flutter/material.dart';

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
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300],
                        fontSize: 18),
                    cursorColor: Colors.black,
                    controller: null,
                    decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2)),
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        )),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
