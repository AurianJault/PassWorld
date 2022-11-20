import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:test/Classes/yubikey_related/nonce.dart';

Future<bool> sendCode(String? y) async {

  Nonce n = new Nonce();

  final http.Response responseHttp = await http.get(
        Uri.parse(
            'https://api.yubico.com/wsapi/2.0/verify?id=1&otp=$y&nonce=${n.nonce}'),
      );

  if (responseHttp.statusCode == 200) {
        final Uri uri = Uri.parse(Uri.encodeFull(
            'https://api.yubico.com/wsapi/2.0/verify?${responseHttp.body.replaceAll('\n', '&').replaceAll('\r', '')}'));
  } else {
    print("error");
    return false;
  }

  if(responseHttp.body.contains('OK')){
    return true;
  }else {
    return false;
  }
}
