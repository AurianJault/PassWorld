import 'package:test/Classes/yubikey_related/nonce.dart';
import 'package:http/http.dart' as http;
import 'package:nfc_manager/nfc_manager.dart';
import 'package:yubidart/src/nfc/record.dart';
import 'package:yubidart/src/nfc/wellknown_uri_record.dart';

class Authentificator {
  // static Future<bool> conventionalAuth(string id, string psswd)

  //Authentification seulement avec yubikey
  static Future<bool> yubikeyAuth(String id, String? otp)async{
      /*Verifier que l'yubikey est la bonne:
      - chercher l'user a partir de son id
      - parcourir user.secondFactors
      - si les 12 premiers characteres de otp ne correspondent a aucun id
      - erreur operation annulé car yubikey n'appartient pas a l'user
      */
      
      Nonce n = Nonce();

      final http.Response responseHttp = await http.get(
        Uri.parse(
            'https://api.yubico.com/wsapi/2.0/verify?id=1&otp=$otp&nonce=${n.nonce}'),
      );

    if (responseHttp.statusCode == 200) {
      final Uri uri = Uri.parse(Uri.encodeFull(
          'https://api.yubico.com/wsapi/2.0/verify?${responseHttp.body.replaceAll('\n', '&').replaceAll('\r', '')}'));
    } else {
      print("Error: http request failed");
      return false;
    }

    if(responseHttp.body.contains('OK')){
      return true;
    }else {
      return false;
    }
  }
  /*
  static Future<bool> twoFactorYubikeyAuth(String id, String psswd, String otp){
  if(conventionalAuth(id,psswd)) {
      if(yubikeyAuth(id,otp) {
        return true;
      }   
    }
    return false;
    */

  static String getOTPFromYubiKeyNFC(NfcTag tag) {
    final Ndef? tech = Ndef.from(tag);
    final NdefMessage? cachedMessage = tech!.cachedMessage;
    String otp = '';
    if (cachedMessage != null) {
      for (int i in Iterable<int>.generate(cachedMessage.records.length)) {
        final NdefRecord record = cachedMessage.records[i];
        final Record _record = Record.fromNdef(record);
        if (_record is WellknownUriRecord) {
          otp = '${_record.uri}';
          otp = otp.split('#')[1];
        }
      }
    }
    return otp;
  }


}