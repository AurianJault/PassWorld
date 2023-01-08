import 'package:flutter/material.dart';

class AuthentificationSelector extends StatelessWidget {
  late String title;
  late IconData icon;

  AuthentificationSelector({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // Media Query
    var size = MediaQuery.of(context).size;
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height; // * MediaQuery.of(context

    return Container(
        margin: EdgeInsets.symmetric(horizontal: w * 0.005),
        padding: EdgeInsets.all(w * 0.01),
        decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            borderRadius: BorderRadius.circular(5)),
        child: InkWell(
          child: Column(children: [
            Icon(
              icon,
              size: w * 0.05,
              color: Colors.white,
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Text(title)
          ]),
        ));
  }
}
