import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

showQrcode(BuildContext context,String id){
    QrImage(
    data: id,
    version: 1,
    size: 320,
    gapless: false,
    errorStateBuilder: (cxt, err) {
      return Container(
        child:const Center(
          child: Text(
            "Uh oh! Something went wrong...",
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
  );
}