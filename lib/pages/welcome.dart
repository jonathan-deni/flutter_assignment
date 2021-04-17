import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('Welcome to GIN Finans'),
            FlatButton(
              onPressed: () { 
                Navigator.pushNamed(context, '/password');
              },
              child: Text('Next'),
            )
          ],
        ),
      )
    );
  }
}
