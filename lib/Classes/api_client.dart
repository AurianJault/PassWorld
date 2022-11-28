import 'dart:html';
import 'package:http/http.dart' as http;

class ClientAPI {
  // Base URL of API
  String base =
      'https://codefirst.iut.uca.fr/containers/passworld-api-remiarnal';
  // GET

  // Athenticate user when signing in
  Future<bool> authenticator() async {
    Uri url = "$base/auth" as Uri;
    var mail = ""; // TODO
    var password = ""; // TODO
    String body = """
    {
      "mail" : "$mail",
      "password" : "$password" 
    }""";
    var response = await http.post(url, body: body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return true;
  }
}
