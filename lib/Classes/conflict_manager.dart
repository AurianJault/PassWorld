import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:test/Classes/vault.dart';
import '../ui/popup/pop_up_conflict.dart';
import 'Datas/i_data_strategy.dart';
import 'Datas/pass_file.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io' as io;
import 'package:path/path.dart' as p;

class ConflictManager {
  static Future<Vault> manager(
      BuildContext context, String id, String path) async {
    if (await Connectivity().checkConnectivity() == ConnectivityResult.none || !await io.File(p.join(path,"${id}.sqlite.down")).exists()) {
      //adding when there is no file in db
      if (!await io.File(p.join(path,"${id}.sqlite")).exists()) {
        // no db file and no local file
        return Vault();
      } else {
        // no no db file
        return await loadSaved(id, path);
      }
    } else {
      Vault downVault = await loadDown(id, path);

      if (!await io.File(p.join(path,"${id}.sqlite.down")).exists()) {
        File(p.join(path,"${id}.sqlite.down")).rename(path + id);
        return downVault;
      } else {
        bool found = false;
        Vault finalVault = Vault();
        var savedVault = await loadSaved(id, path);
        for (var element in downVault.passwordList) {
          found = false;
          for (var sav in savedVault.passwordList) {
            if (element.getId == sav.getId) {
              print('same');
              if (element.getId != sav.getId ||
                  element.getName != sav.getName ||
                  element.getPassword != sav.getPassword ||
                  element.getWebsite != sav.getWebsite ||
                  element.getUsername != sav.getUsername ||
                  element.getEmail != sav.getEmail ||
                  element.getNote != sav.getNote ||
                  element.getCreationDate != sav.getCreationDate ||
                  element.getModifDate != sav.getModifDate) {
                print('conflict!');
                int res = 0;
                res = await showConflictDialog(
                    context, element, sav); //call pop up to decide
                if (res == 0) {
                  finalVault.addPassword(element);
                } else {
                  finalVault.addPassword(sav);
                }
              } else {
                finalVault.addPassword(element);
              }
              found = true;
              break;
            }
          }
          if (found == false) {
            finalVault.addPassword(element);
          }
        }

        for (var sav in savedVault.passwordList) {
          for (var fin in finalVault.passwordList) {
            if (sav.getId == fin.getId) {
              break;
            }
          }
          finalVault.addPassword(sav);
        }

        await io.File(p.join(path,"${id}.sqlite.down")).delete();
        return finalVault;
      }
    }
  }

  static Future<Vault> loadSaved(id, path) async {
    IDataStrategy dbSaved = PassFile(id, path); // change path
    var vaultSaved = dbSaved.loadPasswords();
    return vaultSaved;
  }

  static Future<Vault> loadDown(id, path) async {
    /*
      Load list of passwords and save it in "id".sqlite.down
    */
    IDataStrategy dbDown = PassFile.down(id, path); // change path
    var vaultDown = dbDown.loadPasswords();
    return vaultDown;
  }
}
