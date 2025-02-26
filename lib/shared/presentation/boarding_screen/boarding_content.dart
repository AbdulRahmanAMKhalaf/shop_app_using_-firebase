import 'package:flutter/material.dart';
import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/presentation/bloc/boarding/boarding_bloc.dart';
import 'package:shop_app/shared/presentation/boarding_screen/widgets/boarding_navigation.dart';
import 'package:shop_app/shared/presentation/boarding_screen/widgets/page_view_body.dart';
import 'package:shop_app/shared/presentation/boarding_screen/widgets/skip_button.dart';


class BoardingContent extends StatefulWidget {
  const BoardingContent({super.key});

  @override
  State<BoardingContent> createState() => _BoardingContentState();
}

class _BoardingContentState extends State<BoardingContent> {

  @override
  Widget build(BuildContext context) {
    BoardingBloc bloc=context.read();
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Column(
          spacing: 1.h,
          children: [
            SkipButton(),
            PageViewBody(
              controller: bloc.controller,
            ),
            BoardingNavigation(
              controller: bloc.controller,
            ),
          ],
        ),
      ),
    );
  }

}
