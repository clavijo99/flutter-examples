import 'package:examples/ux/deliveryExample/data/products.dart';
import 'package:examples/ux/deliveryExample/ux/provider.dart';
import 'package:examples/ux/deliveryExample/ux/widgets/appBar.dart';
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
    final ProviderState providerState = Provider.of<ProviderState>(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: const Color(0xFFFDFDFD),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: const Color(0xFFFDFDFD).withOpacity(0.5),
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  AppBarCustom(
                      icon1: 'assets/icons/atras.png',
                      onTap1: () => Navigator.of(context).pop(),
                      title: const Center(child: Text('Details')),
                      icon2: (product.ilove)
                          ? 'assets/icons/corazonAdd.png'
                          : 'assets/icons/corazon.png',
                      onTap2: () {
                        providerState.setFavoriteProducts(
                            product, !product.ilove);
                      }),
                  SizedBox(
                    width: size.width * 0.55,
                    child: Image.asset(product.image),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(fontSize: 25),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_outlined,
                              color: Colors.yellow,
                            ),
                            SizedBox(width: 4),
                            Text(
                              product.qualification.toString(),
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
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
                              SizedBox(width: 5),
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
                        Container(
                          width: 90,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Expanded(
                                child: Icon(Icons.remove),
                              ),
                              Text('1'),
                              Expanded(
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
