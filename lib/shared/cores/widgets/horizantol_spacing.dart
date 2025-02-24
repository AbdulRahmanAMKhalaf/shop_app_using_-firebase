import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// ### Parameters:
/// - [width]: The width of the horizontal space (default: 16.0).
class HorizontalSpacing extends StatelessWidget {
  /// The width of the horizontal space.
  final double width;

  /// Creates a horizontal spacing widget with the specified width.
  const HorizontalSpacing({super.key, this.width = 16.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
    );
  }
}