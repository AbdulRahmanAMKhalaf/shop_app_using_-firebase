import 'package:flutter/material.dart';
import 'package:shop_app/shared/presentation/boarding_screen/boarding_content.dart';

class BoardingView extends StatelessWidget {
  const BoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BoardingContent()),
    );
  }
}
