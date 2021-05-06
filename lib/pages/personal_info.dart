import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/account.dart';
import 'package:flutter_assignment/widgets/next_button.dart';
import 'package:flutter_assignment/widgets/progress_widget.dart';
import 'package:provider/provider.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final formKey = GlobalKey<FormState>();
  final account = Account();
  final List<String> goalsList = ['Investing', 'Saving', 'Loan'];
  final List<String> incomeList = [
    '< Rp 5.000.000',
    'Rp 5.000.000 - Rp 10.000.000',
    '> Rp 10.000.000'
  ];
  final List<String> expenseList = [
    '< Rp 3.000.000',
    'Rp 3.000.000 - Rp 6.000.000',
    '> Rp 6.000.000'
  ];

  String dropdownValue = 'One';
  String currentGoals;
  String currentIncome;
  String currentExpense;

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
                      'Personal Information',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'Please fill in the information below and your goal for digital saving.',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Consumer<Account>(
                      builder: (context, account, _) => Builder(
                        builder: (context) => Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 10,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Goal for Activation'),
                                    DropdownButtonFormField(
                                      value: currentGoals,
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white)
                                          )
                                      ),
                                      items: goalsList.map((goals) {
                                        return DropdownMenuItem(
                                          value: goals,
                                          child: Text('$goals'),
                                        );
                                      }).toList(),
                                      hint: Text('-Choose Option-'),
                                      disabledHint: Text('-Choose Option-'),
                                      onChanged: (val) => setState(()=> currentGoals = val),
                                      onSaved: (val) => account.goals = val,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 10,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Monthly Income'),
                                    DropdownButtonFormField(
                                      value: currentIncome,
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white)
                                          )
                                      ),
                                      items: incomeList.map((goals) {
                                        return DropdownMenuItem(
                                          value: goals,
                                          child: Text('$goals'),
                                        );
                                      }).toList(),
                                      hint: Text('-Choose Option-'),
                                      disabledHint: Text('-Choose Option-'),
                                      onChanged: (val) => setState(()=>currentIncome = val),
                                      onSaved: (val) => account.income = val,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.0,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 10,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Monthly Expense'),
                                    DropdownButtonFormField(
                                      value: currentExpense,
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: Colors.white)
                                          )
                                      ),
                                      items: expenseList.map((goals) {
                                        return DropdownMenuItem(
                                          value: goals,
                                          child: Text('$goals'),
                                        );
                                      }).toList(),
                                      hint: Text('-Choose Option-'),
                                      disabledHint: Text('-Choose Option-'),
                                      onChanged: (val) => setState(()=>currentExpense = val),
                                      onSaved: (val) => account.expense = val,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Consumer<Account>(
                      builder: (context, account, _) => NextButton(onPressNextButton: () {
                        final form = formKey.currentState;
                        bool validPersonalInfo = (currentGoals != null)  &&
                            (currentIncome != null) &&
                            (currentExpense != null);
                        if (validPersonalInfo) {
                          form.save();
                          if(account.progress <= 2) account.progress += 1;
                          Navigator.pushNamed(context, '/vcall');
                        } else {
                          print('personal info error');
                          showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Personal Information Incomplete'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('Please chose all personal information data needed'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
