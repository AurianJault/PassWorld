import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/yubikey_related/yubiValidator.dart';
import '../../Classes/account.dart';
import '../../Classes/yubikey_related/yubikey.dart';
import '../nav_bar.dart';
//import 'package:ndef/ndef.dart' as ndef;
import 'package:connectivity_plus/connectivity_plus.dart';

class YubikeyDemoPage extends StatefulWidget {
  const YubikeyDemoPage({Key? key}) : super(key: key);

  @override
  State<YubikeyDemoPage> createState() => _YubikeyDemoPageState();
}

class _YubikeyDemoPageState extends State<YubikeyDemoPage> {
  late String otp;
  bool valid = false;
  var otpController = TextEditingController();
  var staticPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showStaticPassword(){
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Insert your Yubikey"),
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    const Text("Input your static password"),
                      TextField(
                      controller: staticPassword,
                      decoration: const InputDecoration(
                        hintText: 'Enter Static',
                      ),
                    ),
                    const SizedBox(height: 16),
                    CupertinoButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      validateStatic(staticPassword.text);
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
                    },
                  )
                  ],
                ),
              ),
            ],
          );
        });
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
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 60, 145, 18),
                      borderRadius: BorderRadius.circular(12)),
                  child: InkWell(
                    onTap: () {
                      showStaticPassword();
                               },
                    child: const Center(
                      child: Text(
                        'STATIC',
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
    var tag = await FlutterNfcKit.poll(timeout: const Duration(seconds: 10),
    iosMultipleTagMessage: "Multiple tags found!", iosAlertMessage: "Scan your tag");
    for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
      otp = (record.toString());
    }
  }
  Future<void> validateNfc() async {
       var rep = await YubiValidator.validadeNfcTag(otp);
       valid = rep;
  }
  Future<void> validate() async {
    if(context.read<Account>().findYubikey(otp)){
      var rep = await YubiValidator.validadeOtp(otp);
      valid = rep;
    }
  }

  void validateStatic(String sp) {
    context.read<Account>().secondFactors.forEach((element) {
      if(element is Yubikey){
        if(sp == element.staticPassword){
          valid = true;
        }
      }
    });
  }
}