import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DealerProductItem {
  final String id;
  final String title;
  final String description;
  final String image;
  final double price;

  DealerProductItem({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.price,
  });
}

class BigProducts with ChangeNotifier {
  final String authToken;
  BigProducts(this.authToken, this._bigItems);
  List<DealerProductItem> _bigItems = [];

  List<DealerProductItem> get bigItems {
    return [..._bigItems];
  }

  // final authToken;
  // BigProducts(this.authToken);

  Future<void> fetchDealerProducts() async {
    try {
      final url =
          'https://flutter-project-1-2d2d6.firebaseio.com/dealerProducts/.json?auth=$authToken';

      final response = await http.get(url);

      print(json.decode(response.body));
      final responseData = json.decode(response.body) as Map<String, dynamic>;

      final List<DealerProductItem> loadedBigProducts = [];
      if (responseData == null) {
        // return;
      }
      responseData.forEach((prodId, prodData) {
        loadedBigProducts.add(
          DealerProductItem(
            // id: prodId,
            id: prodId,
            title: prodData['title'],
            description: prodData['description'],
            image: prodData['image'],
            price: double.parse(prodData['price'].toString()),
          ),
        );
      });
      print(loadedBigProducts[0].id);
      _bigItems = loadedBigProducts;
      print(loadedBigProducts[0].id);

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
