import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';

import '../../../Classes/Exception/storageException.dart';
import '../../../Classes/account.dart';
import '../../../Classes/authentification.dart';
import '../../../Classes/storage.dart';
import '../../popup/popupError.dart';

showShare(BuildContext context) async {
  var passwordController = TextEditingController();

  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.white,
    title: const Text("Veuillez entrer-votre mot de passe"),
    content: TextField(
        obscureText: true,
        controller: passwordController,
        onEditingComplete: () async {
          if (await Authentification.authentication(
              context.read<Account>().id, (passwordController.text).trim())) {
            Navigator.pop(context);
            try {
              if (Platform.isLinux || Platform.isWindows) {
                Directory? init = await getDownloadsDirectory();
                String? output = await FilePicker.platform.saveFile(
                    dialogTitle: 'Please select an output file',
                    fileName: 'passworld.pdf',
                    initialDirectory: (init)!.path);
                if (output != null) {
                  File(output).writeAsStringSync(
                      (await Storage.getKey(context.read<Account>().id))
                              .base64 +
                          " " +
                          (await Storage.getIV(context.read<Account>().id))
                              .base64,
                      mode: FileMode.writeOnly);
                }
                return;
              } else {
                await Share.share(
                    (await Storage.getKey(context.read<Account>().id)).base64 +
                        (await Storage.getIV(context.read<Account>().id))
                            .base64);
              }
            } on StorageException catch (e) {
              showAlertDialog(context, e.message);
            }
          } else {
            Navigator.pop(context);
            showAlertDialog(context, "Le mot de passe est incorrect");
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
