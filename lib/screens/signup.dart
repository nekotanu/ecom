import 'package:ecom2/screens/login.dart';
import 'package:ecom2/screens/terms.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool ischanged = false; // Removed nullability

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // Used ListView instead of Column
          children: [
            Image.asset('assets/images/clothes.jpg'),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Let’s get started!'),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                  'Please enter your valid data in order to create an account'),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                cursorColor: Colors.black,
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: password,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: ischanged,
                  onChanged: (bool? newval) {
                    if (newval != null) {
                      setState(() {
                        ischanged = newval;
                      });
                    }
                  },
                ),
                Text("Accept "),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Terms(),
                          ));
                    },
                    child: Text(
                      'Terms and conditions',
                      style: TextStyle(color: Colors.purpleAccent),
                    ))
              ],
            ),
            ElevatedButton(
              onPressed: ischanged ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
              ),
              child: Text("Continue"),
            ),
            Row(
              children: [
                Text('Have an acoount?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                    child: Text('Login'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
