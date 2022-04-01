import 'package:ecomwanna/model/products.dart';
import 'package:flutter/material.dart';

import 'mobile/detail_product.dart';

class ListProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: productList.map((product) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailProduct(product: product);
              }));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    child: Hero(
                      tag: product.name,
                      child: Image.asset(
                        product.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(product.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(product.price),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    ));
  }
}
