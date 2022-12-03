import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/config.dart';
import 'package:test/ui/widget/character_input.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import '../Classes/generator.dart';
import 'PopUp/popupError.dart';
import '../Classes/config.dart';

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({Key? key}) : super(key: key);

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  TextEditingController noneCarac = TextEditingController();
  bool pressAttention = true;
  double length = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height; // * MediaQuery.of(context).devicePixelRatio;
    String? output = "";

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          //----------
          // PAGE TITLE
          //-----------
          Container(
              padding: EdgeInsets.all(w * 0.04),
              child: Row(children: const [PageTitleW(title: "Generator")])),
          //-------------------
          // OUTPUT
          //-------------------
          Container(
              padding: EdgeInsets.all(w * 0.05),
              margin: EdgeInsets.all(w * 0.01),
              child: Row(mainAxisSize: MainAxisSize.max, children: [
                Container(
                    color: const Color.fromARGB(255, 204, 204, 204),
                    child: Text(
                      "$output",
                      style: TextStyle(
                        fontSize: h * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const Spacer(),
                Container(
                  color: Colors.deepPurple[300],
                  child: InkWell(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: output));
                    },
                    child: Icon(
                      Icons.copy,
                      size: w * 0.08,
                    ),
                  ),
                )
              ])),
          //-------------------
          // SLIDER'S TITLE
          //-------------------
          Container(
              padding: EdgeInsets.all(w * 0.02),
              child: Row(children: [
                Text(
                  "Length",
                  style: TextStyle(
                      fontSize: h * 0.04, fontWeight: FontWeight.bold),
                ),
              ])),
          //------------
          // SLIDER BAR
          //------------
          Container(
              padding: EdgeInsets.all(w * 0.02),
              child: Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: length,
                      onChanged: ((double newLength) {
                        setState(() => length = newLength);
                      }),
                      min: 0,
                      max: 50,
                      activeColor: Colors.deepPurple[300],
                    ),
                  ),
                  Text(length.round().toString(),
                      style: const TextStyle(fontSize: 25))
                ],
              )),
          SizedBox(
            height: h * 0.02,
          ),
          //-------------------
          // CHARACTERS'TITLE
          //-------------------
          Container(
              padding: EdgeInsets.all(w * 0.02),
              child: Row(children: [
                Text(
                  "Characters",
                  style: TextStyle(
                      fontSize: h * 0.04, fontWeight: FontWeight.bold),
                ),
              ])),
          //---------------------
          // CHARACTERS' BUTTONS
          //----------------------
          Container(
            padding: EdgeInsets.all(w * 0.02),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CharactereInputWidget(character: "a-z", no: 0),
                  CharactereInputWidget(character: "A-Z", no: 1),
                  CharactereInputWidget(character: "0-9", no: 2),
                  CharactereInputWidget(character: "!@%", no: 3),
                  CharactereInputWidget(character: ",;`\"", no: 4),
                ]),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          //---------------
          // INPUT TITLE
          //---------------
          Container(
              padding: EdgeInsets.all(w * 0.02),
              child: Row(children: [
                Text(
                  "Do not include",
                  style: TextStyle(
                      fontSize: h * 0.04, fontWeight: FontWeight.bold),
                ),
              ])),
          //-----------
          // INPUT ZONE
          //-----------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(w * 0.07)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.03, vertical: h * 0.01),
                child: TextField(
                  style: TextStyle(fontSize: w * 0.02),
                  controller: noneCarac,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type Charaters you don\'t want',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: h * 0.10,
          ),
          //-----------
          // BUTTON
          //-----------
          Center(
            child: InkWell(
              onTap: (() {
                try {
                  output = Generator().generator(length.toInt(),
                      context.read<Config>().charac, noneCarac.text);
                } on UnsupportedError catch (e) {
                  showAlertDialog(context, e.message ?? "");
                }
              }),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepPurple[300],
                    borderRadius: BorderRadius.circular(w * 0.04)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.33, vertical: h * 0.01),
                  child: Text(
                    'Generate',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: w * 0.065),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: h * 0.02,
          )
        ],
      ))),
    );

    /// A mettre quand on utilise le generator
    // ignore: dead_code
  }
}
