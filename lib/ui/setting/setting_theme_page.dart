import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/account.dart';
import 'package:test/Classes/localization/translation.dart';
import 'package:test/ui/popup/language_popup.dart';
import 'package:test/ui/qrcode/qrcode_password.dart';
import 'package:test/ui/widget/settingwidget/share_widget.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import '../popup/popupError.dart';

class SettingThemePage extends StatefulWidget {
  const SettingThemePage({Key? key}) : super(key: key);

  @override
  State<SettingThemePage> createState() => _SettingThemePage();
}

class _SettingThemePage extends State<SettingThemePage> {
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
                        .text('theme_setting_title')),
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
                          onTap: () async {
                            //changement du master password
                          },
                          child: Padding(
                            padding: EdgeInsets.all(h * 0.02),
                            child: Row(children: [
                              Icon(
                                const IconData(0xe1b0,
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
                                  Text(
                                      LanguageTranslation.of(context)!
                                          .text('theme_mode_title'),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: w * 0.05)),
                                  Text(
                                    LanguageTranslation.of(context)!
                                        .text('theme_mode_description'),
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
                child: Row(children: [
                  Expanded(
                      child: InkWell(
                          onTap: (() {
                            setState(() {
                              languageSelector(context);
                            });
                          }),
                          child: Padding(
                              padding: EdgeInsets.all(h * 0.02),
                              child: Row(children: [
                                Icon(
                                  const IconData(0xf14f,
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
                                    Text(
                                        LanguageTranslation.of(context)!
                                            .text('language_title'),
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: w * 0.05)),
                                    Text(
                                      LanguageTranslation.of(context)!
                                          .text('language_description'),
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
                              ]))))
                ])),
          ],
        ))));
  }
}
