import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';
import '../providers/categories.dart';

class CategoriesScreen extends StatefulWidget {
  static const routeName = '/categories';
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    Provider.of<Categories>(context, listen: false)
        .fetchAndSetCategories()
        .then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final CatsData = Provider.of<Categories>(context);
    final products = CatsData.items;

    print('test');
    print(products);

    return GridView(
      padding: const EdgeInsets.all(25),
      children: products
          .map(
            (catData) => CategoryItem(
              catData.id,
              catData.name,
              // catData.color,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
