import 'package:ecomwanna/model/discounted.dart';
import 'package:ecomwanna/screen/mobile/detail_product.dart';
import 'package:ecomwanna/screen/web/detail_product.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final double size;
  final bool isWeb;

  Carousel({required this.size, required this.isWeb});

  @override
  State<StatefulWidget> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.size,
          width: double.infinity,
          child: PageView.builder(
              itemCount: discountedList.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return items(context, pagePosition, active, widget.isWeb);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(discountedList.length, activePage))
      ],
    );
  }
}

AnimatedContainer items(context, pagePosition, active, isWeb) {
  double margin = active ? 5 : 10;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    child: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          if (isWeb) {
            return WebDetailProduct(product: discountedList[pagePosition]);
          } else {
            return DetailProduct(product: discountedList[pagePosition]);
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
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Hero(
                tag: discountedList[pagePosition].id,
                child: Image.asset(
                  discountedList[pagePosition].img,
                  fit: BoxFit.cover,
                ),
              ),
            )),
          ],
        ),
      ),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index
              ? Colors.deepOrange
              : Colors.deepOrange.shade100,
          shape: BoxShape.circle),
    );
  });
}
