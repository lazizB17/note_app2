import 'package:note_app/services/locals/uz_UZ.dart';
import 'package:note_app/services/locals/en_EN.dart';
import 'package:note_app/services/locals/ru_RU.dart';

enum Language {en, ru, uz}

class LangService{
  // Field
  static Language _language = Language.en;

  // Setter
  static set language(Language language){
    _language = language;
  }
  // Getter
  static Language get language => _language;

  String tr(String key){
    switch(language){
      case Language.en: return enUS[key] ?? key;
      case Language.ru: return ruRU[key] ?? key;
      case Language.uz: return uzUZ[key] ?? key;
    }
  }

}