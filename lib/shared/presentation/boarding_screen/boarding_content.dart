import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shop_app/shared/cores/utils/parallel_tool.dart';
import 'package:shop_app/shared/models/boarding_model.dart';
import 'package:shop_app/shared/presentation/boarding_screen/widgets/boarding_navigation.dart';
import 'package:shop_app/shared/presentation/boarding_screen/widgets/page_view_body.dart';

import 'package:shop_app/shared/presentation/boarding_screen/widgets/skip_button.dart';

class BoardingContent extends StatefulWidget {
  const BoardingContent({super.key});

  @override
  State<BoardingContent> createState() => _BoardingContentState();
}

class _BoardingContentState extends State<BoardingContent> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(viewportFraction: 1.15);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: Column(
          spacing: 1.h,
          children: [
            SkipButton(),
            PageViewBody(
              controller: controller,
            ),
            BoardingNavigation(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
  }
}
