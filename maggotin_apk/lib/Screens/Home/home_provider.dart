import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeProvider with ChangeNotifier {

  late bool _obscure = true;

  bool get obscure => _obscure;

  set obscure(bool val) {
    _obscure = val;
    notifyListeners();
  }

  void riwayatPage() {
    Modular.to.pushNamed('/riwayatPage');
  }


/*  @override
  void dispose() {
    // TODO: implement dispose
  }*/
}
