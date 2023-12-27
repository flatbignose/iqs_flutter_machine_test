import 'package:flutter/material.dart';
import 'package:iqs_flutter_machine_test/core/colors.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isobscure,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isobscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: controller,
        obscureText: isobscure,
        decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
