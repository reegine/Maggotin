
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'Screens/Login/login_provider.dart';
import 'app_module.dart';
import 'app_widget.dart';

//the page starts running from this page
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
