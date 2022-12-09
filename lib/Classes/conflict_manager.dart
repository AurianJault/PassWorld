import 'dart:io';

import 'Datas/i_data_strategy.dart';
import 'Datas/pass_file.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io' as io;


class ConflictManager{
  var id ;
  var path;

  ConflictManager(String id,String path){
    id = id;
    path=path;}

  void loader()async{
    var fileDown = File(path+id+".sqlite.down");
    /*
    if(await Connectivity().checkConnectivity()==ConnectivityResult.none){
      return;//throw exception
    }
    */
    if(!await io.File(path+id.sqlite).exists()){
      fileDown.rename(path+id);
    }
  }

}