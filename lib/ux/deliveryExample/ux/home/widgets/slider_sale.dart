import 'package:flutter/material.dart';
import 'dart:async';

class SliderSaleProduct extends StatefulWidget {
  const SliderSaleProduct({super.key});

  @override
  State<SliderSaleProduct> createState() => _SliderSaleProductState();
}

class _SliderSaleProductState extends State<SliderSaleProduct> {
  late final Timer time;
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, keepPage: false);
    time = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (pageController.page == 5) {
        pageController.jumpToPage(0);
      } else {
        pageController.nextPage(
            duration: const Duration(milliseconds: 800),
            curve: Curves.elasticOut);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 140,
      child: PageView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (index % 2 == 0) ? Colors.purple : Colors.red,
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/slider.png',
                        fit: BoxFit.cover,
                      ),
                      //add image
                    ),
                  ),
                  Positioned.fill(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Get special discount',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Up to 85%',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: (size.width - 50) * 0.33,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Text('Claim voucher'),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        },
        itemCount: 6,
        physics: const NeverScrollableScrollPhysics(),
        reverse: false,
        controller: pageController,
      ),
    );
  }
}
