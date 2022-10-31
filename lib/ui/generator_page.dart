import 'package:flutter/material.dart';

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
          child: const Text('Generator',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45)),
        ),
      ),
    );
  }
}
