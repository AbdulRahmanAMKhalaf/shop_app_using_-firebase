import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final String? note; // Helper text (note) below the field
  final bool obscureText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final String? family;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String)? onSubmitted;

  const CustomTextFormField({super.key,
    required this.labelText,
    this.hintText,
    this.note,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.focusNode,
    this.family,
    this.suffixIcon,
    this.onSubmitted,
    this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black,
          fontFamily: family),
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        labelStyle: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: family,
            fontWeight: FontWeight.bold),
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade400,
            fontFamily: family,
            fontWeight: FontWeight.bold),
        helperText: note,
        helperStyle: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade400,
            fontFamily: family,
            fontWeight: FontWeight.bold),
        // Note (helper text)
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey), // Enabled border
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepOrange),
          // Focus border
          borderRadius: BorderRadius.circular(15.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red), // Error border
          borderRadius: BorderRadius.circular(8.0),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          // Focused error border
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: validator,
      onFieldSubmitted:onSubmitted,
    );
  }
}
