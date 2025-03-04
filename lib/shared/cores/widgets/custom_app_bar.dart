import 'package:shop_app/shared/cores/utils/parallel_tool.dart';

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
  final double size;
  final TextAlign? textAlign;
  final int? lines;
  final bool? centerTitle;
  final FontWeight? fontWeight;
  final double? height;

  const CustomAppBar({super.key,
    required this.title,
    this.actions,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.size = 14,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.center,
    this.height=10,
    this.centerTitle = true,
    this.lines = 1});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      toolbarHeight: height?.h,
      surfaceTintColor: Colors.deepOrange,
      title: Text(
        title,
        textAlign: textAlign,
        maxLines: lines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: textColor, fontSize: size.px, fontWeight:fontWeight),
      ),
      backgroundColor: backgroundColor,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
