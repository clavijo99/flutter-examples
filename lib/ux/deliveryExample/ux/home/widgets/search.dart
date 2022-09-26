import 'package:examples/ux/deliveryExample/ux/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController? providerState =
        Provider.of<ProviderState>(context).textEditingController;
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: size.width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: const Color(0xFFEBEBED),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                size: 30,
                color: Colors.black,
              ),
              hintText: 'Search your food ...',
              contentPadding: EdgeInsets.symmetric(vertical: 20),
              border: InputBorder.none,
            ),
            cursorColor: Colors.grey,
            keyboardType: TextInputType.text,
            controller: providerState,
          ),
        ),
      ),
    );
  }
}
