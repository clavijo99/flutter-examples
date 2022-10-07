import 'dart:ui';

import 'package:examples/ux/deliveryExample/data/product_shpping.dart';
import 'package:examples/ux/deliveryExample/ux/provider.dart';
import 'package:examples/ux/deliveryExample/ux/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarShoppingScreen extends StatelessWidget {
  const CarShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ProviderState providerState =
        Provider.of<ProviderState>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
          child: Consumer<ProviderState>(builder: (_, __, ___) {
            return Column(
              children: [
                AppBarCustom(
                  icon1: 'assets/icons/atras.png',
                  onTap1: () => Navigator.of(context).pop(),
                  title: const Center(
                    child: Text('Your cart food'),
                  ),
                  icon2: Image.asset('assets/icons/menu2.png'),
                  onTap2: () {},
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: (providerState.shopping.isNotEmpty)
                      ? ListView.builder(
                          itemBuilder: ((context, index) =>
                              Consumer<ProviderState>(builder: (_, __, ___) {
                                return ShoppingProduct(
                                  productShopping:
                                      providerState.shopping[index],
                                );
                              })),
                          itemCount: providerState.shopping.length,
                          physics: const BouncingScrollPhysics(),
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                        )
                      : const Center(
                          child: Text('No hay productos en tu carrito')),
                ),
                Expanded(
                  child: (providerState.shopping.isNotEmpty)
                      ? Payment()
                      : Container(),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ProviderState providerState =
        Provider.of<ProviderState>(context, listen: true);
    return GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: size.width,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Promo code',
                                  hintStyle: const TextStyle(
                                    fontSize: 19,
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, top: 5, bottom: 5, right: 12),
                                    child:
                                        Image.asset('assets/icons/cupon.png'),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 20)),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 43,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2D2F3C),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text(
                              'Apply',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Item total:',
                    style: TextStyle(
                      color: Color(0xFFCACACA),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '\$${providerState.getTotal()}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF888888),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Delivery:',
                    style: TextStyle(
                      color: Color(0xFFCACACA),
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Free',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF888888),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                  width: size.width,
                  height: 17,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemBuilder: ((context, index) => Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              width: 10,
                              color: Colors.grey,
                            ),
                          )),
                      itemCount: 17,
                      scrollDirection: Axis.horizontal,
                    ),
                  )),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 19,
                      color: Color(0xFF0B0B0B),
                    ),
                  ),
                  Text(
                    '\$${providerState.getTotal()}',
                    style: const TextStyle(
                      fontSize: 19,
                      color: Color(0xFF0B0B0B),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: size.width,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF0A0A0A),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Text(
                  'Payment',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingProduct extends StatelessWidget {
  const ShoppingProduct({
    Key? key,
    required this.productShopping,
  }) : super(key: key);
  final ProductShopping productShopping;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ProviderState providerState =
        Provider.of<ProviderState>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(
          top: 5,
          right: 10,
          left: 10,
          bottom: (providerState.shopping[providerState.shopping.length - 1] ==
                  productShopping)
              ? 30
              : 10),
      child: Container(
        width: size.width,
        height: 130,
        decoration: BoxDecoration(
          color: const Color(0xFFFEfEfE),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(productShopping.image),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productShopping.name,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => providerState
                              .deleteProductShopping(productShopping),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '\$${productShopping.price * productShopping.counter}',
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ButtonIncrementAndDecrementProduct(
                              productShopping: productShopping),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ButtonIncrementAndDecrementProduct extends StatelessWidget {
  const ButtonIncrementAndDecrementProduct({
    Key? key,
    required this.productShopping,
  }) : super(key: key);

  final ProductShopping productShopping;

  @override
  Widget build(BuildContext context) {
    final ProviderState providerState = Provider.of<ProviderState>(context);
    return SizedBox(
      width: 85,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: (productShopping.counter > 1)
                    ? Colors.white
                    : Colors.transparent,
                border: (productShopping.counter > 1)
                    ? null
                    : Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: GestureDetector(
                onTap: () {
                  if (productShopping.counter > 1) {
                    providerState.DismishProductShopping(productShopping);
                  }
                },
                child: Icon(
                  Icons.remove,
                  color: (productShopping.counter > 1)
                      ? Colors.black
                      : Colors.grey,
                ),
              ),
            ),
            Text(
              productShopping.counter.toString(),
              style: const TextStyle(fontSize: 19),
            ),
            GestureDetector(
              onTap: () =>
                  providerState.IncrementProductShopping(productShopping),
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}
