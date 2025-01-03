import 'dart:convert';
import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class RegisterProvider with ChangeNotifier {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get usernameController => _usernameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  Future<void> registerUser() async {
    print(_usernameController.text);
    print(_emailController.text);
    print(_passwordController.text);
    final url = Uri.parse('http://192.168.1.9:8000/api/register/');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': _usernameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 201) {
      AsukaSnackbar.success('Registration successful').show();
      print('udh ke regis');
      _usernameController.clear();
      _emailController.clear();
      _passwordController.clear();
      Modular.to.pushNamed('/login');
    } else {
      AsukaSnackbar.alert('Registration failed').show();
      print('blm ke regis');
    }
  }

  void loginPage() {
    // Modular.to.pushNamed('/');
    Modular.to.navigate('/login');
  }

}
