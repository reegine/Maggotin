import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider with ChangeNotifier {

  late bool _obscure = true;

  bool get obscure => _obscure;

  set obscure(bool val) {
    _obscure = val;
    notifyListeners();
  }

  void riwayatPage() {
    Modular.to.pushNamed('/riwayatPage');
  }

  // Future<void> logout() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('access'); // Remove access token
  //   await prefs.remove('refresh'); // Remove refresh token
  //   Modular.to.pushNamed('/'); // Navigate to login page
  // }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');  // Remove the token
    Modular.to.pushNamed('/login');  // Navigate to login page
  }



/*  @override
  void dispose() {
    // TODO: implement dispose
  }*/
}
