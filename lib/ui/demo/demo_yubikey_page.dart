import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/yubikey_related/yubiValidator.dart';

import '../../Classes/account.dart';
import '../nav_bar.dart';
//import 'package:ndef/ndef.dart' as ndef;

class YubikeyDemoPage extends StatefulWidget {
  const YubikeyDemoPage({Key? key}) : super(key: key);

  @override
  State<YubikeyDemoPage> createState() => _YubikeyDemoPageState();
}

class _YubikeyDemoPageState extends State<YubikeyDemoPage> {
  late String otp;
  bool valid = false;
  var otpController = TextEditingController();

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
                'Yubikey Authentification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 50),

              // INSERT BUTTON 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 60, 145, 18),
                      borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text('Insert you yubikey and press the OTP button'),
                                  content:
                                  TextField(
                                    obscureText: true,
                                    controller: otpController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'press yubikey',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('Ok'),
                                      onPressed: () async {
                                        otp = otpController.text;
                                        await validate();                                    
                                        if(valid){
                                          Navigator.push(
                                          context,
                                          MaterialPageRoute<dynamic>(
                                              builder: (context) => const NavBar()));
                                        } else {
                                          showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: const Text('Erreur'),
                                                content: const Text(
                                                    "L'otp n'a pas été validé!"),
                                                actions: [
                                                  TextButton(
                                                    child: const Text('Ok'),
                                                    onPressed: () => Navigator.pop(context),
                                                  ),
                                                ]
                                                ),
                                              );
                                        }
                                      }
                                    )
                                  ],
                                ));
                               },
                    child: const Center(
                      child: Text(
                        'INSERT',
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

              // NFC BUTTON
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 20, 50, 5),
                      borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('NFC'),
                              content: const Text(
                                  "Press Ok and then tap your yubikey"),
                              actions: [
                                TextButton(
                                  child: const Text('Ok'),
                                  onPressed: () async {
                                    await tagRead2();
                                    await validateNfc();
                                    if(valid){
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute<dynamic>(
                                          builder: (context) => const NavBar()));
                                  } else {
                                    showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: const Text('Erreur'),
                                          content: const Text(
                                              "L'otp n'a pas été validé!"),
                                          actions: [
                                            TextButton(
                                              child: const Text('Ok'),
                                              onPressed: () => Navigator.pop(context),
                                            )
                                          ],
                                        ));
                                  }}
                                )
                              ],
                            ));
                    },
                    
                    child: const Center(
                      child: Text(
                        'NFC',
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
            
            ]),
          ),
        ));
  }

  Future<void> tagRead2() async {
    var tag = await FlutterNfcKit.poll(timeout: Duration(seconds: 10),
    iosMultipleTagMessage: "Multiple tags found!", iosAlertMessage: "Scan your tag");
    for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
      otp = (record.toString());
    }
  }
  Future<void> validateNfc() async {
    if(context.read<Account>().findYubikey(otp)){
       var rep = await YubiValidator.validadeNfcTag(otp);
       valid = rep;
    }
  }
  Future<void> validate() async {
    if(context.read<Account>().findYubikey(otp)){
      var rep = await YubiValidator.validadeOtp(otp);
      valid = rep;
    }
  }
}