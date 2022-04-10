import 'package:ecomwanna/model/products.dart';
import 'package:ecomwanna/screen/web/detail_product.dart';
import 'package:flutter/material.dart';

import '../screen/mobile/detail_product.dart';

class ListProduct extends StatelessWidget {
  final int grid;

  ListProduct({required this.grid});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: FractionallySizedBox(
        widthFactor: grid > 2 ? 0.8 : 1,
        child: GridView.count(
          crossAxisCount: grid,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: productList.map((product) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  if (grid > 2) {
                    return WebDetailProduct(product: product);
                  } else {
                    return DetailProduct(product: product);
                  }
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
                        tag: product.id,
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
      ),
    );
  }
}
