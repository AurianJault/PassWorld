import 'package:flutter/material.dart';
import 'package:test/Classes/account.dart';
import 'package:test/Classes/password.dart';
import 'package:flutter/services.dart';
import 'package:test/Classes/yubikey_related/two_fa.dart';
import 'package:test/Classes/yubikey_related/yubikey.dart';

import '../password_detail_page.dart';

// Widget for password objects in home page listview

class twoFaWidget extends StatelessWidget {
  // Variable for data binding -- will change when list of password

  TwoFA factor;

  twoFaWidget({super.key, required this.factor});

  @override
  Widget build(BuildContext context) {
    // Media Query
    var size = MediaQuery.of(context).size;
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height; // * MediaQuery.of(context).devicePixelRatio;

    // Logo
    String logo = "";
    if(factor is Yubikey){
      logo = "assets/yubico.png";
    } // else if factor biometrie / facial

    // Widget
    return Padding(
      padding: EdgeInsets.only(bottom: h * 0.015),
      child: InkWell(
      child: Container(
        height: h * 0.07,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(w * 0.02)),
        child: Padding(
          padding: EdgeInsets.all(w * 0.015),
          child: Row(
            children: [
              Image.asset(
                logo,
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.02),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: w * 0.005),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        factor.nom,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: w * 0.035,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                child: Icon(
                  Icons.copy,
                  size: w * 0.08,
                ),
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}
