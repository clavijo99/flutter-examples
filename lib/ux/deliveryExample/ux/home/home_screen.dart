import 'package:examples/ux/deliveryExample/ux/car-shopping/car_shopping_screen.dart';
import 'package:examples/ux/deliveryExample/ux/home/widgets/products.dart';
import 'package:examples/ux/deliveryExample/ux/home/widgets/search.dart';
import 'package:examples/ux/deliveryExample/ux/home/widgets/slider_sale.dart';
import 'package:examples/ux/deliveryExample/ux/provider.dart';
import 'package:examples/ux/deliveryExample/ux/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

    final ProviderState providerState =
        Provider.of<ProviderState>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Consumer<ProviderState>(builder: (_, __, ___) {
              return AppBarCustom(
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
                icon2: (providerState.shopping.isNotEmpty)
                    ? Center(
                        child: Stack(
                          children: [
                            Image.asset('assets/icons/shopping-bag.png'),
                            Positioned(
                                top: 1,
                                right: 2,
                                child: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                ))
                          ],
                        ),
                      )
                    : Image.asset('assets/icons/shopping-bag.png'),
                onTap2: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => CarShoppingScreen())),
              );
            }),
            const SizedBox(height: 20),
            const SliderSaleProduct(),
            const SizedBox(height: 8),
            const Search(),
            const SizedBox(height: 15),
            const Expanded(child: Products()),
          ],
        ),
      ),
    );
  }
}
