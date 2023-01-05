import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/ui/widget/2fa_widget.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import '../../Classes/account.dart';
import '../../Classes/localization/translation.dart';


class SettingYubikeyPage extends StatefulWidget {
  const SettingYubikeyPage({Key? key}) : super(key: key);

  @override
  State<SettingYubikeyPage> createState() => _SettingYubikeyPage();
}

class _SettingYubikeyPage extends State<SettingYubikeyPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height; // * MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              child: 

               Flexible(
               child: Padding(
                 padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                 child: ScrollConfiguration(
                   behavior: ScrollConfiguration.of(context)
                       .copyWith(scrollbars: false),
                   child: Consumer<Account>(builder: (context, account, child) {
                   return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: account.vault.lenght(),
                          itemBuilder: (context, index) {
                            return twoFaWidget(
                                password: account.vault.access(index));

                         });
                  }),
                ),
              ),
             ),
            ),

            Container(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    width: w * 0.2,
                    height: h * 0.05,
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
              ),
            )
          ]
        )
        )
        )
        );
  }
}
