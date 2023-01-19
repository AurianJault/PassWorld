import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/account.dart';
import 'dart:io' show Platform;

import 'package:test/Classes/accountManager.dart';
import 'package:test/Classes/yubikey_related/yubiValidator.dart';
import 'package:test/Classes/yubikey_related/yubikey.dart';

import '../../Classes/config.dart';
import '../setting/setting_yubikeys_page.dart';

class EnterOtpPage extends StatelessWidget {
  final TextEditingController otpCtrl;
  final String name;
  final Account currentUser;

  EnterOtpPage(this.currentUser,this.otpCtrl, this.name);


void registerYubikey(){
  AccountManager.addYubikey(currentUser, name, otpCtrl.text,"");
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
              onPressed: () async{
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
                    //AccountManager.addYubikey(currentUser, name, otpCtrl.text.substring(0,12));
                    if(!await YubiValidator.validadeOtp(otpCtrl.text)){
                        showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Error"),
                            content: const Text("Otp was poorly inserted or yubikey is not valid"),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else 
                    if(!AccountManager.isNewYubikey(context.read<Account>(),otpCtrl.text.substring(0,12))){
                        showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Error"),
                            content: const Text("This yubikey was already registered"),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      context.read<Account>().secondFactors.add(Yubikey(name, otpCtrl.text.substring(0,12),""));
                        var path = Config();
                        await path.setAppDirPath();
                        context.read<Account>().saveFile(path.appDirPath.path);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute<dynamic>(
                                    builder: (context) => const SettingYubikeyPage()));
                      }
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
