import '../Data/local_language/enEn.dart';
import '../Data/local_language/ruRu.dart';
import '../Data/local_language/uzUz.dart';
import 'language_service.dart';

extension LanguageExtension on String{
  String get tr {
    switch (LanguageService.getLanguage) {
      case Language.uz:
        return uz[this] ?? this;
      case Language.ru:
        return ru[this] ?? this;
      case Language.en:
        return en[this] ?? this;
    }
  }
}
