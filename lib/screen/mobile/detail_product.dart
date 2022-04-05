import 'package:ecomwanna/model/products.dart';
import 'package:flutter/material.dart';

import '../../component/favorite_button.dart';

class DetailProduct extends StatelessWidget {
  final Products product;
  final List<Products> otherItem = [];

  DetailProduct({required this.product});

  @override
  Widget build(BuildContext context) {
    for (var i = 0;
        i < (productList.length > 5 ? 5 : productList.length);
        i++) {
      otherItem.add(productList[i]);
    }
    otherItem.removeWhere((item) => item.name == product.name);

    return Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Hero(tag: product.id, child: Image.asset(product.img)),
                      SafeArea(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black26,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.chevron_left,
                                    color: Colors.white,
                                  )),
                            ),
                            const Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: 0,
                                )),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black26,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      )),
                                )),
                            CircleAvatar(
                              backgroundColor: Colors.black26,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                                fontFamily: 'Josefin',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            product.price,
                            style: const TextStyle(
                                fontSize: 20.0, color: Color(0xff00ad0a)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  for (var i = 0; i < product.rating; i++)
                                    if (product.rating - i > 1)
                                      const Icon(
                                        Icons.star_rounded,
                                        color: Colors.orange,
                                      )
                                    else
                                      const Icon(
                                        Icons.star_half_rounded,
                                        color: Colors.orange,
                                      ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(product.rating.toString()),
                                  )
                                ],
                              ),
                              FavoriteButton()
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
            Container(
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: const Text(
                              "Deskripsi",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          Text(product.description)
                        ],
                      ),
                    ),
                  ],
                )),
            Container(
                color: Colors.white,
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                      child: Text(
                        "Lihat Produk Lain",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: otherItem.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailProduct(
                                      product: otherItem[index]);
                                }));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    child: AspectRatio(
                                      aspectRatio: 150 / 150,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                alignment:
                                                    FractionalOffset.topCenter,
                                                image: AssetImage(
                                                    otherItem[index].img))),
                                      ),
                                    )),
                              ),
                            );
                          }),
                    ),
                  ],
                ))
          ],
        ),
        bottomNavigationBar: Container(
          height: 100,
          color: Colors.amber,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Icon(
                          Icons.chat,
                          color: Colors.amber,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.amber,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Beli Sekarang ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Icon(
                                Icons.shopping_cart_checkout,
                                color: Colors.white,
                              )
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
