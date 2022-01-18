// class LanguageModel {
//   String? imageUrl;
//   String? languageName;
//   String? languageCode;
//   String? countryCode;
//
//   LanguageModel({this.imageUrl, this.languageName, this.countryCode, this.languageCode});
// }


class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(2, "🇺🇸", "English", "en"),
      Language(3, "🇸🇦", "اَلْعَرَبِيَّةُ‎", "ar"),
    ];
  }
}