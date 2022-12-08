import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'qrcode.dart';
import '../../Classes/account.dart';
import '../../Classes/Exception/storageException.dart';
import '../PopUp/popupError.dart';

showQrcodePassword(BuildContext context) {
  var passwordController = TextEditingController();

  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.white,
    title: const Text("QR Code Password"),
    content: TextField(
      obscureText: true,
      controller: passwordController,
      onEditingComplete: () {
        Navigator.pop(context);
        try {
          showQrcode(
              context, context.read<Account>().id, passwordController.text);
        } on StorageException catch (e) {
          showAlertDialog(context, e.message);
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
