import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:process_run/shell.dart';
import 'package:process_run/which.dart';

class Config extends ChangeNotifier {
  String appDirPath = "";

  Config();

  void setAppDirPath() async {
    if (defaultTargetPlatform == TargetPlatform.linux) {
      // Check path for android
    }

    Directory appDocDir = await getApplicationDocumentsDirectory();
    appDirPath = appDocDir.path;
  }
}
