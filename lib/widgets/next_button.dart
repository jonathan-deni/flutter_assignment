import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {

  final Function onPressNextButton;

  NextButton({this.onPressNextButton});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: 500,
        height: 60,
        child: RaisedButton(
          onPressed: onPressNextButton,
          child: Text(
            'Next',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
            ),
          ),
        ));
  }
}