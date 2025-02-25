import 'package:flutter/material.dart';
import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/presentation/bloc/boarding/boarding_bloc.dart';
import 'package:shop_app/shared/presentation/boarding_screen/boarding_content.dart';

class BoardingView extends StatelessWidget {
  const BoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoardingBloc(),
      child: Scaffold(
        body: SafeArea(child: BoardingContent()),
      ),
    );
  }
}
