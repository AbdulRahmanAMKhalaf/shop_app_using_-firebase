import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

part 'boarding_event.dart';

part 'boarding_state.dart';

class BoardingBloc extends Bloc<BoardingEvent, BoardingState> {
  BoardingBloc() : super(BoardingInitial()) {
    on<NextBoardingPageEvent>(
        (event, emit) => _onNextBoardingEvent(event, emit));
    on<PreviousBoardingPageEvent>(
        (event, emit) => _onPreviousBoardingEvent(event, emit));
  }

  int pageNum = 0;
  PageController controller = PageController(viewportFraction: 1.1);

  FutureOr<void> _onNextBoardingEvent(
      NextBoardingPageEvent event, Emitter<BoardingState> emit) {
    emit(ChangeBoardingButtonLoading());
    pageNum++;
    controller.nextPage(duration: 1000.ms, curve: Curves.easeInOut);
    emit(ChangeBoardingButtonSuccessfully());
  }

  FutureOr<void> _onPreviousBoardingEvent(
      PreviousBoardingPageEvent event, Emitter<BoardingState> emit) {
    emit(ChangeBoardingButtonLoading());
    pageNum--;
    controller.previousPage(duration: 1000.ms, curve:Curves.easeInOut);
    emit(ChangeBoardingButtonSuccessfully());
  }
}
