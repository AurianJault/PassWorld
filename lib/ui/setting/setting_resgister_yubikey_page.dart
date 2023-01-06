import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/account.dart';
import 'package:test/Classes/password.dart';
import 'package:test/ui/widget/add_password_input.dart';

import '../../Classes/config.dart';

// Page to add new passwords to Vault
class RegisterYubikeyPage extends StatefulWidget {
  const RegisterYubikeyPage({Key? key}) : super(key: key);

  @override
  State<RegisterYubikeyPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<RegisterYubikeyPage> {
  // Array of TextFormField labelText
  final name = ['Name'];

  // Controllers for all inputs
  TextEditingController nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Media Query
    var size = MediaQuery.of(context).size;
    var w = size.width;
    var h = size.height;

    // Widget
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            //-----------
            // PAGE TITLE
            //-----------
            Container(
              height: h * 0.075,
              decoration: BoxDecoration(
                color: Colors.deepPurple[300],
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(w * 0.02)),
              ),
              child: Center(
                child: Text(
                  'New Yubikey',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: w * 0.04),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            //----------------
            // INPUT LIST VIEW
            //----------------
            Padding(
              padding: EdgeInsets.all(w * 0.03),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(w * 0.01)),
                    child: Column(
                      children: [
                        AddPasswordInputWidget(
                            name: name[0], controlleur: nameCtrl),
                        SizedBox(height: h * 0.02),
                       
                        SizedBox(
                          height: h * 0.03,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(w * 0.01)),
                    child: Padding(
                      padding: EdgeInsets.all(w * 0.02),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: w * 0.032),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black, width: w * 0.004)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.green, width: w * 0.004)),
                            labelText: 'Notes',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Cancel Button
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: w * 0.25,
                            decoration: BoxDecoration(
                                color: Colors.red[400],
                                borderRadius: BorderRadius.circular(w * 0.04)),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.03, vertical: h * 0.01),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: w * 0.045),
                                  ),
                                ))),
                      ),
                      InkWell(
                        onTap: () async{
                          int id = context.read<Account>().vault.getMaxInt();
                          var path = Config();
                          await path.setAppDirPath();
                          context.read<Account>().saveFile(path.appDirPath.path);
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: w * 0.25,
                            decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: BorderRadius.circular(w * 0.04)),
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.03, vertical: h * 0.01),
                                child: Center(
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: w * 0.045),
                                  ),
                                ))),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
