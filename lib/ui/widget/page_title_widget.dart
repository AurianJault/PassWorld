import 'package:flutter/material.dart';

class PageTitleW extends StatelessWidget {
  final String title;

  const PageTitleW({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Text(title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * 0.09));
  }
}
