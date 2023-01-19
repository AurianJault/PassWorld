import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/accountManager.dart';

import '../../Classes/account.dart';
import '../../Classes/config.dart';
import '../../Classes/localization/translation.dart';
import '../widget/page_title_widget.dart';
import '../widget/settingwidget/authentification_selector.dart';

class SettingAuthentificationMethodSelectorPage extends StatefulWidget {
  const SettingAuthentificationMethodSelectorPage({Key? key}) : super(key: key);

  @override
  State<SettingAuthentificationMethodSelectorPage> createState() =>
      _SettingAuthentificationMethodSelectorPage();
}

class _SettingAuthentificationMethodSelectorPage
    extends State<SettingAuthentificationMethodSelectorPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height; // * MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            PageTitleW(
                title: LanguageTranslation.of(context)!
                .text('authentification_setting_page_title')),
                // ignore: prefer_interpolation_to_compose_strings
                Text('Your current mehtod is: ' + AccountManager.getAuthMethod(context.read<Account>())),
            SizedBox(
              height: h * 0.05,
            ),
            InkWell(
              onTap: () async {
                context.read<Account>().authMethod = AccountManager.chooseAuthentificationMethod(context.read<Account>(), 1);
                var path = Config();
                await path.setAppDirPath();
                context.read<Account>().saveFile(path.appDirPath.path);
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text("Update"),
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              Text("New method is now: " + AccountManager.getAuthMethod(context.read<Account>())),
                              const SizedBox(height: 16),
                              CupertinoButton(
                              child: const Text("Ok"),
                              onPressed: () {
                                  Navigator.pop(context);
                              },
                            )
                            ],
                          ),
                        ),
                      ],
                    );
                  });
              },
              child: AuthentificationSelector(
                title: "Mot de passe",
                icon: const IconData(0xe47a, fontFamily: 'MaterialIcons')),
            ),
            SizedBox(
              height: h * 0.03,
            ),

            InkWell(
              onTap: () async {
                context.read<Account>().authMethod = AccountManager.chooseAuthentificationMethod(context.read<Account>(), 5);
                var path = Config();
                await path.setAppDirPath();
                context.read<Account>().saveFile(path.appDirPath.path);
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text("Update"),
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              Text("New method is now: " + AccountManager.getAuthMethod(context.read<Account>())),
                              const SizedBox(height: 16),
                              CupertinoButton(
                              child: const Text("Ok"),
                              onPressed: () {
                                  Navigator.pop(context);
                              },
                            )
                            ],
                          ),
                        ),
                      ],
                    );
                  });
              },
            child: AuthentificationSelector(
                title: "Biométrie",
                icon: const IconData(0xf075, fontFamily: 'MaterialIcons')),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            
            InkWell(
              onTap: () async {
                context.read<Account>().authMethod = AccountManager.chooseAuthentificationMethod(context.read<Account>(), 2);
                var path = Config();
                await path.setAppDirPath();
                context.read<Account>().saveFile(path.appDirPath.path);
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text("Update"),
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              Text("New method is now: " + AccountManager.getAuthMethod(context.read<Account>())),
                              const SizedBox(height: 16),
                              CupertinoButton(
                              child: const Text("Ok"),
                              onPressed: () {
                                  Navigator.pop(context);
                              },
                            )
                            ],
                          ),
                        ),
                      ],
                    );
                  });
              },
            child: AuthentificationSelector(
                title: "Yubikey",
                icon: const IconData(0xe42b, fontFamily: 'MaterialIcons')),
              ),
            SizedBox(
              height: h * 0.03,
            ),
            
            InkWell(
              onTap: () async {
                context.read<Account>().authMethod = AccountManager.chooseAuthentificationMethod(context.read<Account>(), 4);
                var path = Config();
                await path.setAppDirPath();
                context.read<Account>().saveFile(path.appDirPath.path);
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text("Update"),
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              Text("New method is now: " + AccountManager.getAuthMethod(context.read<Account>())),
                              const SizedBox(height: 16),
                              CupertinoButton(
                              child: const Text("Ok"),
                              onPressed: () {
                                  Navigator.pop(context);
                              },
                            )
                            ],
                          ),
                        ),
                      ],
                    );
                  });
              },
            child: AuthentificationSelector(
                title: "2FA - Mot de passe/Biométrie",
                icon: const IconData(0xe47a, fontFamily: 'MaterialIcons')),),
            SizedBox(
              height: h * 0.03,
            ),
            InkWell(
              onTap: () async {
                context.read<Account>().authMethod = AccountManager.chooseAuthentificationMethod(context.read<Account>(), 3);
                var path = Config();
                await path.setAppDirPath();
                context.read<Account>().saveFile(path.appDirPath.path);
                showDialog(
                  context: context,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text("Update"),
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              const SizedBox(height: 16),
                              Text("New method is now: " + AccountManager.getAuthMethod(context.read<Account>())),
                              const SizedBox(height: 16),
                              CupertinoButton(
                              child: const Text("Ok"),
                              onPressed: () {
                                  Navigator.pop(context);
                              },
                            )
                            ],
                          ),
                        ),
                      ],
                    );
                  });
                },
              child: AuthentificationSelector(
                title: "2FA - Mot de passe/Yubikey",
                icon: const IconData(0xe47a, fontFamily: 'MaterialIcons')),
            ),
            
            SizedBox(
              height: h * 0.03,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  width: w * 0.2,
                  height: h * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(w * 0.04)),
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.03, vertical: h * 0.01),
                      child: Center(
                        child: Text(
                          'Back',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: w * 0.04),
                        ),
                      ))),
            )
          ]),
        ),
      ),
    );
  }
}
