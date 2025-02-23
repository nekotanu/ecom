import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const NavBar(
      {super.key, required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: GNav(
        selectedIndex: selectedIndex,
        onTabChange: onTabChange,
        gap: 12,
        tabs: const [
          GButton(icon: Icons.shop, text: 'Shop'),
          GButton(icon: Icons.category, text: 'Discover'),
          GButton(icon: Icons.favorite_border, text: 'Bookmark'),
          GButton(icon: Icons.shopping_bag, text: 'Cart'),
          GButton(icon: Icons.person, text: 'Profile')
        ],
        color: Colors.black,
        activeColor: Colors.purpleAccent,
        tabBackgroundColor: Colors.transparent,
      ),
    );
  }
}
