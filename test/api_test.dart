import 'dart:io';
import 'package:test/Classes/api_client.dart';

Future<void> testAuth() async {
  print("Testing Authentication...");
  var req = await ClientAPI.authenticator("remrem@gmail.com", "password123");
  print(req.statusCode);
  print(req.body);
}

Future<void> testAccountCreation() async {
  print("Testing Account Creation...");
  var req =
      await ClientAPI.register("remrem@gmail.com", "remremHash", "remremSalt");
  print(req.statusCode);
  print(req.body);
}

Future<void> testAccountDeletion() async {
  print("Testing Account Deletion...");
  var req = await ClientAPI.deleteAccount('remrem@gmail.com', "remremHash");
  print(req.statusCode);
  print(req.body);
}

Future<void> testMailUpdate() async {
  print("Testing Mail Update...");
  var req = await ClientAPI.updateMail("mail3", "mail@+${DateTime.now()}+.com");
  print(req.statusCode);
  print(req.body);
}

Future<void> testPasswordUpdate() async {
  print("Testing Password Update...");
  var req = await ClientAPI.updatePassword("remrem", "newHash", "newSalt");
  print(req.statusCode);
  print(req.body);
}

Future<Null> testFileUpload() async {
  print("Testing File Upload...");
  File file = await File("/home/hel/Medias/Pictures/Wallpapers/vaporwave.png");
  var req = await ClientAPI.uploadFile("remrem@gmail.com", "password123", file);
  print(req.statusCode);
  return null;
}

void main() async {
  await testAccountCreation();
  //await testAccountDeletion();
  //await testMailUpdate();
  //await testPasswordUpdate();
  return;
}
