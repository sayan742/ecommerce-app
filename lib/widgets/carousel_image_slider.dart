import 'package:flutter/material.dart';
import '../providers/dealer_based_products.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<Widget> slideItemBuilder(List<DealerProductItem> image) {
  return [
    Card(
      elevation: 15,
      child: Container(
        child: Image.network(image[0].image),
      ),
    ),
    Card(
      elevation: 15,
      child: Container(
        // child: Image.network(image[1]),
        color: Colors.red,
      ),
    ),
    Card(
      elevation: 15,
      child: Container(
        // child: Image.network(image[2]),
        color: Colors.amber,
      ),
    ),
    Card(
      child: Container(
        color: Colors.black,
      ),
    ),
    Card(
      child: Container(
        // child: Image.memory(image[4]),
        color: Colors.blue,
      ),
    ),
  ];
}

class Carousel extends StatelessWidget {
  final List<DealerProductItem> imageUrl;
  Carousel(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: CarouselSlider(
        items: slideItemBuilder(imageUrl),
        options: CarouselOptions(
          aspectRatio: 2.0,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
