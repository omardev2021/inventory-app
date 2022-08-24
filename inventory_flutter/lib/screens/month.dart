import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../screens/filters_screen.dart';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Month extends StatefulWidget {
  static const routeName = '/category-meals';

  Month();

  @override
  _MonthState createState() => _MonthState();
}

class _MonthState extends State<Month> {
  String categoryTitle;
  List<Product> displayedProducts;
  // var _loadedInitData = false;

  var _isInit = true;
  var _isLoading = false;

  void _setFilters() {
    setState(() {});
  }

  bool _glutenFree;
  bool _lactoseFree;
  bool _vegan;
  bool _vegetarian;

  @override
  void initState() {
    Map<String, bool> _filters = {
      'gluten': false,
      'lactose': false,
      'vegan': false,
      'vegetarian': false,
    };
    final Map<String, bool> currentFilters = FiltersScreen(_filters,
            _setFilters, _glutenFree, _lactoseFree, _vegan, _vegetarian)
        .currentFilters;
    print(currentFilters);

    FiltersScreen(
        _filters, _setFilters, _glutenFree, _lactoseFree, _vegan, _vegetarian);
    print(_glutenFree);
    print(_vegan);
    print(_lactoseFree);
    print(_filters);

    // ...
    Provider.of<Products>(context, listen: false).fetchMonth().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   // if (_isInit) {
  //   //   setState(() {
  //   //     _isLoading = true;
  //   //   });

  //   }
  // if (!_loadedInitData) {

  // final routeArgs =
  //     ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
  // categoryTitle = routeArgs['name'];
  // final categoryId = routeArgs['id'];
  // displayedProducts = displayedProducts.where((meal) {
  //   return meal.category.contains(categoryId);
  // //     final CatsData = Provider.of<Products>(context);
  // // final products = CatsData.items;
  // }).toList();
  // _loadedInitData = true;

  // }

  // super.didChangeDependencies();
  // }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     // displayedMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final CatsData = Provider.of<Products>(context);
    final products = CatsData.itemsMonth.toList();
    displayedProducts = products;

    // final todo = ModalRoute.of(context).settings.arguments as Map;
    // var a = todo.toString;
    // var cat = todo['id'];
    // var prod = products.where((prod) {
    //   return prod.category == cat;
    // }).toList();
    // final Map<String, bool> test = prod;
    // var asd
    // var decodedJson = json.decode(todo);

    return Scaffold(
      appBar: AppBar(
        title: Text('default'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          // return MealItem(
          //   id: products[index].id ?? 'default',
          //   name: displayedProducts[index].name ?? 'default',
          //   desciption: displayedProducts[index].desciption ?? 'default',
          //   image_url: displayedProducts[index].image_url ?? 'default',
          //   quantity: displayedProducts[index].quantity ?? 'default',
          //   exp_date: displayedProducts[index].exp_date ?? 'default',
          // );
          print('hhh');
          print(displayedProducts);

          return MealItem(
            id: displayedProducts[index].id ?? 'default',
            name: displayedProducts[index].name ?? 'default',
            desciption: displayedProducts[index].desciption ?? 'default',
            image_url: displayedProducts[index].image_url ?? 'default',
            quantity: displayedProducts[index].quantity ?? 'default',
            exp_date: displayedProducts[index].exp_date ?? 'default',
            price: displayedProducts[index].price ?? 'default',
          );
        },
        itemCount: displayedProducts.length,
      ),
    );
  }
}
