import 'dart:ui';

import 'package:examples/ux/chatExample/ux/chats/chats_screen.dart';
import 'package:examples/ux/chatExample/ux/layout/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen._();

  static Widget init(BuildContext context) {
    final LayoutProvider layoutProvider = LayoutProvider();
    return ChangeNotifierProvider(
      create: ((context) => layoutProvider),
      builder: (context, child) => const LayoutScreen._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final LayoutProvider layoutProvider =
        Provider.of<LayoutProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0E0E10),
        body: Stack(
          children: [
            Positioned.fill(
              child: (layoutProvider.currenPage == 0)
                  ? const ChatsScreen()
                  : Container(),
            ),
            Positioned(
              bottom: 30,
              right: 20,
              left: 20,
              child: CustomBottomNavigationBar(size: size),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          width: size.width,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFF25262C).withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.emergency_recording,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF414248),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/icons/avatar.png'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.splitscreen_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
