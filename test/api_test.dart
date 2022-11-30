import 'package:test/Classes/api_client.dart';

void main() async {
  // autentication test
  var req1 = await ClientAPI.authenticator("remrem@gmail.com", "password123");
  print(req1.statusCode);
  print(req1.body);
}
