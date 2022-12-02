import 'package:flutter/material.dart';

// Widget for all inputs of addPasswordPage
class CharactereInputWidget extends StatefulWidget {
  // Variables
  final String character;

  const CharactereInputWidget({super.key, required this.character});

  @override
  State<CharactereInputWidget> createState() => _CharactereInputWidgetState();
}

class _CharactereInputWidgetState extends State<CharactereInputWidget> {
  bool pressAttention = true;

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
            onPressed: () => {
                  setState(() {
                    pressAttention = !pressAttention;
                  })
                },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  pressAttention ? Colors.white : Colors.deepPurple[300]),
            ),
            child: Text(
              widget.character,
              style: TextStyle(
                color: pressAttention ? Colors.black : Colors.white,
                fontSize: h * 0.04,
              ),
            )));
  }
}
