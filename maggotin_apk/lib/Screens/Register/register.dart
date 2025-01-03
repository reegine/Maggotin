import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'register_provider.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Modular.get<RegisterProvider>();
    final read = context.read<RegisterProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: provider.loginPage,
              child: Text('Back to Home'),
            ),
            TextField(
              controller: read.usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: read.emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              obscureText: false,
            ),
            TextField(
              controller: read.passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: provider.registerUser,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
