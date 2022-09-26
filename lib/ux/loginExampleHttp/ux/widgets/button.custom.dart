import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    required this.text,
    required this.onTap,
    this.invalide = false,
  });

  final String text;
  final VoidCallback onTap;
  final bool invalide;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: (invalide) ? null : onTap,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: (invalide) ? Colors.grey : const Color(0xFFFC6B68),
            borderRadius: BorderRadiusDirectional.circular(10),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
