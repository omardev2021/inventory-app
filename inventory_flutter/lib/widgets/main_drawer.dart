import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';
import '../screens/auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/auth.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    final CatsData = Provider.of<Auth>(context);
    // final products = CatsData.items;
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Al-Anfal',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Categories', Icons.category, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          // buildListTile('All Products', Icons.production_quantity_limits, () {
          //   Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          // }),
          buildListTile('Logout', Icons.logout, () async {
            var logindata = await SharedPreferences.getInstance();
            // final String token = prefs.getString('token');
            print('yessssss');
            // print(token);
            //  await CatsData.logout().then((_) {
            //   print('from future');
            //   // print(token);
            // });
            logindata.setBool('login', true);
            // Navigator.pushReplacement(context,
            //     new MaterialPageRoute(builder: (context) => MyLoginPage()));
            Navigator.of(context).pushNamed('/auth');
            print('yessssss222222');
            await CatsData.logout();
            // final _token = CatsData.token;
            // print(token);
            // print(token);
            Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
          }),
        ],
      ),
    );
  }
}
