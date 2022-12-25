import 'dart:io';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:local_auth_platform_interface/types/auth_messages.dart';

import '../Exception/storageException.dart';

class Biometric {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authentification() {
    try {
      return auth.authenticate(
          localizedReason: 'Please authenticate to show account balance',
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
              signInTitle:
                  'Veuillez utiliser votre doigt pour vous connecter à votre compte',
            ),
            IOSAuthMessages(
                lockOut:
                    "Veuillez ré-activer la biométrie pour améliorer votre sécurité"),
          ],
          options: const AuthenticationOptions(
              stickyAuth: true, sensitiveTransaction: true));
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        throw StorageException("Veuillez ajouter une empreinte");
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        throw StorageException("Trop de tentative");
      }
    }
    throw StorageException("erreur lors de l'authentifiaction");
  }

  Future<bool> canBiometric() async {
    if (Platform.isLinux) {
      return false;
    }
    return await auth.canCheckBiometrics;
  }

  Future<bool> deviceSupport() async {
    if (!(await canBiometric())) {
      return false;
    }
    return await auth.isDeviceSupported();
  }

  Future<List<BiometricType>> available() async {
    return await auth.getAvailableBiometrics();
  }
}
