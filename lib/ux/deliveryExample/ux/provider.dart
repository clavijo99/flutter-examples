import 'package:examples/ux/deliveryExample/data/product_shpping.dart';
import 'package:examples/ux/deliveryExample/data/products.dart';
import 'package:flutter/material.dart';

class ProviderState extends ChangeNotifier {
  int currentSlider = 0;
  int currentNavigationBottom = 0;
  int previusPage = 0;
  int counterProduct = 1;
  List<ProductShopping> shopping = [];
  List<Product> favoritesProducts = [];
  TextEditingController textEditingController = TextEditingController();

  void setCurrentPage(int index) {
    currentNavigationBottom = index;
    notifyListeners();
  }

  void setFavoriteProducts(Product product, bool state) {
    for (int i = 0; i < products.length; i++) {
      if (products[i] == product) {
        products[i].ilove = state;
      }
    }
    notifyListeners();
  }

  void resetCounterProduct() => counterProduct = 1;
  void incrementCounterProduct() {
    counterProduct++;
    notifyListeners();
  }

  void diminish() {
    counterProduct--;
    notifyListeners();
  }

  void AddFavoritesProducts(Product product) {
    if (favoritesProducts.isNotEmpty) {
      for (int i = 0; i < favoritesProducts.length; i++) {
        if (favoritesProducts[i] == product) {
          favoritesProducts.remove(favoritesProducts[i]);
          setFavoriteProducts(product, !product.ilove);
          return;
        }
      }
    }
    favoritesProducts.add(product);
    setFavoriteProducts(product, !product.ilove);
  }

  void addProductShopping(ProductShopping productShopping) {
    shopping.add(productShopping);
    notifyListeners();
  }

  void deleteProductShopping(ProductShopping productShopping) {
    shopping.remove(productShopping);
    notifyListeners();
  }

  void IncrementProductShopping(ProductShopping productShopping) {
    for (int i = 0; i < shopping.length; i++) {
      if (shopping[i] == productShopping) {
        shopping[i].counter = shopping[i].counter + 1;
        notifyListeners();
        return;
      }
    }
  }

  void DismishProductShopping(ProductShopping productShopping) {
    for (int i = 0; i < shopping.length; i++) {
      if (shopping[i] == productShopping) {
        shopping[i].counter--;
        notifyListeners();
        return;
      }
    }
  }

  double getTotal() {
    double total = 0.0;
    for (int i = 0; i < shopping.length; i++) {
      total += shopping[i].price * shopping[i].counter;
    }
    return total;
  }
}
