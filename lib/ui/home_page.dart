import 'package:flutter/material.dart';
import 'package:test/ui/add_password_page.dart';
import 'package:test/ui/widget/password_widget.dart';
import 'package:test/ui/widget/page_title_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _email = [
    'aurain@lecaiman.crocs',
    'tim@leviking.thor',
    'nicolas@napasdebras.manchot',
    'aurian@lecaiman.crocs',
  ];

  final _image = ['github.png', 'youtube.png', 'instagram.png', 'bereal.png'];
  final _website = ['Github', 'Youtube', 'Instagram', 'BeReal'];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double w = size.width * MediaQuery.of(context).devicePixelRatio;
    double h = size.height * MediaQuery.of(context).devicePixelRatio;

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
                  const PageTitleW(title: 'Home'),
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
                                        const AddPasswordPage()));
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
                  child: const Center(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      controller: null,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white),
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
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _email.length,
                      itemBuilder: (context, index) {
                        return PasswordWidget(
                            website: _website[index],
                            image: _image[index],
                            email: _email[index]);
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
