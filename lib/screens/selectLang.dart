import 'package:flutter/material.dart';

class Selectlang extends StatefulWidget {
  const Selectlang({super.key});

  @override
  State<Selectlang> createState() => _SelectlangState();
}

class _SelectlangState extends State<Selectlang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Select your preffered language',
            style: TextStyle(
                fontFamily: 'GrandisExtended', fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }
}
