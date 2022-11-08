import 'dart:io';
import 'package:test/Classes/authentificator.dart';


void main()async
{  
  print("Insert yubikey and press");
  String? otp = stdin.readLineSync();
  if(await Authentificator.yubikeyAuth('1', otp)){
    print("valid");
  } else {
    print("error");
  }
}