import 'dart:async';

import 'package:bloc/bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<ShowPasswordEvent>(
      (event, emit) => _onShowPassword(event, emit),
    );
    on<CheckTermsEvent>(
      (event, emit) => _onCheckTerms(event, emit),
    );
  }

  bool showPassword = true;
  bool checkTerms = false;

  FutureOr<void> _onShowPassword(
      ShowPasswordEvent event, Emitter<AuthState> emit) {
    emit(ShowPasswordLoading());
    showPassword = !showPassword;
    emit(ShowPasswordSuccessfully());
  }

  FutureOr<void> _onCheckTerms(CheckTermsEvent event, Emitter<AuthState> emit) {
    emit(CheckTermsLoading());
    checkTerms = !checkTerms;
    emit(CheckTermsSuccessfully());
  }
}
