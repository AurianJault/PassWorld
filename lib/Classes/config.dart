import 'dart:io' show Platform;
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;

class Config extends ChangeNotifier {
  late io.Directory appDirPath;
  late List<int> charac;

  Config() {
    appDirPath = io.Directory("");
    charac = [
      0,
      1,
      2,
      3,
      4,
    ];
  }

  Future<void> setAppDirPath() async {
    if (Platform.isLinux) {
      appDirPath = io.Directory(
          "${Platform.environment['HOME'].toString()}/.passworld/");
      await setDirectory();
    } else {
      // appDirPath = io.Directory("/data/user/0");
      appDirPath = await getApplicationDocumentsDirectory();
      await setDirectory();
    }
  }

  Future<void> setDirectory() async {
    if (!io.Directory(appDirPath.path).existsSync()) {
      io.Directory(appDirPath.path).createSync();
    }
    if (!io.File(p.join(appDirPath.path, "file.txt")).existsSync()) {
      print("LE FICHIER NEXISTE PAS ");
      io.File("${appDirPath.path}/file.txt").create();
    }
    else 
    {
      print("LE FICHIER EXISTE");
    }
  }

  void addCharacter(int i) {
    if (charac.contains(i)) {
      charac.remove(i);
    } else {
      charac.add(i);
    }
  }

  void addAll() {
    for (int i = 0; i < 4; i++) {
      charac.add(i);
    }
  }

  void clearCharacter() {
    charac.clear();
  }
}
