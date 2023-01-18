import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/Classes/account.dart';
import 'dart:io' show Platform;

import 'package:test/Classes/accountManager.dart';

import '../setting/setting_yubikeys_page.dart';

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
      title: const Text("Pess OTP button"),
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
                  if(otpCtrl.text.length < 44) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Error"),
                          content: const Text("Please enter a valid OTP"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    AccountManager.addYubikey(currentUser, name, otpCtrl.text.substring(0,12));
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute<dynamic>(
                                builder: (context) => const SettingYubikeyPage()));
                  }
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
