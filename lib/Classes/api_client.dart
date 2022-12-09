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

  static Future<StreamedResponse> uploadFile(
      String mail, String password, File password_file) async {
    print(password_file.length());
    Stream<List<int>> streamFile = password_file.openRead();
    Uri url = Uri.parse("$base/user/password-file");
    String bodyy = """
    {
      "email" : "$mail",
      "password" : "$password"
    }
    """;
    //var response = http.put(url, body: streamFile);
    var request = http.MultipartRequest("PUT", url);
    var passwordPart = http.MultipartFile("file", streamFile, 9951);
    request.files.add(passwordPart);
    var response = await request.send();
    return response;
  }
}
