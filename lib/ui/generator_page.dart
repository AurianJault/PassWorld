import 'package:flutter/material.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import '../Classes/generator.dart';
import 'PopUp/popupError.dart';

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({Key? key}) : super(key: key);

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(25),
            child: const PageTitleW(title: 'Generator')),
      ),
    );
    /// A mettre quand on utilise le generator
    // ignore: dead_code
      try{
        Generator().generator(2,[1], "a");
      }on UnsupportedError catch (e){
        showAlertDialog(context, e.message??"");
      }
  }
}
