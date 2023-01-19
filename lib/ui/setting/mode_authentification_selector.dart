import 'package:flutter/material.dart';

import '../../Classes/localization/translation.dart';
import '../widget/page_title_widget.dart';
import '../widget/settingwidget/authentification_selector.dart';

class SettingAuthentificationMethodSelectorPage extends StatefulWidget {
  const SettingAuthentificationMethodSelectorPage({Key? key}) : super(key: key);

  @override
  State<SettingAuthentificationMethodSelectorPage> createState() =>
      _SettingAuthentificationMethodSelectorPage();
}

class _SettingAuthentificationMethodSelectorPage
    extends State<SettingAuthentificationMethodSelectorPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height; // * MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            PageTitleW(
                title: LanguageTranslation.of(context)!
                    .text('authentification_setting_page_title')),
            SizedBox(
              height: h * 0.05,
            ),
            AuthentificationSelector(
                title: "Mot de passe",
                icon: const IconData(0xe47a, fontFamily: 'MaterialIcons')),
            SizedBox(
              height: h * 0.03,
            ),
            AuthentificationSelector(
                title: "Biométrie",
                icon: const IconData(0xf075, fontFamily: 'MaterialIcons')),
            SizedBox(
              height: h * 0.03,
            ),
            AuthentificationSelector(
                title: "Yubikey",
                icon: const IconData(0xe42b, fontFamily: 'MaterialIcons')),
            SizedBox(
              height: h * 0.03,
            ),
            AuthentificationSelector(
                title: "2FA - Mot de passe/Biométrie",
                icon: const IconData(0xe47a, fontFamily: 'MaterialIcons')),
            SizedBox(
              height: h * 0.03,
            ),
            AuthentificationSelector(
                title: "2FA - Mot de passe/Yubikey",
                icon: const IconData(0xe47a, fontFamily: 'MaterialIcons')),
            SizedBox(
              height: h * 0.03,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  width: w * 0.2,
                  height: h * 0.06,
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
            )
          ]),
        ),
      ),
    );
  }
}
