part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ShowPasswordSuccessfully extends AuthState {}

final class ShowPasswordFail extends AuthState {}

final class ShowPasswordLoading extends AuthState {}

final class CheckTermsSuccessfully extends AuthState {}

final class CheckTermsLoading extends AuthState {}
