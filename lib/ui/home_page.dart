import 'package:flutter/material.dart';
import 'package:test/ui/widget/password_widget.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //------------------
            // TITLE BAR + ICONS
            //------------------
            Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  const Text('Home',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 45)),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        InkWell(
                          onTap: null,
                          child: Icon(
                            Icons.sort,
                            size: 34,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: null,
                          child: Icon(Icons.add, size: 34),
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.deepPurple[300],
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Center(
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
            //------------------
            // PASSWORD LISTVIEW
            //------------------
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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
