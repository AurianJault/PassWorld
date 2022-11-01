import 'dart:io';

import 'package:test/Classes/authentification.dart';


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
  String? y = stdin.readLineSync();
  if(await authentificationOtp(y)){
    print("Validated!");
  } else {
    print("Impossible to validate otp");
  }
}