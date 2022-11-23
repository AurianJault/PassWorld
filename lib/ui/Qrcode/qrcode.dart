import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import '../../Classes/storage.dart';
import 'package:screen_brightness_util_platform_interface/screen_brightness_util_platform_interface.dart';

showQrcode(BuildContext context,String id) async{

   AlertDialog  alert = AlertDialog(  
    backgroundColor: Colors.deepPurple[300],
    content: PrettyQr(
            image: const AssetImage('assets/bereal.png'), //mettre l'icone de l'app
            typeNumber: 6,
            size: 500,
            data:(await Storage.getKey(id)).base64+(await Storage.getIV(id)).base64,
            errorCorrectLevel: QrErrorCorrectLevel.M,
            roundEdges: false,
          ),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}