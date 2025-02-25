part of 'localization_bloc.dart';

sealed class LocalizationState {}

final class LocalizationInitial extends LocalizationState {}
final class ChangeLanguageSuccessfully extends LocalizationState{}
final class ChangeLanguageFail extends LocalizationState{}
final class ChangeLanguageLoading extends LocalizationState{}