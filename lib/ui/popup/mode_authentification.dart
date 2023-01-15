import 'package:flutter/material.dart';
import 'package:io/ansi.dart';
import 'package:provider/provider.dart';
import 'package:test/ui/widget/settingwidget/authentification_selector.dart';
import '../../Classes/account.dart';
import '../popup/popupError.dart';
import '../../Classes/authentification.dart';

showAuthentificationSelector(BuildContext context) {
  var size = MediaQuery.of(context).size;
  double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
  double h = size.height; // * MediaQuery.of(context).devicePixelRatio;

  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.white,
    title: const Text("Mode d'authentification"),
    titlePadding: EdgeInsetsDirectional.only(start: w * 0.2),
    actions: [
      AuthentificationSelector(
          title: "Mot de passe",
          icon: const IconData(0xe47a, fontFamily: 'MaterialIcons')),
      AuthentificationSelector(
          title: "Biométrie",
          icon: const IconData(0xf075, fontFamily: 'MaterialIcons')),
      AuthentificationSelector(
          title: "Yubikey",
          icon: const IconData(0xe42b, fontFamily: 'MaterialIcons')),
      AuthentificationSelector(
          title: "2FA - Mot de passe/Biométrie",
          icon: const IconData(0xe47a, fontFamily: 'MaterialIcons')),
      AuthentificationSelector(
          title: "2FA - Mot de passe/Yubikey",
          icon: const IconData(0xe47a, fontFamily: 'MaterialIcons')),
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
