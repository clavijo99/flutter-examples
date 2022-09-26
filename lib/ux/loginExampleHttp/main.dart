import 'package:examples/ux/loginExampleHttp/ux/splash/splash.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginExampleHttpMain extends StatelessWidget {
  const LoginExampleHttpMain({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: const Color(0xFFD0D4E3).withOpacity(0.5)));
    return const Material(
      child: SplashScreen(),
    );
  }
}
