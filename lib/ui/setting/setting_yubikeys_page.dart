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
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height; // * MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              child: 

               Flexible(
               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                 child: ScrollConfiguration(
                   behavior: ScrollConfiguration.of(context)
                       .copyWith(scrollbars: false),
                   child: Consumer<Account>(builder: (context, account, child) {
                   return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: account.secondFactors.isEmpty ? 1 : account.secondFactors.length,
                          itemBuilder: (context, index) {
                            if(account.secondFactors.isEmpty){
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("No 2FA methods are configured",
                                      style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
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
                                              Text("Add 2FA", style: TextStyle(color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                        onPressed: () {
                                           showCupertinoModalPopup(
                                            context: context,
                                            builder: (context) {
                                              return CupertinoActionSheet(
                                                title: const Text("Select 2FA method"),
                                                actions: [
                                                  CupertinoActionSheetAction(
                                                    child: const Text("twoFA"),
                                                    onPressed: () {
                                                      Navigator.push(
                                                      context,
                                                      MaterialPageRoute<dynamic>(
                                                          builder: (context) =>
                                                              const RegisterYubikeyPage()))
                                                  .then((_) => setState(() {}));
                                                    },
                                                  ),
                                                  CupertinoActionSheetAction(
                                                    child: const Text("Fingerprint"),
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
                                                      // Navigate to the fingerprint registration page
                                                    },
                                                  ),
                                                ],
                                                cancelButton: CupertinoActionSheetAction(
                                                  isDefaultAction: true,
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("Cancel"),
                                                ),
                                              );
                                            },
                                          );

                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ); 
                            } else {
                              return twoFaWidget(
                                factor: account.accessTfa(index));
                            }

                         });
                  }),
                ),
              ),
             ),
            ),

            Container(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    width: w * 0.2,
                    height: h * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(w * 0.04)),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.03, vertical: h * 0.01),
                        child: Center(
                          child: Text(
                            'Back',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: w * 0.04),
                          ),
                        ))),
              ),
            )
          ]
        )
        )
        )
        );
  }
}
