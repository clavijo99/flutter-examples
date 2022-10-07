import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom(
      {super.key,
      required this.icon1,
      required this.onTap1,
      required this.title,
      required this.icon2,
      required this.onTap2});
  final String icon1;
  final VoidCallback onTap1;
  final Widget title;
  final Widget icon2;
  final VoidCallback onTap2;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: onTap1,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      icon1,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: title,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: onTap2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: icon2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
