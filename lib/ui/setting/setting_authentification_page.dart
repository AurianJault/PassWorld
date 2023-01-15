import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/account.dart';
import 'package:test/Classes/biometric/biometric.dart';
import 'package:test/ui/popup/mode_authentification_password.dart';
import 'package:test/ui/popup/popup.dart';
import 'package:test/ui/setting/setting_yubikeys_page.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import '../../Classes/localization/translation.dart';

class SettingAuthentificationPage extends StatefulWidget {
  const SettingAuthentificationPage({Key? key}) : super(key: key);

  @override
  State<SettingAuthentificationPage> createState() =>
      _SettingAuthentificationPage();
}

class _SettingAuthentificationPage extends State<SettingAuthentificationPage> {
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
                        .text('authentification_setting_page_title')),
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
                            Biometric biometric = Biometric();
                            if (await biometric.deviceSupport()) {
                              showNormalDialog(
                                  context,
                                  "Votre appareil peut utiliser la biométrie\navec l'application.",
                                  "Biométrie test");
                            } else {
                              showNormalDialog(
                                  context,
                                  "Désolé 😓\n\nVotre appareil n'est pas compatible avec l'application.\n\nSeulement android, IOS et windows est disponible pour l'instant",
                                  "Biométrie test");
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(h * 0.02),
                            child: Row(children: [
                              Icon(
                                const IconData(0xe287,
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
                                  Text("Biométrie test",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: w * 0.05)),
                                  Text(
                                    "Permet de savoir si votre appareil est compatible",
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
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            showNormalDialog(
                                context,
                                "La biométrie est un moyen d'authentification d'une personne à l'aide de données caractéristiques telles que l'iris, les traits du visages ou votre empreinte digitale.\n\nPour améliorer la sécurité de ses utilisateurs Passworld vous permet de vous connecter à l'aide de votre empreinte digitale. Pour ce faire, il faut que vous possidiez une empreinte pré-enregistrée sur votre appareil.",
                                "Information biométrie");
                          },
                          child: Padding(
                            padding: EdgeInsets.all(h * 0.02),
                            child: Row(children: [
                              Icon(
                                const IconData(0xe33d,
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
                                  Text("Information biométrie",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: w * 0.05)),
                                  Text(
                                    '''Quelques informations sur le fonctionnement de la biométrie avec l'application''',
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
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute<dynamic>(
                                builder: (context) => const SettingYubikeyPage()));
                          },
                          child: Padding(
                              padding: EdgeInsets.all(h * 0.02),
                              child: Row(children: [
                                Icon(
                                  const IconData(0xe42b,
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
                                    Text("Manager ses yubikey",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: w * 0.05)),
                                    Text(
                                      "Permet d'ajouter ou supprimer une yubikey pour se connecter avec",
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
                          onTap: () {
                            showAuthentificationPassword(context);
                          },
                          child: Padding(
                              padding: EdgeInsets.all(h * 0.02),
                              child: Row(children: [
                                Icon(
                                  const IconData(0xe3b2,
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
                                    Text("Mode d'authentification",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: w * 0.05)),
                                    Text(
                                      "Permet de choisir son mode d'authentification",
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
            SizedBox(
              height: h * 0.05,
            )
          ],
        ))));
  }
}
