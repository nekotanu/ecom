import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Bottomnavbar extends StatefulWidget {
  final PageController controller;
  const Bottomnavbar({required this.controller, super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              controller: widget.controller,
              count: 5,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.purple,
                dotColor: Colors.grey.shade400,
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 3,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                widget.controller.nextPage(
                    duration: Durations.medium2, curve: Curves.easeInOut);
              },
              backgroundColor: Colors.purple,
              child: Icon(Icons.arrow_forward_ios),
            )
          ],
        ));
  }
}
