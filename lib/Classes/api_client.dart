import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ClientAPI {
  // Base URL of API
  static String base =
      'https://codefirst.iut.uca.fr/containers/passworld-api-remiarnal';
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
}
