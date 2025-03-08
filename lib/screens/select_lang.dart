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
    loadCountry();
  }

  void loadCountry() async {
    countries = countryProvider.getAll();
    setState(() {});
  }

  Future<void> saveCity() async {
    if (selectedCountry == null) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedcity', selectedCountry!.displayName);
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
          icon: Icon(Icons.arrow_back_ios,
              color: Theme.of(context).iconTheme.color),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select your preferred language',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontFamily: 'GrandisExtended',
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 5),
              Text(
                'It will be used throughout the app',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontFamily: 'GrandisExtended',
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          // ignore: deprecated_member_use
                          .withOpacity(0.6),
                    ),
              ),
              const SizedBox(height: 15),
              if (countries == null)
                const Center(child: CircularProgressIndicator())
              else
                DropdownButtonFormField<Country>(
                  value: selectedCountry,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                  ),
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
      ),
    );
  }
}
