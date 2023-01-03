import 'package:flutter/material.dart';
import 'package:test/Classes/password.dart';
import 'package:flutter/services.dart';

class DoctorPasswordWidget extends StatelessWidget {

  Password password;
  
  Color color;

  DoctorPasswordWidget({super.key, required this.password,required this.color});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var w = size.width;
    var h = size.height;
    // Widget
    return Container(
      height: h * 1,
      width: w * 0.70,
        decoration: BoxDecoration(
            color: color,
        ),
          child: Row(
            children: [
              Image.asset(
                'assets/${password.getWebsiteImage}.png',
              ),
              Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        password.getName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        password.getEmail!,
                        style: const TextStyle(
                      )
                      )
                    ],
                  ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  await Clipboard.setData(
                      ClipboardData(text: password.getPassword));
                },
                child: const Icon(
                  Icons.copy,
                ),
              )
            ],
          ),
          );
  }
}