import 'dart:io';
import 'package:test/Classes/api_client.dart';

Future<void> testAuth() async {
  print("Testing Authentication...");
  var req = await ClientAPI.authenticator("remrem@gmail.com", "password123");
  print(req.statusCode);
  print(req.body);
}

Future<void> testSalt() async {
  print("Testing getSalt...");
  var req = await ClientAPI.getSalt("aurian@23.com");
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

Future<void> testFileUpload() async {
  print("Testing File Upload...");
  File file = await File("/home/hel/1_001.png");
  var req = await ClientAPI.uploadFile("remrem@gmail.com", "remremHash", file);
  print(req.statusCode);
}

Future<void> testFileDownload() async {
  print("Testing File Download...");
  var req = await ClientAPI.downloadFile("test@gmail.com", "testtesthash");
  print(req.statusCode);
  print(req.body);
  if (req.statusCode != 200) {
    return;
  }
  var res = req.body;
  var fileAsString = req.body.substring(1, res.length - 1);
  List<int> file =
      req.body.substring(1, res.length - 1).split(",").map(int.parse).toList();

  File f = File("./passFile");
  f.writeAsBytes(file);
}

void main() async {
  //await testAccountCreation();
  //await testSalt();
  //await testAccountDeletion();
  //await testMailUpdate();
  //await testPasswordUpdate();
  await testFileUpload();
  //await testFileDownload();
  return;
}
