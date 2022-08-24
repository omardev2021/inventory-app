import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  bool auth = false;

  String get token {
    return _token;
  }

  bool get isAuth {
    return _token != null;
  }

  void logout() async {
    _token = '';
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString('token', '');
    // Remove data for the 'counter' key.
    // await prefs.remove('token');
  }

  Future<void> login(String email, String password) async {
    Map data = {'email': email, 'password': password};
    // late SharedPreferences logindata;
    //   logindata = await SharedPreferences.getInstance();

    final url = Uri.parse('http://127.0.0.1:8000/api/login');
    print('runing2');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      // 'Accept': 'application/json'
    };
    try {
      final response = await http.post(url,
          headers: requestHeaders, body: json.encode(data));

      if (response.statusCode == 201) {
        print('done!!');
        // Obtain shared preferences.

        final item = json.decode(response.body) as Map;
        print(item['token']);
        _token = item['token'];

        print(item);
      }
      if (response.statusCode == 401 || response.statusCode == 302) {
        auth = true;
        print('here');
      } else {
        print(response.statusCode);
        // throw Exception('Failed to update a case');
      }
      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setString('token', _token);
      notifyListeners();
    } catch (error) {
      throw error;
    }
    // fetchAndSetProducts();
  }

  Future<void> register(String name, String email, String password) async {
    Map data = {'name': name, 'email': email, 'password': password};

    // final Response response = await put(
    //   '$apiUrl/$id',
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(data),
    // );
    final url = Uri.parse('http://127.0.0.1:8000/api/register');
    print('runing2');
    Map<String, String> requestHeaders = {
      // 'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    // final url = Uri.https('http://127.0.0.1:8000/api', '/categories');

    final response = await http.post(url, headers: requestHeaders, body: data);

    if (response.statusCode == 201) {
      print('done!!');
      // Obtain shared preferences.

      final item = json.decode(response.body) as Map;
      print(item['token']);
      _token = item['token'];

      print(item);
    } else {
      throw Exception('Failed to update a case');
    }
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString('token', _token);
    notifyListeners();
    // fetchAndSetProducts();
  }
}
