import 'package:examples/ux/deliveryExample/ux/provider.dart';
import 'package:examples/ux/deliveryExample/ux/widgets/appBar.dart';
import 'package:examples/ux/deliveryExample/ux/widgets/product_qualification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProviderState providerState = Provider.of<ProviderState>(context);
    return Column(
      children: [
        AppBarCustom(
            icon1: 'assets/icons/atras.png',
            onTap1: () => providerState.setCurrentPage(0),
            title: Center(child: Text('Favorites')),
            icon2: Image.asset('assets/icons/menu2.png'),
            onTap2: () {}),
        (providerState.favoritesProducts.isNotEmpty)
            ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 250,
                    ),
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        providerState
                                            .favoritesProducts[index].image,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    providerState.favoritesProducts[index].name,
                                    style: TextStyle(
                                      fontSize: 19,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ProductQualification(
                                        calification: providerState
                                            .favoritesProducts[index]
                                            .qualification
                                            .toString(),
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            shape: BoxShape.circle),
                                        child: GestureDetector(
                                            onTap: () => providerState
                                                .AddFavoritesProducts(
                                                    providerState
                                                            .favoritesProducts[
                                                        index]),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                  'assets/icons/corazonAdd.png',
                                                  width: 35),
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                    itemCount: providerState.favoritesProducts.length,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
              )
            : Expanded(
                child: Center(
                  child: Text('No tienes productos favoritos'),
                ),
              ),
      ],
    );
  }
}
