import 'package:flutter/material.dart';

class AlertDialogCustom extends StatelessWidget {
  const AlertDialogCustom({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 170, 174, 189),
                offset: Offset(0, 0.2),
                blurRadius: 50,
                spreadRadius: 5)
          ]),
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: 'AmiriQuran',
        ),
      ),
    );
  }
}
