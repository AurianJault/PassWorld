import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:test/Classes/authentification.dart';
import 'package:test/ui/connection_page.dart';
import 'package:test/ui/edit_password_page.dart';
import 'package:test/ui/home_page.dart';
import 'package:test/ui/login_page.dart';

import '../Classes/password.dart';

class Startup extends StatefulWidget {
  const Startup({Key? key}) : super(key: key);
  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  void checkAlreadySignedIn() async {
    if (await Authentification.checkAlreadySignedIn()) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ConnectionPage()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    checkAlreadySignedIn();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading...'),
      ),
    );
  }
}
