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
          ]),
        ),
      ),
    );
  }
}
