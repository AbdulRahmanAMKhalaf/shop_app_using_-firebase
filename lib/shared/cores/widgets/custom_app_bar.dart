import 'package:flutter/material.dart';

/// A reusable app bar widget that provides consistent styling across the app.
///
/// ### Parameters:
/// - [title]: The title of the app bar (required).
/// - [actions]: Actions to display on the right side of the app bar (optional).
/// - [backgroundColor]: The background color of the app bar (default: Colors.blue).
/// - [textColor]: The color of the app bar's text (default: Colors.white).

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color textColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      backgroundColor: backgroundColor,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
