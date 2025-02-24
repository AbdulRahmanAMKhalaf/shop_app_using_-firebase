import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// A reusable button widget that provides consistent styling and behavior across the app.
///
/// ### Parameters:
/// - [onPressed]: The callback function to execute when the button is pressed (required).
/// - [text]: The text displayed on the button (default: "Button").
/// - [color]: The background color of the button (default: Colors.blue).
/// - [textColor]: The color of the button's text (default: Colors.white).
/// - [padding]: The padding inside the button (default: EdgeInsets.symmetric(vertical: 12, horizontal: 24)).
/// - [borderRadius]: The border radius of the button (default: 8.0).
/// - [elevation]: The elevation (shadow) of the button (default: 2.0).
/// - [isLoading]: Whether the button is in a loading state (default: false). If true, a circular progress indicator is shown.

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color textColor;
  final EdgeInsets padding;
  final double borderRadius;
  final double elevation;
  final bool isLoading;
  final double textSize;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.text = "Button", // Default text
    this.color = Colors.blue, // Default background color
    this.textColor = Colors.white, // Default text color
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Default padding
    this.borderRadius = 8.0, // Default border radius
    this.elevation = 2.0, // Default elevation
    this.isLoading = false, // Default loading state
    this.textSize=16,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed, // Disable button if loading
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor, backgroundColor: color, // Text color
        padding: padding, // Padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), // Rounded corners
        ),
        elevation: elevation, // Shadow
      ),
      child: isLoading
          ? SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(textColor), // Match spinner color to text color
        ),
      )
          : Text(
        text,
        textAlign: TextAlign.center,
        style:  TextStyle(fontSize: textSize.px, fontWeight: FontWeight.bold,),
      ),
    );
  }
}