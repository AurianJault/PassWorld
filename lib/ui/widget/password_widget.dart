import 'package:flutter/material.dart';

class PasswordWidget extends StatelessWidget {
  // Variable for data binding
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Colors.grey[400], borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset(
                'assets/$image',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        website,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      Text(
                        email,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.copy,
                size: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
