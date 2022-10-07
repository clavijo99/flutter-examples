import 'package:flutter/material.dart';

class ProductQualification extends StatelessWidget {
  const ProductQualification({
    Key? key,
    required this.calification,
    required this.mainAxisAlignment,
  }) : super(key: key);

  final String calification;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star_outlined,
          color: Color(0xFFF8B040),
        ),
        const SizedBox(width: 4),
        Text(
          calification,
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
