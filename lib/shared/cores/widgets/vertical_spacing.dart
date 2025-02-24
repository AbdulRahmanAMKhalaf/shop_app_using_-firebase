import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// ### Parameters:
/// - [height]: The height of the vertical space (default: 16.0).
class VerticalSpacing extends StatelessWidget {
  /// The height of the vertical space.
  final double height;

  /// Creates a vertical spacing widget with the specified height.
  const VerticalSpacing({super.key, this.height = 16.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}