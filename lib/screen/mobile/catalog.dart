import 'package:ecomwanna/component/carousel.dart';
import 'package:ecomwanna/component/section_title.dart';
import 'package:ecomwanna/screen/list_product.dart';
import 'package:ecomwanna/screen/mobile/list_cart.dart';
import 'package:flutter/material.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog Product"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListCart();
                }));
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView(
        children: [
          SectionTitle(title: 'Promo Ramadan!'),
          Carousel(),
          SectionTitle(title: 'Explore your style'),
          ListProduct()
        ],
      ),
    );
  }
}
