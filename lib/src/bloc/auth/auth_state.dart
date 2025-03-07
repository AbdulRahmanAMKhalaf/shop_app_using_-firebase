part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ShowPasswordSuccessfully extends AuthState {}

final class ShowPasswordFail extends AuthState {}

final class ShowPasswordLoading extends AuthState {}

final class CheckTermsSuccessfully extends AuthState {}

final class CheckTermsLoading extends AuthState {}

final class RegisterSuccessfully extends AuthState {}

final class RegisterFail extends AuthState {}

final class RegisterLoading extends AuthState {}

final class LoginSuccessfully extends AuthState {}

final class LoginFail extends AuthState {}

final class LoginLoading extends AuthState {}

final class SaveDataSuccessfully extends AuthState {}

final class SaveDataFail extends AuthState {}

final class SaveDataLoading extends AuthState {}

final class LogOutSuccessfully extends AuthState {}

final class LogOutFail extends AuthState {}

final class LogOutLoading extends AuthState {}
