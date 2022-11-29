import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/ui/login_page.dart';
import 'Classes/config.dart';

import 'Classes/account.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (_) => Account.manager(), child: const MyApp()),
    ChangeNotifierProvider(create: (_) => Config()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
