import 'package:flutter/material.dart';

class TextFieldPasswordCustom extends StatefulWidget {
  const TextFieldPasswordCustom({
    super.key,
    required this.hinTExt,
    required this.controller,
    this.onChange,
  });
  final String hinTExt;
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;

  @override
  State<TextFieldPasswordCustom> createState() =>
      _TextFieldPasswordCustomState();
}

class _TextFieldPasswordCustomState extends State<TextFieldPasswordCustom> {
  bool visibilityPassword = true;
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
            hintText: widget.hinTExt,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            border: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap: () {
                visibilityPassword = !visibilityPassword;
                setState(() {});
              },
              child: (!visibilityPassword)
                  ? const Icon(
                      Icons.visibility_off,
                      color: Color(0xFF5C586B),
                    )
                  : const Icon(
                      Icons.visibility,
                      color: Color(0xFF5C586B),
                    ),
            ),
          ),
          style: const TextStyle(color: Color(0xFF5C586B), fontSize: 18),
          keyboardType: TextInputType.emailAddress,
          obscureText: visibilityPassword,
          cursorColor: Colors.transparent,
          cursorHeight: 0,
          cursorWidth: 0,
          controller: widget.controller,
          onChanged: widget.onChange,
        ),
      ),
    );
  }
}
