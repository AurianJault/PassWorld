import 'dart:io';
import 'package:test/Classes/account.dart';
import 'package:test/Classes/authentificator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:math';
import 'package:test/Classes/yubikey_related/yubiValidator.dart';


void main()async
{  
  TestWidgetsFlutterBinding.ensureInitialized();
  Account test = new Account("Aurian", "123");
  print(test.id);
  /*
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
