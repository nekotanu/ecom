// ignore_for_file: library_private_types_in_public_api

import 'package:ecom2/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecom2/screens/notification.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationScreen(),
                  ));
            },
            child: Text(
              'Skip',
              style: TextStyle(
                fontFamily: 'GrandisExtended',
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: [
                buildPage(
                  "Explore a Variety of Items",
                  "Discover a wide range of products, neatly categorized for a seamless shopping experience.",
                ),
                buildPage(
                  "Add to Cart & Wishlist",
                  "Easily add items to your cart or save them to your wishlist for later.",
                ),
                buildPage(
                  "Secure & Easy Payments",
                  "Enjoy a hassle-free checkout experience with multiple payment options.",
                ),
                buildPage(
                  "Track Your Orders",
                  "Stay updated with real-time tracking and order status notifications.",
                ),
                buildPage(
                  "Get Ready to Shop!",
                  "Start exploring and enjoy the best shopping experience with us!",
                ),
              ],
            ),
          ),
          Bottomnavbar(controller: _controller),
        ],
      ),
    );
  }

  Widget buildPage(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/5.jpg', height: 200),
          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'GrandisExtended',
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontFamily: 'PlusJakartaSans',
            ),
          ),
        ],
      ),
    );
  }
}
