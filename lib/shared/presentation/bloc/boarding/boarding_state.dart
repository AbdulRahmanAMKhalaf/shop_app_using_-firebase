part of 'boarding_bloc.dart';

@immutable
sealed class BoardingState {}

final class BoardingInitial extends BoardingState {}

final class ChangeBoardingButtonSuccessfully extends BoardingState{}
final class ChangeBoardingButtonFail extends BoardingState{}
final class ChangeBoardingButtonLoading extends BoardingState{}

