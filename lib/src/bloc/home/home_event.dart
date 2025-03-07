part of 'home_bloc.dart';

sealed class HomeEvent {}

final class GetDataEvent extends HomeEvent {
  final String uid;

  GetDataEvent({required this.uid});
}
