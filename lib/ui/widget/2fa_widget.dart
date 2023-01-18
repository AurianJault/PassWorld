import 'package:provider/provider.dart';
import 'package:test/Classes/accountManager.dart';
import 'package:test/Classes/yubikey_related/two_fa.dart';
import 'package:test/Classes/yubikey_related/yubikey.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../Classes/account.dart';
import '../../Classes/config.dart';
import '../setting/setting_yubikeys_page.dart';

class twoFaWidget extends StatelessWidget {
  TwoFA? factor;

  twoFaWidget({super.key, required this.factor});

  @override
  Widget build(BuildContext context) {
    // Media Query
    var size = MediaQuery.of(context).size;
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height; // * MediaQuery.of(context).devicePixelRatio;
      // Logo
      String logo = "";
      if(factor is Yubikey){
        logo = "assets/yubico.png";
      } // else if factor biometrie / facial

      // Widget
      return Padding(
        padding: EdgeInsets.only(bottom: h * 0.015),
        child: InkWell(
        child: Container(
          height: h * 0.07,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(w * 0.02)),
          child: Padding(
            padding: EdgeInsets.all(w * 0.015),
            child: Row(
              children: [
                Image.asset(
                  logo,
                ),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.02),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: w * 0.005),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          factor!.nom,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: w * 0.035,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  child: Icon(
                    Icons.delete,
                    size: w * 0.08,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Confirmation"),
                          content: const Text("Are you sure you want to delete your yubikey?"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Yes"),
                              onPressed: () async {
                                AccountManager.removeYubikey(factor as Yubikey,context.read<Account>() );
                                var path = Config();
                                await path.setAppDirPath();
                                context.read<Account>().saveFile(path.appDirPath.path);
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                Navigator.push(context, MaterialPageRoute<dynamic>(
                                builder: (context) => const SettingYubikeyPage()));
                              },
                            ),
                            TextButton(onPressed:
                            (){Navigator.of(context).pop();}, 
                            child: const Text("Cancel"))
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
        ),
      );
  }
}
