part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GeTDataSuccessfully extends HomeState {}

final class GeTDataFail extends HomeState {}

final class GeTDataLoading extends HomeState {}