import 'package:ecomwanna/screen/list_product.dart';
import 'package:flutter/material.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog Product"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints contraints) {
        return ListProduct();
      }),
    );
  }
}
