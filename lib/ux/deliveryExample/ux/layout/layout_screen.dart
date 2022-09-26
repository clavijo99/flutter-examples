import 'package:examples/ux/deliveryExample/ux/car-shopping/car_shopping_screen.dart';
import 'package:examples/ux/deliveryExample/ux/favorites/favorites_screen.dart';
import 'package:examples/ux/deliveryExample/ux/home/home_screen.dart';
import 'package:examples/ux/deliveryExample/ux/widgets/appBar.dart';
import 'package:examples/ux/deliveryExample/ux/layout/widgets/botton_navigation_custom.dart';
import 'package:examples/ux/deliveryExample/ux/profile/profile_screen.dart';
import 'package:examples/ux/deliveryExample/ux/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayaoutScreen extends StatelessWidget {
  const LayaoutScreen._();

  static Widget init(BuildContext context) {
    return const LayaoutScreen._();
  }

  @override
  Widget build(BuildContext context) {
    final currenPage =
        Provider.of<ProviderState>(context).currentNavigationBottom;
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavigationCustom(),
        backgroundColor: const Color(0xFFFCFBFC),
        body: Column(
          children: [
            AppBarCustom(
              icon1: 'assets/icons/menu.png',
              onTap1: () {},
              title: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Location',
                      style: TextStyle(color: Color(0xFFB8B8B8)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: Color(0xFFFC2926),
                        ),
                        SizedBox(width: 2),
                        Text(
                          'SingapurA',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              icon2: 'assets/icons/notification.png',
              onTap2: () {},
            ),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: (currenPage == 0)
                    ? const HomeScreen()
                    : (currenPage == 1)
                        ? const FavoritesScreen()
                        : (currenPage == 2)
                            ? const CarShoppingScreen()
                            : const ProfileScreen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
