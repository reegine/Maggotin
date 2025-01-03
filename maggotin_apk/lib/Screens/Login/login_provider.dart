import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginProvider with ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  // Future<void> checkLogin() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token');
  //   if (token != null) {
  //     Modular.to.pushNamed('/navigationPage');
  //   } else {
  //     Modular.to.pushNamed('/');
  //   }
  // }

  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      // Token exists, navigate to home page
      Modular.to.pushNamed('/navigationPage');
    } else {
      // No token, navigate to login page
      Modular.to.pushNamed('/login');
    }
  }

  // Future<void> login() async {
  //   print(_emailController.text);
  //   print(_passwordController.text);
  //   try {
  //     final response = await http.post(
  //       Uri.parse('http://192.168.1.9:8000/api/login/'),
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode({
  //         'email': _emailController.text,
  //         'password': _passwordController.text,
  //       }),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       final prefs = await SharedPreferences.getInstance();
  //       await prefs.setString('access', data['access']);
  //       await prefs.setString('refresh', data['refresh']);
  //       print('Access Token: ${prefs.getString('access')}');
  //       print('Refresh Token: ${prefs.getString('refresh')}');
  //       Modular.to.pushNamed('/navigationPage');
  //     } else {
  //       _showError('Invalid credentials');
  //     }
  //   } catch (e) {
  //     _showError('An error occurred. Please try again.');
  //   }
  // }

  Future<void> login() async {
    print(_emailController.text);
    print(_passwordController.text);
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.9:8000/api/login/'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final prefs = await SharedPreferences.getInstance();
        // Check if the tokens are present in the response
        if (data['access'] != null) {
          print('Access Token: ${data['access']}'); // Debug print
          await prefs.setString('token', data['access']);
          print('Token stored: ${prefs.getString('token')}'); // Debug print
          _emailController.clear();
          _passwordController.clear();
          Modular.to.navigate('/navigationPage');
        } else {
          _showError('Access token is null');
        }
      } else {
        print('Response body: ${response.body}'); // Print the response body
        _showError('Invalid credentials');
      }
    } catch (e) {
      print('Error: $e'); // Print the error message
      _showError('An error occurred. Please try again.');
    }
  }


  void registerPage() {
    // Modular.to.pushNamed('/home');
    Modular.to.navigate('/register');
  }

  void _showError(String message) {
    AsukaSnackbar.alert(message).show();
  }
}
