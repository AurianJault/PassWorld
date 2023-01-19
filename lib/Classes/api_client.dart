import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:path/path.dart' as p;

class ClientAPI {
  // Base URL of API
  // static String base =
  //     'https://codefirst.iut.uca.fr/containers/PassWorld-passworld-api';

  // static String base = 'http://172.27.171.157:8989';

  static String base = 'http://139.162.176.19:8989';

  static Future<Response> root() async {
    Uri url = Uri.parse(base);
    var response = await http.get(url);
    return response;
  }
  // POST

  // Athenticate user when signing in
  static Future<Response> authenticator(String mail, String password) async {
    Uri url = Uri.parse("$base/auth");
    String body = """
    {
      "email" : "$mail",
      "password" : "$password"
    }
    """;
    var response = await http.post(url, body: body);
    return response;
  }

  static Future<Response> getSalt(String mail) async {
    Uri url = Uri.parse("$base/user/salt");
    String body = """
    {
      "email" : "$mail"
    }
    """;
    var response = await http.post(url, body: body);
    return response;
  }

  static Future<Response> register(
      String email, String password, String salt) async {
    Uri url = Uri.parse("$base/user/account");
    String body = """
    {
      "email" : "$email",
      "password" : "$password",
      "salt" : "$salt"
    }
    """;
    var response = await http.post(url, body: body);
    return response;
  }

  static Future<Response> deleteAccount(String email, String password) async {
    Uri url = Uri.parse("$base/user/account");
    String body = """
    {
      "email" : "$email",
      "password" : "$password"
    }
    """;
    var response = await http.delete(url, body: body);
    return response;
  }

  static Future<Response> updateMail(String email, String newMail) async {
    Uri url = Uri.parse("$base/user/change-mail");
    String body = """
    {
      "email" : "$email",
      "newMail" : "$newMail"
    }
    """;
    var response = await http.put(url, body: body);
    return response;
  }

  static Future<Response> updatePassword(
      String email, String newPassword, String newSalt) async {
    Uri url = Uri.parse("$base/user/password");
    String body = """
    {
      "email" : "$email",
      "newPassword" : "$newPassword",
      "newSalt" : "$newSalt"
    }
    """;
    var response = await http.put(url, body: body);
    return response;
  }

  static Future<Response> uploadFile(
      String mail, String password, File passwordFile) async {
    List<int> fileBytes = await passwordFile.readAsBytes();
    String bytesList = "";
    for (int i in fileBytes) {
      bytesList += i.toString();
      bytesList += ",";
    }
    Uri url = Uri.parse("$base/user/password-file");
    String body = """
    {
      "email" : "$mail",
      "password" : "$password",
      "file" : "$bytesList"
    }
    """;
    var response = await http.post(url, body: body);
    if (response.statusCode == 201) print("File Uploaded");
    return response;
  }

  static Future<Response> downloadFile(String mail, String password) async {
    Uri url = Uri.parse("$base/user/password-file-download");
    String body = """
    {
      "email" : "$mail",
      "password" : "$password"
    }
    """;
    var response = await http.post(url, body: body);
    if (response.statusCode == 200) print("Downloaded");
    return response;
  }

  static void handleDownload(Response res, String path, String mail) {
    var data = res.body;
    var fileAsString = res.body.substring(1, data.length - 1);
    List<int> file = res.body
        .substring(1, data.length - 1)
        .split(",")
        .map(int.parse)
        .toList();

    File f = File(p.join(path, "${mail}.sqlite"));
    f.writeAsBytesSync(file);
  }
}
