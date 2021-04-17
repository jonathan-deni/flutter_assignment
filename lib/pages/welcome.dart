import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/account.dart';
import 'package:flutter_assignment/widgets/next_button.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final formKey = GlobalKey<FormState>();
  final account = Account();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blueAccent[400]),
        backgroundColor: Colors.grey[200],
        body: SafeArea(
            child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                      Text('STEP 1 OF 5')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 60.0,
                    ),
                    Container(
                      width: 230,
                      child: RichText(
                        text: TextSpan(
                            text: 'Welcome to GIN ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40.0,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Finans',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent[400]))
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 400,
                      child:Text(
                          'Welcome to The Bank of The Future Manage and track your accounts on the go',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0
                          )
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Builder(
                      builder: (context) => Form(
                        key: formKey,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.white,
                              width: 15,
                            ),

                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  icon: Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                  border: InputBorder.none,
                                ),
                                validator: (String value) {
                                  // Pattern pattern = '/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+/';
                                  // RegExp regex = new RegExp(pattern)
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  } else if (!value.contains('@')) {
                                    return 'Please enter valid email address';
                                  }
                                  // else if (!regex.hasMatch(value)) {
                                  //   return 'Please enter valid email address';
                                  // }
                                  else {
                                    return null;
                                  }
                                },
                                onSaved: (val) => setState(() => account.email = val)),

                          )
                                                  ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    NextButton(
                      onPressNextButton: () {
                        final form = formKey.currentState;
                        if (form.validate()) {
                          form.save();
                          Navigator.pushNamed(context, '/password');
                        }
                      }
                    ),
                  ],
                )
              ],
            )
        )));
  }
}
