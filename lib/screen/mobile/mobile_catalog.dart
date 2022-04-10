import 'package:ecomwanna/component/carousel.dart';
import 'package:ecomwanna/component/section_title.dart';
import 'package:ecomwanna/component/list_product.dart';
import 'package:flutter/material.dart';

class MobileCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SectionTitle(title: 'Promo Ramadan!'),
        Carousel(
          size: 250,
          isWeb: false,
        ),
        SectionTitle(title: 'Explore your style'),
        ListProduct(
          grid: 2,
        )
      ],
    );
  }
}
