import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ClientAPI {
  // Base URL of API
  // static String base =
  //     'https://codefirst.iut.uca.fr/containers/PassWorld-passworld-api';

  static String base = 'http://172.27.171.157:8080';

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

  static Future<StreamedResponse> uploadFile(
      String mail, String password, File passwordFile) async {
    Stream<List<int>> streamFile = passwordFile.openRead();
    Uri url = Uri.parse("$base/user/password-file");
    String body = """
    {
      "email" : "$mail",
      "password" : "$password"
    }
    """;
    var request = http.MultipartRequest('POST', url);
    var requestFile = http.MultipartFile(body, streamFile, 4814386);
    request.files.add(requestFile);
    var response = await request.send();
    if (response.statusCode == 200) print("File Uploaded");
    return response;
  }
}
