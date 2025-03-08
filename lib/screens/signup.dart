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
  bool ischanged = false;

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
          children: [
            Image.asset('assets/images/clothes.jpg'),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Let’s get started!',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Please enter your valid data in order to create an account',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                cursorColor: Theme.of(context).colorScheme.primary,
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  prefixIcon: Icon(Icons.email,
                      color: Theme.of(context).colorScheme.primary),
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
                  prefixIcon: Icon(Icons.lock,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: ischanged,
                  activeColor: Theme.of(context).colorScheme.primary,
                  onChanged: (bool? newval) {
                    if (newval != null) {
                      setState(() {
                        ischanged = newval;
                      });
                    }
                  },
                ),
                Text("Accept ", style: Theme.of(context).textTheme.bodyMedium),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Terms()),
                    );
                  },
                  child: Text(
                    'Terms and conditions',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: ischanged ? () {} : null,
              child: Text("Continue"),
            ),
            Row(
              children: [
                Text('Have an account?',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
