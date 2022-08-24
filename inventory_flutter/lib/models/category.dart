import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Category {
  final int id;
  final String name;
  // final String color;

  const Category({@required this.id, @required this.name});
}

class Categories with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get categories {
    return [..._categories];
  }

  Future<void> fetchAndSetCategories() async {
    final url = Uri.https('http://127.0.0.1:8000/api', '/categories');
    final response = await http.get(url);
    final List<Category> loadedCats = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedCats.add(
        Category(
          id: orderData['id'],
          name: orderData['name'],
        ),
      );
    });
    _categories = loadedCats.reversed.toList();
    notifyListeners();
  }
}
