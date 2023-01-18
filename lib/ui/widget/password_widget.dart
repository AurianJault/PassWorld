import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test/Classes/password.dart';
import 'package:flutter/services.dart';

import '../password_detail_page.dart';

// Widget for password objects in home page listview

class PasswordWidget extends StatelessWidget {
  // Variable for data binding -- will change when list of password

  Password password;

  PasswordWidget({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    // Media Query
    var size = MediaQuery.of(context).size;
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height; // * MediaQuery.of(context).devicePixelRatio;

    // Widget
    return Padding(
      padding: EdgeInsets.only(bottom: h * 0.015),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (context) => PasswordDetailPage(p: password),
            ),
          );
        },
        child: Container(
          height: h * 0.07,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(w * 0.02)),
          child: Padding(
            padding: EdgeInsets.all(w * 0.015),
            child: Row(
              children: [
                kReleaseMode
                    ? Image.asset('assets/youtube.png')
                    : Image.asset('assets/${password.getWebsiteImage}.png'),
                Padding(
                  padding: EdgeInsets.only(left: w * 0.02),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: w * 0.005),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          password.getName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: w * 0.035,
                          ),
                        ),
                        Text(
                          password.getEmail!,
                          style: TextStyle(
                            fontSize: w * 0.03,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    await Clipboard.setData(
                        ClipboardData(text: password.getPassword));
                  },
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
