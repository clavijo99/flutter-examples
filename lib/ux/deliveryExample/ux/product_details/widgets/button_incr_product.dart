import 'package:examples/ux/deliveryExample/ux/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonIncrementAndDiminish extends StatelessWidget {
  const ButtonIncrementAndDiminish({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderState providerState =
        Provider.of<ProviderState>(context, listen: false);
    return Consumer<ProviderState>(
      builder: (context, value, child) => Container(
        width: 90,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                  onTap: (providerState.counterProduct > 1)
                      ? () {
                          providerState.diminish();
                        }
                      : null,
                  child: Icon(
                    Icons.remove,
                    color: (providerState.counterProduct > 1)
                        ? Colors.black
                        : Colors.grey,
                  )),
            ),
            Text(providerState.counterProduct.toString()),
            Expanded(
              child: GestureDetector(
                onTap: () => providerState.incrementCounterProduct(),
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
