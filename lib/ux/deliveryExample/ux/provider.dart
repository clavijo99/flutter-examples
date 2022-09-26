import 'package:examples/ux/deliveryExample/ux/home/widgets/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:examples/ux/deliveryExample/data/products.dart';

class ProviderState extends ChangeNotifier {
  int currentSlider = 0;
  int currentNavigationBottom = 0;
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
}
