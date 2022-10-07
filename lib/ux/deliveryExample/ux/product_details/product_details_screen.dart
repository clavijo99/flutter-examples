import 'dart:ui';

import 'package:examples/ux/deliveryExample/data/product_shpping.dart';
import 'package:examples/ux/deliveryExample/data/products.dart';
import 'package:examples/ux/deliveryExample/ux/product_details/widgets/button_incr_product.dart';
import 'package:examples/ux/deliveryExample/ux/provider.dart';
import 'package:examples/ux/deliveryExample/ux/widgets/appBar.dart';
import 'package:examples/ux/deliveryExample/ux/widgets/product_qualification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ProviderState providerState =
        Provider.of<ProviderState>(context, listen: false);
    providerState.resetCounterProduct();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: const Color(0xFFFDFDFD),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: const Color(0xFFFDFDFD).withOpacity(0.5),
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    void addProduct() {
      ProductShopping productShopping = ProductShopping(product.name,
          product.image, product.price, providerState.counterProduct);
      providerState.addProductShopping(productShopping);
    }

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<ProviderState>(
                  builder: (context, value, child) => AppBarCustom(
                      icon1: 'assets/icons/atras.png',
                      onTap1: () => Navigator.of(context).pop(),
                      title: const Center(child: Text('Details')),
                      icon2: (product.ilove)
                          ? Image.asset('assets/icons/corazonAdd.png')
                          : Image.asset('assets/icons/corazon.png'),
                      onTap2: () {
                        providerState.AddFavoritesProducts(product);
                      }),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: size.width * 0.45,
                    alignment: Alignment.center,
                    child: Image.asset(product.image),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(fontSize: 25),
                      ),
                      ProductQualification(
                        calification: product.qualification.toString(),
                        mainAxisAlignment: MainAxisAlignment.end,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: size.width,
                  height: 75,
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 130,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                    product.ingredients[index].image),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                                child: Text(product.ingredients[index].name))
                          ]),
                        ),
                      );
                    }),
                    itemCount: product.ingredients.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const ButtonIncrementAndDiminish(),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'About ${product.name}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 110,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, bottom: 20),
                      child: Text(
                        product.description,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 50,
              height: 100,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 0.5,
                      offset: const Offset(
                        1,
                        1,
                      ),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 0.5,
                      offset: const Offset(
                        -1,
                        -1,
                      ),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer<ProviderState>(
                          builder: (_, __, ___) {
                            return Text(
                              '\$${product.price * providerState.counterProduct}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Total price',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        addProduct();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 150,
                        height: 55,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFF0A0A0A),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Text(
                          'Place Order',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
