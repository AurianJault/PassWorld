import 'dart:math';
import 'package:flutter/widgets.dart';

class Generator{

  Map<int,String> carac = {0:"abcdefghijklmnopqrstuvwxyz",1:"ABCDEFGHIJKLMNOPQRSTUVWXYZ",2:"0123456789",3:"%*\$&#{([\\@)]=}+",4:"~\"'-|`_^°£µ!§:;.,?œ"};

  String? generator(int length,List<int> caracIn, String caracOut){
    String chars="";
    for(var num in caracIn) {
      chars =chars+(carac[num]??"");
    }
    for(int i=0;i<caracOut.length;i++){
      chars = chars.replaceAll(caracOut[i], "");
    }
    Random rnd = Random.secure();
    return List.generate(length, (index) => chars[rnd.nextInt(chars.length)]).join();
  }
}