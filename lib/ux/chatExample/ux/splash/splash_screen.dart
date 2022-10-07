import 'package:examples/ux/chatExample/domain/repository/conatct_application_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/contacs_native_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/local_storage_repository_inter.dart';
import 'package:examples/ux/chatExample/domain/repository/user_repository_interface.dart';
import 'package:examples/ux/chatExample/ux/create_user/create_user_screen.dart';
import 'package:examples/ux/chatExample/ux/layout/layout_screen.dart';
import 'package:examples/ux/chatExample/ux/login/login_screen.dart';
import 'package:examples/ux/chatExample/ux/provider.dart';
import 'package:examples/ux/chatExample/ux/splash/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen._();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashProvider(
        localStrorageRepositoryInterface:
            Provider.of<LocalStrorageRepositoryInterface>(context,
                listen: false),
        chatProvider: Provider.of<ChatProvider>(context, listen: false),
        contactRepositoryInterface:
            Provider.of<ContactNativeRepositoryInterface>(context,
                listen: false),
        userRepositoryInterface:
            Provider.of<UserRepositoryInterface>(context, listen: false),
      ),
      builder: (context, child) => const SplashScreen._(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });

    super.initState();
  }

  void init() async {
    final SplashProvider splashProvider =
        Provider.of<SplashProvider>(context, listen: false);
    String result = await splashProvider.init();
    print(result);
    switch (result) {
      case 'user login':
        Future.delayed(const Duration(milliseconds: 1500), () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => LayoutScreen.init(_)));
        });
        break;
      case 'phone register':
        Future.delayed(const Duration(milliseconds: 1500), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => CreateUserScreen.init(_)),
          );
        });
        break;
      case 'phone not register':
        Future.delayed(const Duration(milliseconds: 1500), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => LoginScreen.init(_)),
          );
        });
        break;
    }
  }

  void getContact() async {
    // IO.Socket socket = IO.io(
    //     'http://192.168.20.24:3000',
    //     //'http://192.168.1.251:3000',
    //     //'http://localhost:3000',
    //     IO.OptionBuilder()
    //         .setTransports(['websocket']) // for Flutter or Dart VM
    //         .setExtraHeaders({'foo': 'bar'}) // optional
    //         .build());
    // socket.connect();
    // socket.on('event', (data) => print(data));
    // socket.emit("msg", "hola desde el cliente");
    // socket.emit("connectionUser", "3112422857");

    // for (int i = 0; i < splashProvider.contacts.length; i++) {
    //   socket.on('registeruser${splashProvider.contacts[i].number}',
    //       (data) => print('new user add ${data}'));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0E0E10),
      body: SizedBox(
        height: double.infinity,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
