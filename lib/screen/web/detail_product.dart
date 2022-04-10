import 'package:ecomwanna/model/products.dart';
import 'package:flutter/material.dart';

import '../../component/favorite_button.dart';

class WebDetailProduct extends StatelessWidget {
  final Products product;
  final List<Products> otherItem = [];

  WebDetailProduct({required this.product});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    for (var i = 0;
        i < (productList.length > 5 ? 5 : productList.length);
        i++) {
      otherItem.add(productList[i]);
    }
    otherItem.removeWhere((item) => item.name == product.name);

    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: Text(
          "Detail of " + product.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black26,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                    )),
              )),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.black26,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 24, bottom: 24),
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    width: screenWidth < 1200 ? screenWidth : 1200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(children: [
                            Hero(
                                tag: product.id,
                                child: Image.asset(product.img)),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.chat_rounded),
                                              Text(" Chat")
                                            ],
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.indigo.shade100,
                                            side: const BorderSide(
                                                width: 2, color: Colors.indigo),
                                            onPrimary: Colors.indigo),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 8),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Icon(Icons
                                                    .add_shopping_cart_outlined),
                                                Text(" Add To Cart")
                                              ],
                                            ),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                        ),
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 16),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.name,
                                              style: const TextStyle(
                                                  fontFamily: 'Josefin',
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                for (var i = 0;
                                                    i < product.rating;
                                                    i++)
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text(product.rating
                                                      .toString()),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        FavoriteButton()
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      child: Text(
                                        product.price,
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            color: Color(0xff00ad0a)),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 8),
                                          child: const Text(
                                            "Deskripsi",
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                        Text(product.description)
                                      ],
                                    ),
                                  ],
                                )))
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 24),
                    width: screenWidth < 1200 ? screenWidth : 1200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, right: 8, bottom: 16),
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
                                      return WebDetailProduct(
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
                                                    alignment: FractionalOffset
                                                        .topCenter,
                                                    image: AssetImage(
                                                        otherItem[index].img))),
                                          ),
                                        )),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
