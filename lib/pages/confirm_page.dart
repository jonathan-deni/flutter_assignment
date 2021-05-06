import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/next_button.dart';
import 'package:flutter_assignment/widgets/progress_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_assignment/models/account.dart';

class ConfirmPage extends StatelessWidget {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Consumer<Account>(builder: (context, account, _) => ProgressWidget(account.progress)),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                        'Confirm your registration data',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.white),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'E-mail',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Consumer<Account>(
                        builder: (context, account, _) => Text(
                          '${account.email}',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Password',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Consumer<Account>(
                        builder: (context, account, _) => Text(
                          '${account.password}',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Goals',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Consumer<Account>(
                        builder: (context, account, _) => Text(
                          '${account.goals}',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Income',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Consumer<Account>(
                        builder: (context, account, _) => Text(
                          '${account.income}',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Expense',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Consumer<Account>(
                        builder: (context, account, _) => Text(
                          '${account.expense}',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Video Call Date',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Consumer<Account>(
                        builder: (context, account, _) => Text(
                          '${DateFormat('EEEE, dd MMMM y').format(account.vCallSchedule).toString()}',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        'Video Call Time',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Consumer<Account>(
                        builder: (context, account, _) => Text(
                          '${DateFormat('jm').format(account.vCallSchedule).toString()}',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                  ]
              ),
              Column(
                  children: <Widget>[
                    NextButton(onPressNextButton: () {})
                  ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
