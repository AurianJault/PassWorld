import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class LanguageTranslation {
  late Locale locale;
  static Map<dynamic, dynamic> _localizedValues = {};

  LanguageTranslation(this.locale) {
    _localizedValues = {};
  }

  static LanguageTranslation? of(BuildContext context) {
    return Localizations.of<LanguageTranslation>(context, LanguageTranslation);
  }

  String text(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static Future<LanguageTranslation> load(Locale locale) async {
    LanguageTranslation translations = LanguageTranslation(locale);
    String jsonContent =
        await rootBundle.loadString("locales/i18n_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;
}
