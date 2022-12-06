import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test/Classes/Exception/storageException.dart';
import 'package:test/Classes/config.dart';
import 'package:test/ui/widget/character_input.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import '../Classes/generator.dart';
import 'PopUp/popupError.dart';

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({Key? key}) : super(key: key);

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  TextEditingController noneCarac = TextEditingController();
  bool pressAttention = true;
  bool obcure = true;
  double length = 8;
  String output = "";
  String obcures = "*";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height; // * MediaQuery.of(context).devicePixelRatio;

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
          SizedBox(
            height: h * 0.05,
          ),
          //-------------------
          // OUTPUT
          //-------------------
          Container(
              padding: EdgeInsets.all(w * 0.02),
              child: Row(children: [
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(w * 0.02),
                        color: Colors.grey[300],
                        child: Row(children: [
                          Text(
                            obcure ? (obcures * (output.length)) : "$output",
                            style: TextStyle(
                              fontSize: w * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                              onTap: (() {
                                setState(() {
                                  obcure = !obcure;
                                });
                              }),
                              child: Icon(
                                const IconData(0xe51c,
                                    fontFamily: 'MaterialIcons'),
                                size: w * 0.06,
                              ))
                        ]))),
                SizedBox(
                  width: w * 0.01,
                ),
                Container(
                  padding: EdgeInsets.all(h * 0.01),
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
          SizedBox(
            height: h * 0.05,
          ),
          //------------
          // SLIDER BAR
          //------------
          Container(
              padding: EdgeInsets.all(w * 0.02),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Length",
                      style: TextStyle(
                          fontSize: w * 0.05, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              trackHeight: w * 0.057,
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: w * 0.03,
                              ),
                              overlappingShapeStrokeColor: Colors.transparent),
                          child: Container(
                            width: w * 0.8,
                            child: Slider(
                              value: length,
                              onChanged: ((double newLength) {
                                setState(() {
                                  length = newLength;
                                });
                              }),
                              onChangeEnd: ((double newLength) {
                                setState(() {
                                  length = newLength;
                                  try {
                                    output = Generator().generator(
                                            length.toInt(),
                                            context.read<Config>().charac,
                                            noneCarac.text) ??
                                        "";
                                  } on UnsupportedError catch (e) {
                                    showAlertDialog(context, e.message ?? "");
                                  } on StorageException catch (e) {
                                    showAlertDialog(context, e.message);
                                  }
                                  obcure = true;
                                });
                              }),
                              min: 8,
                              max: 50,
                              activeColor: Colors.deepPurple[300],
                              thumbColor: Colors.deepPurple[300],
                              inactiveColor: Colors.grey[300],
                            ),
                          )),
                      Container(
                          margin: EdgeInsets.all(w * 0.02),
                          child: Text(length.round().toString(),
                              style: TextStyle(fontSize: w * 0.08)))
                    ],
                  )
                ],
              )),

          //-------------------
          // CHARACTERS'TITLE
          //-------------------
          Container(
              padding: EdgeInsets.all(w * 0.02),
              child: Row(children: [
                Text(
                  "Characters",
                  style: TextStyle(
                      fontSize: w * 0.05, fontWeight: FontWeight.bold),
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
                      fontSize: w * 0.05, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: w * 0.04),
                  controller: noneCarac,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type Charaters you don\'t want',
                  ),
                  onChanged: (value) {
                    setState(() {
                      try {
                        output = Generator().generator(
                                length.toInt(),
                                context.read<Config>().charac,
                                noneCarac.text) ??
                            "";
                      } on UnsupportedError catch (e) {
                        showAlertDialog(context, e.message ?? "");
                      } on StorageException catch (e) {
                        showAlertDialog(context, e.message);
                      }
                      obcure = true;
                    });
                  },
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
                setState(() {
                  try {
                    output = Generator().generator(length.toInt(),
                            context.read<Config>().charac, noneCarac.text) ??
                        "";
                  } on UnsupportedError catch (e) {
                    showAlertDialog(context, e.message ?? "");
                  }
                });
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
  }
}
