import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  print(BiometricType.fingerprint);
}
