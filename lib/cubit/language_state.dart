part of 'language_cubit.dart';

// ignore: must_be_immutable
class Language extends Equatable {
  String lang;

  final Map<String, dynamic> languagesMap = {
    'kk': 'Қазақ',
    'ru': 'Русский',
    'en': 'English'
  };

  get currentLanguage => languagesMap[lang];

  final List<String> languagesList = ['Қазақ', 'Русский', 'English'];
  final List<String> languageCodeList = ['kk', 'ru', 'en'];

  Language({required this.lang});

  @override
  List<Object?> get props => [lang];
}
