import 'package:examples/ux/deliveryExample/ux/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationCustom extends StatelessWidget {
  const BottomNavigationCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ProviderState providerState =
        Provider.of<ProviderState>(context, listen: false);
    return Container(
      width: size.width,
      height: 75,
      child: Row(
        children: [
          Expanded(
            child: BottonNavigationItem(
              index: 0,
              onTap: () => providerState.setCurrentPage(0),
              imagen: Image.asset('assets/icons/home.png'),
              imageSelect: Image.asset('assets/icons/homeSelect.png'),
            ),
          ),
          Expanded(
            child: BottonNavigationItem(
              index: 1,
              onTap: () => providerState.setCurrentPage(1),
              imagen: Image.asset('assets/icons/corazon.png'),
              imageSelect: Image.asset('assets/icons/corazon-select.png'),
            ),
          ),
          Expanded(
            child: BottonNavigationItem(
              index: 2,
              onTap: () => providerState.setCurrentPage(2),
              imagen: Image.asset('assets/icons/shopping-bag.png'),
              imageSelect: Image.asset('assets/icons/shopping-bag-select.png'),
            ),
          ),
          Expanded(
            child: BottonNavigationItem(
              index: 3,
              onTap: () => providerState.setCurrentPage(3),
              imagen: Image.asset('assets/icons/user.png'),
              imageSelect: Image.asset('assets/icons/user-select.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class BottonNavigationItem extends StatelessWidget {
  const BottonNavigationItem({
    Key? key,
    required this.onTap,
    required this.index,
    required this.imagen,
    required this.imageSelect,
  }) : super(key: key);
  final VoidCallback onTap;
  final int index;
  final Widget imagen;
  final Widget imageSelect;

  @override
  Widget build(BuildContext context) {
    final ProviderState providerState = Provider.of<ProviderState>(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: 15,
              left: 5,
              right: 5,
              height: 30,
              child: (providerState.currentNavigationBottom == index)
                  ? imageSelect
                  : imagen,
            ),
            Positioned(
                bottom: -5,
                left: 5,
                right: 5,
                height: 25,
                child: (providerState.currentNavigationBottom == index)
                    ? Image.asset(
                        'assets/icons/ola.png',
                        width: 25,
                      )
                    : Container())
          ],
        ),
      ),
    );
  }
}
