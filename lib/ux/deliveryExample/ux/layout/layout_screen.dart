import 'package:examples/ux/deliveryExample/ux/car-shopping/car_shopping_screen.dart';
import 'package:examples/ux/deliveryExample/ux/favorites/favorites_screen.dart';
import 'package:examples/ux/deliveryExample/ux/home/home_screen.dart';
import 'package:examples/ux/deliveryExample/ux/layout/widgets/botton_navigation_custom.dart';
import 'package:examples/ux/deliveryExample/ux/profile/profile_screen.dart';
import 'package:examples/ux/deliveryExample/ux/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LayaoutScreen extends StatelessWidget {
  const LayaoutScreen._();

  static Widget init(BuildContext context) {
    return const LayaoutScreen._();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: const Color(0xFFFDFDFD),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: const Color(0xFFFDFDFD).withOpacity(0.5),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    final currenPage =
        Provider.of<ProviderState>(context).currentNavigationBottom;
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavigationCustom(),
        backgroundColor: const Color(0xFFFCFBFC),
        body: Column(
          children: [
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: (currenPage == 0)
                    ? const HomeScreen()
                    : (currenPage == 1)
                        ? Center(
                            child: Text('Page'),
                          )
                        : (currenPage == 2)
                            ? const FavoritesScreen()
                            : const ProfileScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
