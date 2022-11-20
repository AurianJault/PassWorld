import 'dart:io';
import 'package:test/Classes/yubikey_related/yubiValidator.dart';


void main()async
{
  // var moi = Utilisateur("Aurian", "123soleil");
  // print(moi.identifiant);
  // print(moi.iv.base64);
  // print(moi.key.base64);
  // print(moi.salt.base64);
  // print(moi.hash.base64);
  // register("aurian", "123soleil");
  //register("theo", "123soleil");
  // if(await authentification("aurian", "123soleil")) {
  //   print("CA MARCHE");
  // } else {
  //   print("Marche po");
  // // }
  
  //if(await authentification("theo", "123soleil"))print("CA MARCHE");
  //else print("Marche po");
  
  print("Insert yubikey and press");
  String? otp = stdin.readLineSync();
  if(await YubiValidator.validadeOtp("cccccbeuildlhiifbnrcfbkjcultlchvdngdetfeeihf")){
    print("valid");
  } else{
    print("error");
  }
  /*
  if(await Authentificator.yubikeyAuth('1', otp)){
    print("valid");
  } else {
    print("error");
  }*/
}