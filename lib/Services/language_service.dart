enum Language{en, uz, ru}


class LanguageService{

  static Language _language = Language.en;

  static Language get getLanguage => _language;

  static set setLanguage(Language language){
    _language = language;
  }

  static void switchLanguage(String lang){
    switch(lang){
      case "1":{LanguageService.setLanguage = Language.uz;} break;
      case "2":{LanguageService.setLanguage = Language.ru;} break;
      case "3":{LanguageService.setLanguage = Language.en;} break;
    }

  }




}