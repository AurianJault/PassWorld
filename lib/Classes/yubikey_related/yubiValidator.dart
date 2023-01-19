import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:test/Classes/yubikey_related/nonce.dart';

/* GERER LES ERREURS AVEC DES EXCEPTIONS*/

class  YubiValidator {
  static Future<bool> validadeOtp(String? otp) async {
    if(otp == null) return false; // pas de otp en parametre
    Nonce n = Nonce();

    final http.Response rep = await http.get(
      Uri.parse(
        'https://api.yubico.com/wsapi/2.0/verify?id=1&otp=$otp&nonce=${n.nonce}'
      )
    );
    if(rep.statusCode == 200){
      if(rep.body.contains('OK')) {
        return true;
      }
    } 
    return false;
  }

  static Future<bool> validadeNfcTag(String? record) async {
    if(record == null) return false; // pas de otp en p
    int found = record.indexOf("#");
    if(found == -1){
      return false; // '#' doesn't exist in string 
    }
    String otp = record.substring(found+1);
    return validadeOtp(otp);
  }
}