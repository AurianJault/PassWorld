import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Classes/config.dart';
import '../../Classes/generator.dart';

// Widget for all inputs of addPasswordPage
class CharactereInputWidget extends StatefulWidget {
  // Variables
  final String character;
  final int no;
  final Function function;

  const CharactereInputWidget(
      {super.key,
      required this.character,
      required this.no,
      required this.function});

  @override
  State<CharactereInputWidget> createState() => _CharactereInputWidgetState();
}

class _CharactereInputWidgetState extends State<CharactereInputWidget> {
  bool pressAttention = false;

  @override
  Widget build(BuildContext context) {
    // Media Query
    var size = MediaQuery.of(context).size;
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height;

    // Widget
    return SizedBox(
        height: h * 0.1,
        width: w * 0.1,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                pressAttention = !pressAttention;
                context.read<Config>().addCharacter(widget.no);
                widget.function();
              });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  pressAttention ? Colors.white : Colors.deepPurple[300]),
            ),
            child: Text(
              widget.character,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: pressAttention ? Colors.black : Colors.white,
                  fontSize: w * 0.03,
                  fontWeight: FontWeight.bold),
            )));
  }
}
