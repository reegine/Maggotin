import 'package:flutter_modular/flutter_modular.dart';
import 'package:maggotin_dev/Screens/Article/article.dart';
import 'package:maggotin_dev/Screens/Home/home.dart';
import 'package:maggotin_dev/Screens/Profile/profile.dart';
import 'package:maggotin_dev/Screens/splash.dart';

import 'Screens/Article/article_provider.dart';
import 'Screens/Blank/blank.dart';
import 'Screens/Blank/blank_provider.dart';
import 'Screens/Home/home_provider.dart';
import 'Screens/Login/login.dart';
import 'Screens/Login/login_provider.dart';
import 'Screens/Profile/profile_provider.dart';
import 'Screens/Register/register.dart';
import 'Screens/Register/register_provider.dart';
import 'Screens/navigation_bar.dart';


//this file is dedicated for routing between pages, and adding a provider so each page can access a certain provider
class AppModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(LoginProvider.new);
    i.addSingleton(HomeProvider.new);
    i.addSingleton(ArticleProvider.new);
    i.addSingleton(BlankProvider.new);
    i.addSingleton(ProfileProvider.new);
    i.addSingleton(RegisterProvider.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => SplashScreen(), transition: TransitionType.rightToLeftWithFade);
    r.child('/login', child: (context) => LoginScreen(), transition: TransitionType.rightToLeftWithFade);
    r.child('/home', child: (context) => const HomeScreen(), transition: TransitionType.rightToLeftWithFade);
    r.child('/navigationPage', child: (context) => const navigationPage(), transition: TransitionType.rightToLeftWithFade);
    r.child('/article', child: (context) => const ArticleScreen(), transition: TransitionType.rightToLeftWithFade);
    r.child('/blank', child: (context) => const BlankScreen(), transition: TransitionType.rightToLeftWithFade);
    r.child('/profile', child: (context) => ProfileScreen(), transition: TransitionType.rightToLeftWithFade);
    r.child('/register', child: (context) => RegisterScreen());
    // r.child('/forgot-password', child: (context) => const ForgotPasswordScreen());
  }
}
