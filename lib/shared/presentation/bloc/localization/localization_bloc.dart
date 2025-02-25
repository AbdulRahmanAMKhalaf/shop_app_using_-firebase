import 'dart:async';

import 'package:bloc/bloc.dart';

part 'localization_event.dart';

part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocalizationInitial()) {
    on<ChangeLanguageEvent>(
      (event, emit) => _onChangeLanguage(event, emit),
    );
  }

  String lang = 'en';

  FutureOr<void> _onChangeLanguage(
      ChangeLanguageEvent event, Emitter<LocalizationState> emit) {
    emit(ChangeLanguageLoading());
    if (lang == 'en') {
      lang = 'ar';
    } else {
      lang = 'en';
    }
    emit(ChangeLanguageSuccessfully());
  }
}
