import 'package:flutter/material.dart';
import 'package:test/Classes/account.dart';
import 'package:test/Classes/config.dart';
import 'package:test/Classes/localization/translation.dart';
import 'package:test/ui/add_password_page.dart';
import 'package:test/ui/widget/password_widget.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import 'package:provider/provider.dart';
import '../Classes/localization/translation.dart';
import '../Classes/localization/translation_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controller for search bar
  TextEditingController searchCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height; // * MediaQuery.of(context).devicePixelRatio;

    context.read<Config>().setAppDirPath();
    var config = context.read<Config>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //------------------
            // TITLE BAR + ICONS
            //------------------
            Container(
              padding: EdgeInsets.all(w * 0.04),
              child: Row(
                children: [
                  PageTitleW(
                      title:
                          LanguageTranslation.of(context)!.text('home_title')),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: null,
                          child: Icon(
                            Icons.sort,
                            size: w * 0.06,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                        builder: (context) =>
                                            const AddPasswordPage()))
                                .then((_) => setState(() {}));
                          },
                          child: Icon(Icons.add, size: w * 0.06),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //-----------
            // SEARCH BOX
            //-----------
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.04, vertical: h * 0.01),
              child: Container(
                height: h * 0.06,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[300],
                    borderRadius: BorderRadius.circular(w * 0.06)),
                child: Padding(
                  padding: EdgeInsets.only(left: w * 0.03),
                  child: Center(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      controller: searchCtrl,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        border: InputBorder.none,
                        hintText:
                            LanguageTranslation.of(context)!.text('search'),
                        hintStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            //------------------
            // PASSWORD LISTVIEW
            //------------------
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
                          return PasswordWidget(
                              password: account.vault.access(index));

                        });
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
