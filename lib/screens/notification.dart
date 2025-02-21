import 'package:ecom2/screens/select_lang.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Selectlang(),
                  ));
            },
            child: Text(
              'Skip',
              style: TextStyle(
                fontFamily: 'GrandisExtended',
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset("assets/images/noti.jpg"),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Get notified about latest updates and stay updated!',
                style: TextStyle(
                  fontFamily: 'GrandisExtended',
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Happy shopping :)',
                style: TextStyle(
                    fontFamily: 'GrandisExtended',
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    textBaseline: TextBaseline.alphabetic),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Notifications'),
                  Switch(
                      value: light,
                      activeColor: Colors.purpleAccent,
                      onChanged: (bool value) {
                        setState(() {
                          light = value;
                        });
                      })
                ],
              ),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Selectlang(),
                    ));
              },
              child: Text(
                'Next',
                style: TextStyle(
                  fontFamily: 'GrandisExtended',
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ))
        ],
      ),
    );
  }
}
