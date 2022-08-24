import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:provider/provider.dart';
import '../screens/categories_screen.dart';

class FormScreen extends StatefulWidget {
  static const routeName = '/form';
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  String _name;
  String _quantity;
  String _desciption;
  // String _image_url;
  // String _exp_date;
  String _calories;
  String _price;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName(String value) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Name'),
      maxLength: 10,
      initialValue: value,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
    
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail(String value) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Quantity'),
      initialValue: value,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      // validator: (String value) {
      //   if (value.isEmpty) {
      //     return 'Email is Required';
      //   }

      //   // if (!RegExp(
      //   //         r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
      //   //     .hasMatch(value)) {
      //   //   return 'Please enter a valid email Address';
      //   // }

      //   return null;
      // },
      onSaved: (String value) {
        _quantity = value;
      },
    );
  }

  Widget _buildPassword(String value) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Description'),
      keyboardType: TextInputType.visiblePassword,
      initialValue: value,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _desciption = value;
      },
    );
  }

  // Widget _builURL(String value) {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Product Image Url'),
  //     keyboardType: TextInputType.url,
  //     initialValue: value,
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return 'URL is Required';
  //       }

  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _image_url = value;
  //     },
  //   );
  // }

  // Widget _buildPhoneNumber(String value) {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Product Expiration Date'),
  //     keyboardType: TextInputType.datetime,
  //     initialValue: value,
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return 'Phone number is Required';
  //       }

  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _exp_date = value;
  //     },
  //   );
  // }

  Widget _buildPrice(String value) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Price'),
      keyboardType: TextInputType.datetime,
      initialValue: value,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _price = value;
      },
    );
  }

  // Widget _buildCalories() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Calories'),
  //     keyboardType: TextInputType.number,
  //     validator: (String value) {
  //       int calories = int.tryParse(value);

  //       if (calories == null || calories <= 0) {
  //         return 'Calories must be greater than 0';
  //       }

  //       return null;
  //     },
  //     onSaved: (String value) {
  //       _calories = value;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // Provider.of<Products>(context, listen: false);
    final todo = ModalRoute.of(context).settings.arguments as Map;
    // var a = todo.toString;
    var cat = todo['product'];

    print(cat);
    return Scaffold(
      appBar: AppBar(title: Text("Edit Product Form")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(cat.name),
                _buildEmail(cat.quantity),
                _buildPassword(cat.desciption),
                // _builURL(cat.image_url),
                // _buildPhoneNumber(cat.exp_date),
                _buildPrice(cat.price),
                // _buildCalories(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    print(_name);
                    print(_quantity);
                    // print(_exp_date);
                    // print(_image_url);
                    print(_desciption);
                    print(_calories);
                    Provider.of<Products>(context, listen: false)
                        .updateProducts(
                            cat.id,
                            Product(
                                id: cat.id,
                                name: _name,
                                quantity: _quantity,
                                desciption: _desciption,
                                // image_url: _image_url,
                                // exp_date: _exp_date,
                                price: _price));

                    int count = 0;
                    Navigator.of(context).popUntil((_) => count++ >= 3);

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => CategoriesScreen()),
                    // );

                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => CategoriesScreen()));

                    // api.updateCases(id, Cases(name: _nameController.text, gender: gender, age: int.parse(_ageController.text), address: _addressController.text, city: _cityController.text, country: _countryController.text, status: status));

                    //Send to API
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
