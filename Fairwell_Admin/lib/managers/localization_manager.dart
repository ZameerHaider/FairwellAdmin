import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocalizationManager {
  final Locale locale;
  LocalizationManager({this.locale});

  static LocalizationManager of(BuildContext context) {
    return Localizations.of<LocalizationManager>(context, LocalizationManager);
  }

  Map<String, String> _localizedValues;

  Future load() async {
    String jsonStringValue = await rootBundle
        .loadString('lib/languages/${locale.languageCode}.json');

    Map<String, dynamic> mappedJson = json.decode(jsonStringValue);

    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String localize({@required String key}) {
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<LocalizationManager> delegate =
      _LocalizationManagerDelegate();
}

class _LocalizationManagerDelegate
    extends LocalizationsDelegate<LocalizationManager> {
  const _LocalizationManagerDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['de'].contains(locale.languageCode);
  }

  @override
  Future<LocalizationManager> load(Locale locale) async {
    LocalizationManager localizationManager =
        LocalizationManager(locale: locale);
    await localizationManager.load();
    return localizationManager;
  }

  @override
  bool shouldReload(_LocalizationManagerDelegate old) => false;
}
