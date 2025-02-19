import 'package:ecom2/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<Homepage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
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
                setState(() {
                  _currentIndex = index;
                });
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
