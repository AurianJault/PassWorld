import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../Classes/Exception/storageException.dart';
import '../../../Classes/account.dart';
import '../../../Classes/authentification.dart';
import '../../../Classes/storage.dart';
import '../../PopUp/popupError.dart';

showShare(BuildContext context) async {
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
              if (Platform.isLinux || Platform.isWindows) {
                File("path").writeAsStringSync(
                    (await Storage.getKey(context.read<Account>().id)).base64 +
                        (await Storage.getIV(context.read<Account>().id))
                            .base64,
                    mode: FileMode.writeOnly);
              } else {
                await Share.share('check out my website https://example.com',
                    subject: 'Look what I made!');
              }
            } on StorageException catch (e) {
              showAlertDialog(context, e.message);
            }
          } else {
            Navigator.pop(context);
            showAlertDialog(context, "Le mot de passe est incorrecte");
          }
        }),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
