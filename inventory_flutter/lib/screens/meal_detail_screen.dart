import 'package:flutter/material.dart';

import '../dummy_data.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

import '../screens/form_screen.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          )),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final CatsData = Provider.of<Products>(context);
    final products = CatsData.items;
    // final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = products.firstWhere((meal) => meal.id == mealId);
    final name = selectedMeal.name;

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.name}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Navigator.of(context).pushNamed(
                FormScreen.routeName,
                arguments: {'product': selectedMeal},
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.image_url,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Product Title'),

            // ListView(
            // children: [
            Card(
              color: Theme.of(context).accentColor,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(selectedMeal.name)),
            ),

            buildSectionTitle(context, 'Desription'),

            // ListView(
            // children: [
            Card(
              color: Theme.of(context).accentColor,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(selectedMeal.desciption)),
            ),
            // ],
            // ),

            buildSectionTitle(context, 'Quantity'),

            // ListView(
            // children: [
            Card(
              color: Theme.of(context).accentColor,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(selectedMeal.quantity)),
            ),
            buildSectionTitle(context, 'Price'),

            // ListView(
            // children: [
            Card(
              color: Theme.of(context).accentColor,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(selectedMeal.price)),
            ),
            buildSectionTitle(context, 'Expiration Date'),

            // ListView(
            // children: [
            Card(
              color: Theme.of(context).accentColor,
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(selectedMeal.exp_date)),
            ),
          ],
        ),
      ),
    );
  }
}
