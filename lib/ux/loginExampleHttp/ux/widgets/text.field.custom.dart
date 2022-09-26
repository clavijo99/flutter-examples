import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    super.key,
    required this.hinText,
    required this.controller,
  });
  final String hinText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: Colors.white54,
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: hinText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Color(0xFF5C586B), fontSize: 18),
          keyboardType: TextInputType.emailAddress,
          cursorColor: Colors.transparent,
          cursorHeight: 0,
          cursorWidth: 0,
          controller: controller,
        ),
      ),
    );
  }
}
