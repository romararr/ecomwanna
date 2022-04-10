import 'package:ecomwanna/component/list_cart.dart';
import 'package:ecomwanna/screen/mobile/mobile_catalog.dart';
import 'package:ecomwanna/screen/web/web_catalog.dart';
import 'package:flutter/material.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog Product",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constrains) {
        if (constrains.maxWidth <= 600) {
          return MobileCatalog();
        } else {
          return WebCatalog();
        }
      }),
    );
  }
}
