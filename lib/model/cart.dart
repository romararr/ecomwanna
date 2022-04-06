import 'package:ecomwanna/model/products.dart';

class Carts {
  String id;
  Products product;
  int qty;
  String note;

  Carts(
      {required this.id,
      required this.product,
      required this.note,
      required this.qty});
}

var cartList = [
  Carts(id: "C01", product: productList[0], note: '', qty: 1),
  Carts(id: "C02", product: productList[3], note: '', qty: 1)
];
