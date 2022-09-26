import 'package:examples/ux/deliveryExample/ux/home/widgets/products.dart';
import 'package:examples/ux/deliveryExample/ux/home/widgets/search.dart';
import 'package:examples/ux/deliveryExample/ux/home/widgets/slider_sale.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            SizedBox(height: 20),
            SliderSaleProduct(),
            SizedBox(height: 8),
            Search(),
            SizedBox(height: 15),
            Expanded(child: Products()),
          ],
        ),
      ),
    );
  }
}
