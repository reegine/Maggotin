import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maggotin_dev/Screens/Article/article.dart';
import 'package:maggotin_dev/Screens/Blank/blank.dart';
import 'package:maggotin_dev/Screens/Home/home.dart';
import 'package:maggotin_dev/Screens/Profile/profile.dart';

//this file is the file to show the bottom navigation bar that already has each page inside. So if you read the code, its divided into 3 section.
// notificationPage(),Home(title: '',), and Profile(title: '')
void main() => runApp(const navigationPage());

class navigationPage extends StatelessWidget {
  const navigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return const MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const ArticleScreen(),
    const BlankScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0060AF),
        // title: Semantics( // this semantics are user to inform the user who's using talkback. So when they use talkback, the device will read out loud the label
        //   label: "Logo BCA",
        //   enabled: false,
        //   child: const SizedBox(
        //       child : Image(image : AssetImage('assets/logobca.png'))
        //   ),
        // ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
          color: Colors.white,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.book),
                label: 'Article',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.camera),
                label: 'Blank',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: 'Profile',
              ),
            ],
            backgroundColor:const Color(0xFF0060AF),
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.red,
            onTap: _onItemTapped,
            unselectedItemColor: Color(0xFF4C8FC7),
          ),
        ),
      ),
    );
  }
}


