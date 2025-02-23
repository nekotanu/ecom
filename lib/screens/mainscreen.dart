import 'package:ecom2/screens/shop.dart';
import 'package:ecom2/screens/discover.dart';
import 'package:ecom2/screens/fav.dart';
import 'package:ecom2/screens/cart.dart';
import 'package:ecom2/screens/profile.dart';
import 'package:ecom2/widgets/nav_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> pages = [Shop(), Discover(), Fav(), Cart(), Profile()];

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Name',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'GrandisExtended',
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
      ),
    );
  }
}
