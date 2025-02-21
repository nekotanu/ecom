// ignore: file_names
import 'package:ecom2/screens/notification.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Bottomnavbar extends StatefulWidget {
  final PageController controller;
  const Bottomnavbar({required this.controller, super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  final _count = 5;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              controller: widget.controller,
              count: _count,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.purpleAccent,
                dotColor: Colors.grey.shade400,
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 3,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                if (_count == 5) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationScreen(),
                      ));
                } else {
                  widget.controller.nextPage(
                      duration: Durations.medium2, curve: Curves.easeInOut);
                }
              },
              shape: CircleBorder(side: BorderSide.none, eccentricity: 0.9),
              backgroundColor: Colors.purpleAccent,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            )
          ],
        ));
  }
}
