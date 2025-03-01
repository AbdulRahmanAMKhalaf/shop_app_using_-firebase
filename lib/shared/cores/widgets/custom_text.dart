import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// A reusable text widget that provides consistent styling across the app.
///
/// ### Parameters:
/// - [text]: The text to display.
/// - [fontSize]: The font size of the text (default: 16).
/// - [fontWeight]: The font weight of the text (default: FontWeight.normal).
/// - [color]: The color of the text (default: Colors.black).
/// - [textAlign]: The alignment of the text (default: TextAlign.start).
/// - [maxLines]: The maximum number of lines for the text (default: 1).
/// - [overflow]: How the text should handle overflow (default: TextOverflow.ellipsis).

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final String? family;
  final TextDecoration? textDecoration;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 18, // Default font size
    this.fontWeight = FontWeight.w600, // Default font weight
    this.color = Colors.black, // Default text color
    this.textAlign = TextAlign.start, // Default text alignment
    this.maxLines, // Optional: Maximum number of lines
    this.overflow = TextOverflow.ellipsis, // Default
    this.family, // overflow behavior
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize.px,
          decoration: textDecoration,
          fontWeight: fontWeight,
          decorationColor: color,
          wordSpacing: -1,
          color: color,
          fontFamily: family),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
