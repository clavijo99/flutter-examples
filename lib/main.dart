import 'package:examples/ux/chatExample/ux/main.dart';
import 'package:examples/ux/deliveryExample/main.dart';
import 'package:examples/ux/loginExampleHttp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF124D65),
        body: Container(
          width: size.width,
          height: size.height,
          color: Colors.red,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Button(
                  text: 'Login Example Http',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const LoginExampleHttpMain(),
                      ),
                    );
                  },
                ),
                Button(
                  text: 'Delivery App',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const DeliveryAppMain()));
                  },
                ),
                Button(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ChatExampleMain(),
                    ),
                  ),
                  text: "Chat Example",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size.width,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xFFB8D1D7),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(2, 1),
                  blurRadius: 3,
                  spreadRadius: 0.1,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-2, 0),
                  blurRadius: 3,
                  spreadRadius: 0.1,
                ),
              ]),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'AbyssinicaSill',
            ),
          ),
        ),
      ),
    );
  }
}
