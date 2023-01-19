import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/ui/setting/setting_resgister_yubikey_page.dart';
import 'package:test/ui/widget/2fa_widget.dart';
import '../../Classes/account.dart';

class SettingYubikeyPage extends StatefulWidget {
  const SettingYubikeyPage({Key? key}) : super(key: key);

  @override
  State<SettingYubikeyPage> createState() => _SettingYubikeyPage();
}

class _SettingYubikeyPage extends State<SettingYubikeyPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double w = size.width; 
    double h = size.height; 
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: Consumer<Account>(builder: (context, account, child) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: account.secondFactors.isEmpty ? 1 : account.secondFactors.length,
                        itemBuilder: (context, index) {
                            if(account.secondFactors.isEmpty){
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("NO YUBIKEYS REGISTERED",
                                      style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    ),
                                  ],
                                ),
                              ); 
                            } else {
                              return Center(
                                child: Column (children: [
                                  twoFaWidget(
                                factor: account.accessTfa(index)),
                                ],)
                              );
                            }
                         });
                    }),
                  ),
                ),
            ),
            Padding(
              padding: EdgeInsets.only(top: h * 0.02),
              child: CupertinoButton(
                color: Colors.green[400],
                borderRadius: BorderRadius.circular(w * 0.04),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.01),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.add, color: Colors.white),
                      Text("New yubikey", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute<dynamic>(
                  builder: (context) => const RegisterYubikeyPage()));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: h * 0.02),
              child: CupertinoButton(
                color: Colors.red[400],
                borderRadius: BorderRadius.circular(w * 0.04),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03, vertical: h * 0.01),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text("Back", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),

            SizedBox(
              height: h * 0.03,
            ),
            // Back b...
          ],
        )));
  }
}

