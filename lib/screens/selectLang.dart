// ignore: file_names
import 'package:country_picker_pro/country_picker_pro.dart';
import 'package:ecom2/screens/homepage.dart';
import 'package:flutter/material.dart';

class Selectlang extends StatefulWidget {
  const Selectlang({super.key});

  @override
  State<Selectlang> createState() => _SelectlangState();
}

class _SelectlangState extends State<Selectlang> {
  CountryProvider countryProvider = CountryProvider();
  List<Country>? countries;
  @override
  void initState() {
    super.initState();
    loadcountry();
  }

  void loadcountry() async {
    countries = await countryProvider.getAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homepage(),
                  ));
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Select your preffered language',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: 'GrandisExtended',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text('It will be used throughout the app'),
              if (countries == null)
                const Center(child: CircularProgressIndicator())
              else
                DropdownButton<Country>(
                  items: countries!.map((country) {
                    return DropdownMenuItem(
                      value: country,
                      child: Text(country.displayName),
                    );
                  }).toList(),
                  onChanged: (selectedCountry) {
                    debugPrint(
                        'Selected Country: ${selectedCountry?.displayName}');
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
