import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Category {
  final String id;
  final String name;
  final String color;

  Category({
    @required this.id,
    @required this.name,
    @required this.color,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'], name: json['name'], color: json['color'] ?? "");
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = {};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

class Categories with ChangeNotifier {
  List<Category> _categories = [];

  List<Category> get items {
    print('getter');
    print(_categories);
    return [..._categories];
  }

  Future<void> fetchAndSetCategories() async {
    Category result;
    print('runing');
    final url = Uri.parse('http://127.0.0.1:8000/api/categories');
    print('runing2');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    // final url = Uri.https('http://127.0.0.1:8000/api', '/categories');
    final response = await http.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      print(response);
      print('besmalla');
      final item = json.decode(response.body) as List;
      final List<Category> loadedCats = [];
      // _categories = item;
      // print(_categories);
      item.forEach((element) {
        loadedCats.add(Category(
            id: element['id'].toString(), name: element['name'], color: element['color']));
      });
      print('from future');
      _categories = loadedCats;
      print('tesia');
      print(_categories);
      print(loadedCats);

    } else {
      print('not found');
    }
 
    notifyListeners();
  }
}
