import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Classes/account.dart';
import '../popup/popupError.dart';
import '../../Classes/authentification.dart';
import 'mode_authentification.dart';
import '../setting/mode_authentification_selector.dart';

showAuthentificationPassword(BuildContext context) {
  var passwordController = TextEditingController();

  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.white,
    title: const Text("Veuillez entrer-votre mot de passe"),
    content: TextField(
      obscureText: true,
      controller: passwordController,
      onEditingComplete: () async {
        if (await Authentification.authentification(
            context.read<Account>().id, (passwordController.text).trim())) {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                  builder: (context) =>
                      const SettingAuthentificationMethodSelectorPage()));
        } else {
          
          Navigator.pop(context);
          showAlertDialog(context, "Le mot de passe est incorrecte");
        }
      },
    ),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
