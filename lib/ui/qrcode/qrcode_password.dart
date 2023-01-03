import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'qrcode.dart';
import '../../Classes/account.dart';
import '../../Classes/Exception/storageException.dart';
import '../popup/popupError.dart';
import '../../Classes/authentification.dart';

showQrcodePassword(BuildContext context) {
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
          try {
            showQrcode(context, context.read<Account>().id);
          } on StorageException catch (e) {
            showAlertDialog(context, e.message);
          }
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
