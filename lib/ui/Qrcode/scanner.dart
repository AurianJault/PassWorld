import 'package:flutter/material.dart';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import '../../Classes/storage.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _Scanner();
}

class _Scanner extends State<Scanner> {
  String barcode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Scan Barcode'),
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AiBarcodeScanner(
                      //    validateText: 'https://', // link to be validated
                      //   validateType: ValidateType.startsWith,
                      onScan: (String value) {
                        debugPrint(value);
                        setState(() {
                          barcode = value;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            Storage.storing(
                encrypt.Key.fromBase64(barcode.substring(0, 43)),
                encrypt.IV.fromBase64(barcode.substring(44)),
                "id"), //Voir pour mettre l'id
          ],
        ),
      ),
    );
  }
}

/// Add this to use the qrcode
///
/// if (Platform.isLinux || Platform.isWindows) {
///     showAlertDialog(context,
///     "Cette fonctionnalité n'est pas disponible sur votre appareil !!");
/// } else {
///   Navigator.push(
///     context,
///     MaterialPageRoute<dynamic>(
///     builder: (context) => const
/// }
