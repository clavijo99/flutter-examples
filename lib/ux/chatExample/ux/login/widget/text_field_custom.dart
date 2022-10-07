import 'package:examples/ux/chatExample/ux/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    Key? key,
    required this.hinText,
    required this.icon,
    required this.onTap,
    required this.textEditingController,
    required this.inHabilidate,
    required this.typePassword,
  }) : super(key: key);
  final String hinText;
  final Widget icon;
  final VoidCallback onTap;
  final TextEditingController textEditingController;
  final bool inHabilidate;
  final bool typePassword;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bloc = Provider.of<LoginProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: size.width,
        height: 60,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: const Color(0xFF151718),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hinText,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 19, horizontal: 1),
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                ),
                icon: icon,
                suffixIcon: (typePassword)
                    ? GestureDetector(
                        onTap: () => bloc.obscureText(),
                        child: (bloc.obcureText)
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: Colors.white,
                              ))
                    : null),
            style: TextStyle(
                color: (inHabilidate) ? Colors.grey : Colors.white,
                fontSize: 19),
            cursorColor: Colors.white,
            keyboardType:
                (typePassword) ? TextInputType.text : TextInputType.phone,
            controller: textEditingController,
            enableInteractiveSelection: false,
            onTap: onTap,
            obscureText: (typePassword) ? bloc.obcureText : false,
          ),
        ),
      ),
    );
  }
}
