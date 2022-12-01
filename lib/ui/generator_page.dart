import 'package:flutter/material.dart';
import 'package:io/ansi.dart';
import 'package:test/ui/widget/add_password_input.dart';
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
              child: Row(children: [const PageTitleW(title: "Generator")])),
          Container(
            padding: EdgeInsets.all(w * 0.02),
            child: Row(children: [
              SizedBox(
                  height: h * 0.1,
                  width: w * 0.1,
                  child: ElevatedButton(
                      onPressed: () => {
                            setState(() {
                              pressAttention = !pressAttention;
                            })
                          },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            pressAttention
                                ? Colors.white
                                : Colors.deepPurple[300]),
                      ),
                      child: Text(
                        "a-z",
                        style: TextStyle(
                            color: pressAttention ? Colors.black : Colors.white,
                            fontSize: h * 0.04),
                      )))
            ]),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Container(
              padding: EdgeInsets.all(w * 0.02),
              child: Row(children: [
                Text(
                  "Do not include",
                  style: TextStyle(
                      fontSize: h * 0.06, fontWeight: FontWeight.bold),
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
              onTap: null,
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
        ],
      ))),
    );

    /// A mettre quand on utilise le generator
    // ignore: dead_code
    try {
      Generator().generator(2, [1], "a");
    } on UnsupportedError catch (e) {
      showAlertDialog(context, e.message ?? "");
    }
  }
}
