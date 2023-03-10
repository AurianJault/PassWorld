import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/account.dart';
import 'package:test/ui/setting/setting_account_page.dart';
import 'package:test/ui/login_page.dart';
import 'package:test/ui/setting/setting_auth_methods_page.dart';
import 'package:test/ui/setting/setting_authentification_page.dart';
import 'package:test/ui/setting/setting_key_page.dart';
import 'package:test/ui/setting/setting_theme_page.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import 'package:test/ui/widget/settingwidget/setting_button.dart';

import '../Classes/localization/translation.dart';
import '../Classes/vault.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  padding: const EdgeInsets.all(25),
                  child: PageTitleW(
                      title: LanguageTranslation.of(context)!
                          .text('setting_title'))),
              SizedBox(
                height: h * 0.05,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: w * 0.02),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(w * 0.01)),
                  child: SettingButtonWidget(
                    title: LanguageTranslation.of(context)!
                        .text('account_setting_title'),
                    content: LanguageTranslation.of(context)!
                        .text('account_setting_description'),
                    icon: const IconData(0xf522, fontFamily: 'MaterialIcons'),
                    page: const SettingAccountPage(),
                  )),
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
                    SettingButtonWidget(
                      title: LanguageTranslation.of(context)!
                          .text('authentification_setting_title'),
                      content: LanguageTranslation.of(context)!
                          .text('authentification_setting_description'),
                      icon:
                          const IconData(0xf0553, fontFamily: 'MaterialIcons'),
                      page: const SettingAuthentificationPage(),
                    ),
                    SettingButtonWidget(
                      title: LanguageTranslation.of(context)!
                          .text('key_setting_title'),
                      content: LanguageTranslation.of(context)!
                          .text('key_setting_description'),
                      icon:
                          const IconData(0xf052b, fontFamily: 'MaterialIcons'),
                      page: const SettingKeyPage(),
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
                    SettingButtonWidget(
                      title: LanguageTranslation.of(context)!
                          .text('theme_setting_title'),
                      content: LanguageTranslation.of(context)!
                          .text('theme_setting_description'),
                      icon: const IconData(0xf14f, fontFamily: 'MaterialIcons'),
                      page: const SettingThemePage(),
                    ),
                    SettingButtonWidget(
                      title: LanguageTranslation.of(context)!
                          .text('about_setting_title'),
                      content: LanguageTranslation.of(context)!
                          .text('about_setting_description'),
                      icon: const IconData(0xe33d, fontFamily: 'MaterialIcons'),
                      page: const LoginPage(),
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
                  child: InkWell(
                      onTap: () {
                        context.read<Account>().setVault = Vault();
                        Navigator.push(
                            context,
                            MaterialPageRoute<dynamic>(
                                builder: (context) => const LoginPage()));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(h * 0.02),
                        child: Text(
                            LanguageTranslation.of(context)!
                                .text('logout_title'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: w * 0.065)),
                      ))),
              SizedBox(
                height: h * 0.05,
              )
            ],
          )),
        ));
  }
}
