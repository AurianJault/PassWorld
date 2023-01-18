import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import '../../Classes/storage.dart';
import 'package:screen_brightness_util/screen_brightness_util.dart';

showQrcode(BuildContext context, String id) async {
  var size = MediaQuery.of(context).size;
  double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
  double h = size.height;

  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.deepPurple[300],
    content: PrettyQr(
      image: const AssetImage('assets/null.png'), //mettre l'icone de l'app
      typeNumber: 6,
      size: w * 0.6,
      data: (await Storage.getKey(id)).base64 +
          " " +
          (await Storage.getIV(id)).base64,
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

Future<void> setBrightness(double brightness) async {
  try {
    await ScreenBrightnessUtil().setBrightness(brightness);
  } catch (e) {
    print(e);
    throw 'Failed to set brightness';
  }
}
