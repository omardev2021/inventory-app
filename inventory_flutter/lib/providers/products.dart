import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// FiltersScreen filers = FiltersScreen(this.currentFilters, this.saveFilters);

class Product {
  final String id;
  final String name;
  final String desciption;
  final String image_url;
  final String exp_date;
  final String quantity;
  final String category;
  final String price;

  Product(
      {@required this.id,
      @required this.name,
      @required this.desciption,
      this.image_url,
      this.exp_date,
      @required this.quantity,
      this.category,
      this.price});

  // factory Category.fromJson(Map<String, dynamic> json) {
  //   return Category(
  //       id: json['id'], name: json['name'], color: json['color'] ?? "");
  // }
}

class Products with ChangeNotifier {
  List<Product> _products = [];
  List<Product> _productsMonth = [];

  List<Product> get items {
    print('getter');
    print(_products);
    return [..._products];
  }

  List<Product> get itemsMonth {
    print('getter');
    print(_products);
    return [..._products];
  }

  List<Product> get itemsTreeMonth {
    print('getter');
    print(_products);
    return [..._products];
  }

  List<Product> get itemsSixMonth {
    print('getter');
    print(_products);
    return [..._products];
  }

  List<Product> get itemsYear {
    print('getter');
    print(_products);
    return [..._products];
  }

  List<Product> get itemsExpired {
    print('getter');
    print(_products);
    return [..._products];
  }

  Future<void> fetchAndSetProducts() async {
    Product result;
    print('runing');
    final url = Uri.parse('http://127.0.0.1:8000/api/products');
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
      final List<Product> loadedPro = [];
      // _categories = item;
      // print(_categories);
      item.forEach((element) {
        loadedPro.add(Product(
          id: element['id'].toString(),
          name: element['name'],
          desciption: element['desciption'],
          image_url: element['image_url'],
          exp_date: element['exp_date'],
          category: element['category_id'].toString(),
          quantity: element['quantity'],
          price: element['price'],
        ));
      });
      print('from future');
      _products = loadedPro;
      print('tesia');
      print(_products);
      print(loadedPro);
      // extractedData.forEach((orderId, orderData) {
      //   loadedCats.add(
      //     Category(
      //       id: orderData['id'],
      //       name: orderData['name'],
      //     ),
      //   );
      // });
      // result = Category.fromJson(item);

      // print(item);
      // final st = item.toString();

      // print(st);

      // result = Category.fromJson(item);
      // print(result);
    } else {
      print('not found');
    }
    // print('null1');
    // print(response.body);
    // final List<Category> loadedCats = [];
    // final extractedData = json.decode(response.body);

    // if (extractedData == null) {
    //   print('null');
    //   return;
    // }
    // print('nullyyy');
    // print(extractedData);
    // extractedData.forEach((orderId, orderData) {
    //   loadedCats.add(
    //     Category(
    //       id: orderData['id'],
    //       name: orderData['name'],
    //     ),
    //   );
    // });
    // _categories = loadedCats.reversed.toList();
  }

  Future<void> fetchMonth() async {
    Product result;
    print('runing');
    final url = Uri.parse('http://127.0.0.1:8000/api/products/month');
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
      final List<Product> loadedPro = [];
      // _categories = item;
      // print(_categories);
      item.forEach((element) {
        loadedPro.add(Product(
          id: element['id'].toString(),
          name: element['name'],
          desciption: element['desciption'],
          image_url: element['image_url'],
          exp_date: element['exp_date'],
          category: element['category_id'].toString(),
          quantity: element['quantity'],
          price: element['price'],
        ));
      });
      print('from future');
      _products = loadedPro;
      print('tesia');
      print(_products);
      print(loadedPro);
    } else {
      print('not found');
    }
  }

  Future<void> fetchThreeMonth() async {
    Product result;
    print('runing');
    final url = Uri.parse('http://127.0.0.1:8000/api/products/three-month');
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
      final List<Product> loadedPro = [];
      // _categories = item;
      // print(_categories);
      item.forEach((element) {
        loadedPro.add(Product(
            id: element['id'].toString(),
            name: element['name'],
            desciption: element['desciption'],
            image_url: element['image_url'],
            exp_date: element['exp_date'],
            category: element['category_id'].toString(),
            price: element['price'],
            quantity: element['quantity']));
      });
      print('from future');
      _products = loadedPro;
      print('tesia');
      print(_products);
      print(loadedPro);
    } else {
      print('not found');
    }
  }

  Future<void> fetchSixMonth() async {
    Product result;
    print('runing');
    final url = Uri.parse('http://127.0.0.1:8000/api/products/six-month');
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
      final List<Product> loadedPro = [];
      // _categories = item;
      // print(_categories);
      item.forEach((element) {
        loadedPro.add(Product(
            id: element['id'].toString(),
            name: element['name'],
            desciption: element['desciption'],
            image_url: element['image_url'],
            exp_date: element['exp_date'],
            price: element['price'],
            category: element['category_id'].toString(),
            quantity: element['quantity']));
      });
      print('from future');
      _products = loadedPro;
      print('tesia');
      print(_products);
      print(loadedPro);
    } else {
      print('not found');
    }
  }

  Future<void> fetchYear() async {
    Product result;
    print('runing');
    final url = Uri.parse('http://127.0.0.1:8000/api/products/year');
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
      final List<Product> loadedPro = [];
      // _categories = item;
      // print(_categories);
      item.forEach((element) {
        loadedPro.add(Product(
            id: element['id'].toString(),
            name: element['name'],
            desciption: element['desciption'],
            image_url: element['image_url'],
            exp_date: element['exp_date'],
            price: element['price'],
            category: element['category_id'].toString(),
            quantity: element['quantity']));
      });
      print('from future');
      _products = loadedPro;
      print('tesia');
      print(_products);
      print(loadedPro);
    } else {
      print('not found');
    }
  }

  Future<void> expired() async {
    Product result;
    print('runing');
    final url = Uri.parse('http://127.0.0.1:8000/api/products/expired');
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
      final List<Product> loadedPro = [];
      // _categories = item;
      // print(_categories);
      item.forEach((element) {
        loadedPro.add(Product(
            id: element['id'].toString(),
            name: element['name'],
            desciption: element['desciption'],
            image_url: element['image_url'],
            exp_date: element['exp_date'],
            price: element['price'],
            category: element['category_id'].toString(),
            quantity: element['quantity']));
      });
      print('from future');
      _products = loadedPro;
      print('tesia');
      print(_products);
      print(loadedPro);
    } else {
      print('not found');
    }
  }

  Future<Products> updateProducts(String id, Product product) async {
    Map data = {
      'name': product.name,
      'desciption': product.desciption,
      // 'image_url': product.image_url,
      // 'exp_date': product.exp_date,
      'quantity': product.quantity,
      'price': product.price
    };

    // final Response response = await put(
    //   '$apiUrl/$id',
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(data),
    // );
    final url = Uri.parse('http://127.0.0.1:8000/api/products/$id');
    print('runing2');
    Map<String, String> requestHeaders = {
      // 'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    // final url = Uri.https('http://127.0.0.1:8000/api', '/categories');
    final response = await http.put(url, headers: requestHeaders, body: data);

    if (response.statusCode == 200) {
      print('done!!');
    } else {
      throw Exception('Failed to update a case');
    }
    notifyListeners();
    // fetchAndSetProducts();
  }
}
