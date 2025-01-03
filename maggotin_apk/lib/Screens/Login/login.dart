import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'login_provider.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final read = context.read<LoginProvider>();
    LoginProvider provider = Modular.get<LoginProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: read.emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: read.passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: provider.login,
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: provider.registerPage,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
