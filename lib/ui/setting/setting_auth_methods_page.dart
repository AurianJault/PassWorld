import 'package:flutter/material.dart';
import 'package:test/ui/setting/setting_yubikeys_page.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import '../../Classes/localization/translation.dart';

class SettingAuthPage extends StatefulWidget {
  const SettingAuthPage({Key? key}) : super(key: key);

  @override
  State<SettingAuthPage> createState() => _SettingAuthPage();
}

class _SettingAuthPage extends State<SettingAuthPage> {
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
              child: Row(children: [
                PageTitleW(
                    title: LanguageTranslation.of(context)!
                        .text('authentification_setting_title')),
                const Spacer(),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      const IconData(0xf141,
                          fontFamily: 'MaterialIcons',
                          matchTextDirection: true),
                      size: w * 0.06,
                    ))
              ]),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: w * 0.02),
              decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(w * 0.01)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute<dynamic>(
                                builder: (context) => const SettingYubikeyPage()));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(h * 0.02),
                            child: Row(children: [
                              Icon(
                                const IconData(0xe4f6,
                                    fontFamily: 'MaterialIcons'),
                                size: w * 0.08,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: w * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("2FA",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: w * 0.05)),
                                  Text(
                                    '''reeinforce security by adding a second factor to login''',
                                    style: TextStyle(
                                        fontSize: w * 0.02,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Icon(
                                const IconData(0xe355,
                                    fontFamily: 'MaterialIcons'),
                                size: w * 0.06,
                                color: Colors.white,
                              )
                            ]),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: h * 0.05,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: w * 0.02),
              decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(w * 0.01)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // selection de methode d'authentification (nouvelle page?)
                          },
                          child: Padding(
                            padding: EdgeInsets.all(h * 0.02),
                            child: Row(children: [
                              Icon(
                                const IconData(0xe4f6,
                                    fontFamily: 'MaterialIcons'),
                                size: w * 0.08,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: w * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Select login method",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: w * 0.05)),
                                  Text(
                                    '''chose your type of authentification''',
                                    style: TextStyle(
                                        fontSize: w * 0.02,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Icon(
                                const IconData(0xe355,
                                    fontFamily: 'MaterialIcons'),
                                size: w * 0.06,
                                color: Colors.white,
                              )
                            ]),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ))));
  }
}
