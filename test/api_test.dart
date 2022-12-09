import 'dart:io';

import 'package:test/Classes/api_client.dart';

void test_api_auth() async {
  var req1 = await ClientAPI.authenticator("remrem@gmail.com", "password123");
  print(req1.statusCode);
  print(req1.body);
}

Future<int> test_api_file_upload() async {
  print("TEST: API FILE UPLOAD BEGIN");
  File file = File("/home/hel/Projets/PassWorld/assets/bereal.png");
  print("Phone: uploading file");
  var req1 =
      await ClientAPI.uploadFile("remrem@gmail.com", "password123", file);
  print("Phone: file uploaded");
  //print(req1.statusCode);
  //print(req1.stream);
  print("TEST: API FILE UPLOAD END");
  return 6;
}

void main() async {
  // var res = await ClientAPI.root();
  // print(res.body);
  var haha = await test_api_file_upload();
  // autentication test
}
