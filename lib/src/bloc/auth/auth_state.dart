part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ShowPasswordSuccessfully extends AuthState {}

final class ShowPasswordFail extends AuthState {}

final class ShowPasswordLoading extends AuthState {}

final class CheckTermsSuccessfully extends AuthState {}

final class CheckTermsLoading extends AuthState {}

final class RegisterSuccessfully extends AuthState {}

final class RegisterFail extends AuthState {
  final String message;

  RegisterFail({required this.message});
}

final class RegisterLoading extends AuthState {}

final class LoginSuccessfully extends AuthState {}

final class LoginFail extends AuthState {
  final String message;

  LoginFail({required this.message});
}

final class LoginLoading extends AuthState {}

final class SaveDataSuccessfully extends AuthState {}

final class SaveDataFail extends AuthState {
  final String message;

  SaveDataFail({required this.message});
}

final class SaveDataLoading extends AuthState {}

final class LogOutSuccessfully extends AuthState {}

final class LogOutFail extends AuthState {
  final String message;

  LogOutFail({required this.message});
}

final class LogOutLoading extends AuthState {}

final class EmailVerificationLoading extends AuthState {}

final class EmailVerificationSuccessfully extends AuthState {}

final class EmailVerificationFail extends AuthState {
  final String message;

  EmailVerificationFail({required this.message});
}
