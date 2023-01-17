import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/Classes/account.dart';
import 'dart:io' show Platform;

import 'package:test/Classes/accountManager.dart';

class EnterOtpPage extends StatelessWidget {
  final TextEditingController otpCtrl;
  final String name;
  final Account currentUser;

  EnterOtpPage(this.currentUser,this.otpCtrl, this.name);


void registerYubikey(){
  AccountManager.addYubikey(currentUser, name, otpCtrl.text);
}

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(currentUser.id),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text("Please press the OTP button on your yubikey."),
              const SizedBox(height: 10),
              TextField(
                controller: otpCtrl,
                decoration: const InputDecoration(
                  hintText: 'Enter OTP',
                ),
              ),
              const SizedBox(height: 10),
              CupertinoButton(
              child: const Text("Done"),
              onPressed: () {
                  Navigator.pop(context);
              },
            ),
              CupertinoButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
