part of 'boarding_bloc.dart';

@immutable
sealed class BoardingEvent {}
final class NextBoardingPageEvent extends BoardingEvent{}
final class PreviousBoardingPageEvent extends BoardingEvent{}