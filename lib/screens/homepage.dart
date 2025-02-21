// ignore_for_file: library_private_types_in_public_api

import 'package:ecom2/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecom2/screens/notification.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<Homepage> {
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
                fontWeight: FontWeight.w400,
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
              onPageChanged: (index) {
                setState(() {});
              },
              children: [
                buildPage(
                  "Find the item you’ve been looking for",
                  "Here you’ll see rich varieties of goods, carefully classified for seamless browsing experience.",
                ),
                buildPage(
                  "Get those Shopping bags filled",
                  "Any item you want on your Cart, or save it to your wishlist.",
                ),
                buildPage(
                  "Find the item you’ve been looking for",
                  "Here you will see rich variety of goods, carefully classified for seamless experience.",
                ),
                buildPage(
                  "Purchase Tracking",
                  "Get updates on your orders.",
                ),
                buildPage(
                  "Find the item you have been looking for!",
                  "Here you’ll see rich varieties of goods, carefully classified for seamless browsing experience.",
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
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/5.jpg', height: 200),
          SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'GrandisExtended',
            ),
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
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
