class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;
  bool isSelected;

  Language(this.id, this.flag, this.name, this.languageCode,
      {this.isSelected = false});

  static List<Language> getLanguageList() {
    return <Language>[
      Language(1, "", "English", "en"),
      Language(2, "", "Arabic", "ar"),
      Language(3, "", "Hindi", "hi"),
    ];
  }
}
