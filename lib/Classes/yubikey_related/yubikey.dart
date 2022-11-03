/*
* Cette classe reprensente une yubikey
* _id : id unique de l'yubikey, présent dans l'otp
*/

import 'package:test/Classes/yubikey_related/two_fa.dart';

class Yubikey extends TwoFA{
  late String id;

  Yubikey(String name, String i): super(name){
    id = i;
  }
}