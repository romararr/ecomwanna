import 'package:ecomwanna/component/carousel.dart';
import 'package:ecomwanna/component/section_title.dart';
import 'package:ecomwanna/component/list_product.dart';
import 'package:flutter/material.dart';

class WebCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constrains) {
      if (constrains.maxWidth > 1200) {
        return _Render(carouselSize: 500);
      } else {
        return _Render(carouselSize: 400);
      }
    });
  }
}

class _Render extends StatelessWidget {
  final double carouselSize;

  _Render({required this.carouselSize});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // SectionTitle(title: 'Promo Ramadan!'),
        Carousel(
          size: carouselSize,
          isWeb: true,
        ),
        FractionallySizedBox(
          widthFactor: 0.8,
          child: SectionTitle(title: 'Explore your style'),
        ),
        ListProduct(grid: 4)
      ],
    );
  }
}
