import 'package:counter_button/counter_button.dart';
import 'package:ecomwanna/component/number_count.dart';
import 'package:ecomwanna/model/cart.dart';
import 'package:ecomwanna/model/discounted.dart';
import 'package:ecomwanna/screen/mobile/detail_product.dart';
import 'package:flutter/material.dart';

class ListCart extends StatefulWidget {
  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCart> {
  List<Carts> carts = cartList;

  void removeFromCart(int index) {
    setState(() {
      carts = List.from(carts)..removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text("My Cart"),
      ),
      body: ListView.builder(
          itemCount: carts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailProduct(product: carts[index].product);
                }));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 1),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      alignment: FractionalOffset.topCenter,
                                      image: AssetImage(
                                          carts[index].product.img))),
                            ),
                          )),
                    ),
                    Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                carts[index].product.name,
                                style: const TextStyle(
                                    fontFamily: 'Josefin',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                carts[index].product.price,
                                style: const TextStyle(
                                    fontSize: 20.0, color: Color(0xff00ad0a)),
                              ),
                              NumberCount()
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: TextButton(
                            onPressed: () => removeFromCart(index),
                            child: Column(children: const [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              Text(
                                "Hapus",
                                style: TextStyle(color: Colors.red),
                              )
                            ]),
                          ),
                        ))
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_bag_outlined),
        onPressed: () {},
      ),
    );
  }
}
