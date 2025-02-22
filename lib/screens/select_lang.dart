import 'package:country_picker_pro/country_picker_pro.dart';
import 'package:ecom2/screens/homepage.dart';
import 'package:ecom2/screens/login.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Selectlang extends StatefulWidget {
  const Selectlang({super.key});

  @override
  State<Selectlang> createState() => _SelectlangState();
}

class _SelectlangState extends State<Selectlang> {
  CountryProvider countryProvider = CountryProvider();
  List<Country>? countries;
  Country? selectedCountry;

  @override
  void initState() {
    super.initState();
    loadcountry();
  }

  void loadcountry() async {
    countries = countryProvider.getAll();
    setState(() {});
  }

  Future<void> saveCity() async {
    if (selectedCountry == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedcity', selectedCountry!.displayName);
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Select your preferred language',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontFamily: 'GrandisExtended',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Text(
                      'It will be used throughout the app',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontFamily: 'GrandisExtended',
                      ),
                    ),
                    SizedBox(height: 15),
                    if (countries == null)
                      const Center(child: CircularProgressIndicator())
                    else
                      DropdownButton<Country>(
                        value: selectedCountry,
                        items: countries!.map((country) {
                          return DropdownMenuItem(
                            value: country,
                            child: Text(country.displayName),
                          );
                        }).toList(),
                        onChanged: (Country? newCountry) {
                          setState(() {
                            selectedCountry = newCountry;
                          });
                          if (newCountry != null) saveCity();
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
