import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  // Variable for data binding -- will change when list of password
  final String website;
  final String image;
  final String email;

  const PasswordWidget(
      {super.key,
      required this.website,
      required this.image,
      required this.email});

  @override
  Widget build(BuildContext context) {
    // Media Queries
    var size = MediaQuery.of(context).size;
    double w = size.width; //* MediaQuery.of(context).devicePixelRatio;
    double h = size.height; // * MediaQuery.of(context).devicePixelRatio;

    return Padding(
      padding: EdgeInsets.only(bottom: h * 0.015),
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
                'assets/$image',
              ),
              Padding(
                padding: EdgeInsets.only(left: w * 0.02),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: w * 0.005),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        website,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: w * 0.035,
                        ),
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          fontSize: w * 0.03,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Icon(
                Icons.copy,
                size: w * 0.08,
              )
            ],
          ),
        ),
      ),
    );
  }
}
