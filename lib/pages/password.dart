import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/account.dart';
import 'package:flutter_assignment/widgets/next_button.dart';

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final formKey = GlobalKey<FormState>();
  final account = Account();

  bool isPasswordVisible = false;
  bool isLowerCase = false;
  bool isUpperCase = false;
  bool isContainsNumber = false;
  bool isEnoughChar = false;
  bool isValidPassword = false;

  void initState() {
    super.initState();
    isPasswordVisible = false;
    isLowerCase = false;
    isUpperCase = false;
    isContainsNumber = false;
    isEnoughChar = false;
    isValidPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[400],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        title: Text('Create Account'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[Text('STEP 1 OF 5')],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'Create Password',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    'Password will used to login to account',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Builder(
                    builder: (context) => Form(
                      key: formKey,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 10,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              onChanged: (text) {
                                if (text.length > 0) {
                                  bool hasLowerCase =
                                      text != null || text.isEmpty != true;
                                  bool hasUpperCase =
                                      text.contains(new RegExp(r'[A-Z]'));
                                  bool hasNumbers =
                                      text.contains(new RegExp(r'[0-9]'));
                                  bool hasEnoughChar = text.length >= 9;
                                  bool hasValidPassword = hasLowerCase && hasUpperCase && hasNumbers && hasEnoughChar;

                                  setState(() {
                                    isLowerCase = hasLowerCase;
                                    isUpperCase = hasUpperCase;
                                    isContainsNumber = hasNumbers;
                                    isEnoughChar = hasEnoughChar;
                                    isValidPassword = hasValidPassword;
                                  });
                                } else {
                                  setState(() {
                                    isLowerCase = false;
                                    isUpperCase = false;
                                    isContainsNumber = false;
                                    isEnoughChar = false;
                                    isValidPassword = false;
                                  });
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Create Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.blueAccent,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isPasswordVisible = !isPasswordVisible;
                                    });
                                    print(isPasswordVisible);
                                  },
                                ),
                                border: InputBorder.none,
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onSaved: (val) =>
                                  setState(() => account.password = val),
                              obscureText: !isPasswordVisible,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text('Complexity:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        isLowerCase
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.amber,
                              )
                            : Text('a',
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.white,
                                )),
                        Text('Lowercase',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        isUpperCase
                            ? Icon(
                          Icons.check_circle,
                          color: Colors.amber,
                        )
                            : Text('A',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                            )),
                        Text('Uppercase',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        isContainsNumber
                            ? Icon(
                          Icons.check_circle,
                          color: Colors.amber,
                        )
                            : Text('123',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                            )),
                        Text('Number',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        isEnoughChar
                            ? Icon(
                          Icons.check_circle,
                          color: Colors.amber,
                        )
                            : Text('9+',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                            )),
                        Text('Characters',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ))
                      ]),
                ],
              ),
              Column(
                children: <Widget>[
                  NextButton(onPressNextButton: () {
                    final form = formKey.currentState;
                    if (isValidPassword) {
                      form.save();
                      Navigator.pushNamed(context, '/info');
                    }
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
