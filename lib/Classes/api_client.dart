import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ClientAPI {
  // Base URL of API
  // static String base =
  //     'https://codefirst.iut.uca.fr/containers/passworld-api-remiarnal';

  static String base = 'http://172.27.8.3:8989';

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

  static Future<StreamedRequest> uploadFile(
      String mail, String password, File password_file) async {
    print(password_file.length());
    Stream<List<int>> streamFile = password_file.openRead();
    Uri url = Uri.parse("$base/user/password-file");
    String body = """
    {
      "email" : "$mail",
      "password" : "$password"
    }
    """;
    var response = await http.StreamedRequest("put", url);
    return response;
  }
}
