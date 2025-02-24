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
  final String?family;

  const CustomTextFormField({
    super.key,
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
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
        fontFamily: family
      ),
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
            fontWeight: FontWeight.bold
        ),
        hintText: hintText,
        helperText: note, // Note (helper text)
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey), // Enabled border
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue), // Focus border
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red), // Error border
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red), // Focused error border
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: validator,
    );
  }
}