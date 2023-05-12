import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<Language> {
  LanguageCubit() : super(Language(lang: Platform.localeName.split('_')[0]));

  void changeLang(String lang) {
    emit(Language(lang: lang));
  }

}
