import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/Exception/storageException.dart';
import 'package:test/Classes/account.dart';
import 'package:test/Classes/config.dart';
import 'package:test/ui/PopUp/popupError.dart';
import 'package:test/ui/Qrcode/qrcode_password.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import 'widget/setting_button.dart';
import 'Qrcode/qrcode.dart';

class SettingKeyPage extends StatefulWidget {
  const SettingKeyPage({Key? key}) : super(key: key);

  @override
  State<SettingKeyPage> createState() => _SettingKeyPage();
}

class _SettingKeyPage extends State<SettingKeyPage> {
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
                const PageTitleW(title: 'Clé de chiffrement'),
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
                            showQrcodePassword(context);
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
                                  Text("QR code",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: w * 0.05)),
                                  Text(
                                    '''Permet d'afficher le QR code de votre clé privée \npour la partager sur un autre appareil''',
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
                  SettingButtonWidget(
                    title: "Clé de chiffrement",
                    content: "Partage de la clé, changer de clé ",
                    icon: const IconData(0xf052b, fontFamily: 'MaterialIcons'),
                    page: const SettingKeyPage(),
                  ),
                ],
              ),
            ),
          ],
        ))));
  }
}
