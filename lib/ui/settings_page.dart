import 'package:flutter/material.dart';
import 'package:test/ui/login_page.dart';
import 'package:test/ui/setting_key_page.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import 'package:test/ui/widget/SettingWidget/setting_button.dart';

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
                  child: const PageTitleW(title: 'Settings')),
              SizedBox(
                height: h * 0.05,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: w * 0.02),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[300],
                      borderRadius: BorderRadius.circular(w * 0.01)),
                  child: SettingButtonWidget(
                    title: "Account",
                    content:
                        "Adresse mail, mot-de-passe maître,\nsuppression de compte",
                    icon: const IconData(0xf522, fontFamily: 'MaterialIcons'),
                    page: const LoginPage(),
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
                      title: "Méthodes d'authentification",
                      content: "2 facteurs, Yubikey, biométrique",
                      icon:
                          const IconData(0xf0553, fontFamily: 'MaterialIcons'),
                      page: const LoginPage(),
                    ),
                    SettingButtonWidget(
                      title: "Clé de chiffrement",
                      content: "Partage de la clé, changer de clé ",
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
                      title: "Thème",
                      content: "Mode nuit, thème sombre, langue",
                      icon: const IconData(0xf14f, fontFamily: 'MaterialIcons'),
                      page: const LoginPage(),
                    ),
                    SettingButtonWidget(
                      title: "About",
                      content: "Qui sommes-nous, dêpot du projet ",
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
                        Navigator.push(
                            context,
                            MaterialPageRoute<dynamic>(
                                builder: (context) => const LoginPage()));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(h * 0.02),
                        child: Text("Déconnexion",
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
