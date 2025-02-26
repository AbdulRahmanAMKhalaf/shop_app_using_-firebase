part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class ShowPasswordEvent extends AuthEvent {}
final class CheckTermsEvent extends AuthEvent{}