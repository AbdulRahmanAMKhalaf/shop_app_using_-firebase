part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class ShowPasswordEvent extends AuthEvent {}

final class CheckTermsEvent extends AuthEvent {}

final class RegisterEvent extends AuthEvent {}

final class LoginEvent extends AuthEvent {}
final class GetDataEvent extends AuthEvent{}