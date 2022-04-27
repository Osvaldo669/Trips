import 'package:flutter/material.dart';
import 'package:flutter_cubit/views/NavPages/bar_item_pages.dart';
import 'package:flutter_cubit/views/NavPages/home_page.dart';
import 'package:flutter_cubit/views/NavPages/my_page.dart';
import 'package:flutter_cubit/views/NavPages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [HomePage(), BarItemPage(), SearchPage(), MyPage()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.deepPurple.shade800,
        unselectedItemColor: Colors.deepPurple.shade200,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 5,
        items: [
          BottomNavigationBarItem(title: Text('Home'), icon: Icon(Icons.apps)),
          BottomNavigationBarItem(
              title: Text('Bar'), icon: Icon(Icons.bar_chart_rounded)),
          BottomNavigationBarItem(
              title: Text('Search'), icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              title: Text('Profile'), icon: Icon(Icons.person))
        ],
      ),
    );
  }
}
