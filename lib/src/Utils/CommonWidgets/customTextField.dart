// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:untitled/src/Theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final IconData? icon;
  final bool secureText;
  final TextEditingController controller;
  final TextInputType type;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.placeholder,
    required this.icon,
    required this.secureText,
    required this.controller,
    required this.type,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: validator,
          controller: controller,
          obscureText: secureText,
          keyboardType: type,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: placeholder,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
