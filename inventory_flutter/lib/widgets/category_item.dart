import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String name;

  CategoryItem(this.id, this.name);

  void selectCategory(BuildContext ctx) async {
    final prefs = await SharedPreferences.getInstance();
    // Remove data for the 'counter' key.
    Provider.of<Auth>(ctx, listen: false).logout();
    await prefs.remove('token');
    print('test-------6666-------------------');
    // print(token1);
    print('test---------6666-----------------');
    // final success = await prefs.remove('token');
    // final String token = prefs.getString('token');
    print('test-------6666-------------------');
    // print(token);
    print('test---------6666-----------------');
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'name': name,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(name,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          // gradient: LinearGradient(
          //   colors: [Colors.purple.withOpacity(0.7), Colors.purple],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
