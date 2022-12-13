import 'package:flutter/material.dart';
import 'package:test/ui/widget/page_title_widget.dart';
import '../Classes/localization/translation.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: PageTitleW(
              title: LanguageTranslation.of(context)!.text('heal_title')),
        ),
      ),
    );
  }
}
