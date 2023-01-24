import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:test/ui/nfc/tagReader_page.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:test/Classes/yubikey_related/yubiValidator.dart';

import '../nav_bar.dart';
//import 'package:ndef/ndef.dart' as ndef;

class NfcPage extends StatefulWidget {
  const NfcPage({Key? key}) : super(key: key);

  @override
  State<NfcPage> createState() => _NfcPageState();
}

class _NfcPageState extends State<NfcPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String otp = 'flop';
  bool valid = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // Title
              const Text(
                'Welcome Back !',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 50),

              // Email Input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              //Password Input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Sign In Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    onTap: () {
                      tagRead2();
                      if (otp != 'flop') {
                        validate();
                        if(valid){
                          Navigator.push(
                            context,
                            MaterialPageRoute<dynamic>(
                                builder: (context) => const NavBar()));
                        }       
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text('Erreur'),
                                  content: Text(otp),
                                  actions: [
                                    TextButton(
                                      child: const Text('Ok'),
                                      onPressed: () => Navigator.pop(context),
                                    )
                                  ],
                                ));
                      }
                    },
                    child: const Center(
                      child: Text(
                        'NFC GET OTP',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
                        
              // Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'READ NFC',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<dynamic>(
                              builder: (context) => TagReader()));
                    },
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }

  void tagRead2() async {
    var tag = await FlutterNfcKit.poll(timeout: Duration(seconds: 10),
    iosMultipleTagMessage: "Multiple tags found!", iosAlertMessage: "Scan your tag");
    for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
      otp = (record.toString());
    }
  }
  void validate() async {
    var rep = await YubiValidator.validadeNfcTag(otp);
    valid = rep;
  }
}



/* 
// read NDEF records if available
if (tag.ndefAvailable){
  /// decoded NDEF records (see [ndef.NDEFRecord] for details)
  /// `UriRecord: id=(empty) typeNameFormat=TypeNameFormat.nfcWellKnown type=U uri=https://github.com/nfcim/ndef`
  for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
    print(record.toString());
  }
 */