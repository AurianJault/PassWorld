import 'package:flutter/material.dart';

// Widget for title in principal pages

class PageTitleW extends StatelessWidget {
  final String title;

  const PageTitleW({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // Media Query
    var w = MediaQuery.of(context).size.width;
    // Widget
    return Text(title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * 0.015));
  }
}
