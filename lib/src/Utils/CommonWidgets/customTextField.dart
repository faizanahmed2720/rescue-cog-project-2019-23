import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String placeholder;
  final IconData? icon;
  final bool secureText;
  final TextEditingController controller;
  final TextInputType type;
  final String? Function(String?)? validator;

  CustomTextField({
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
            focusedBorder: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
