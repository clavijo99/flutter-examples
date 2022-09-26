import 'package:examples/ux/deliveryExample/ux/layout/layout_screen.dart';
import 'package:examples/ux/deliveryExample/ux/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DeliveryAppMain extends StatelessWidget {
  const DeliveryAppMain({super.key});

  @override
  Widget build(BuildContext context) {
    final ProviderState providerState = ProviderState();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: const Color(0xFFFDFDFD).withOpacity(0.5),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: const Color(0xFFFDFDFD).withOpacity(0.5),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return ChangeNotifierProvider(
      create: (_) => providerState,
      child: Builder(builder: (_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LayaoutScreen.init(_),
        );
      }),
    );
  }
}
