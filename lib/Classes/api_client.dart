import 'dart:html';

import 'package:http/http.dart' as http;

class ClientAPI {
  // Base URL of API
  String base = '';
  // GET

  // Athenticate user when signing in
  Future<bool> authenticator() async {
    Uri url = "$base/auth" as Uri;
    var response = await http.get(url);

    /*
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print(await http.read('https://example.com/foobar.txt'));
    */

    return true;
  }
}
