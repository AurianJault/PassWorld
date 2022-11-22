import 'dart:io' show Platform;
import 'dart:io' as io;
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class Config extends ChangeNotifier {
  String appDirPath = "";

  Config();

  void setAppDirPath() async {
    if (Platform.isLinux) {
      appDirPath = "${Platform.environment['HOME'].toString()}/.passworld/";
      setDirectory();
    } else {
      var dir = await getApplicationDocumentsDirectory();
      appDirPath = dir.path;
    }
  }

  void setDirectory() {
    if (!io.Directory(appDirPath).existsSync()) {
      io.Directory(appDirPath).createSync();
    }
    if(!io.File("${appDirPath}file.txt").existsSync()) {
      io.File("${appDirPath}file.txt").createSync();
    }
  }
}
