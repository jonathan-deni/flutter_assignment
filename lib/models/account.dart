import 'package:flutter/cupertino.dart';

class Account extends ChangeNotifier {
  String _email;
  String _password;
  DateTime _vCallSchedule;
  String _goals;
  String _income;
  String _expense;
  int _progress = 0;

  String get email => _email;
  String get password => _password;
  DateTime get vCallSchedule => _vCallSchedule;
  String get goals => _goals;
  String get income => _income;
  String get expense => _expense;
  int get progress => _progress;

  set email(String value) {
    _email = value;
    notifyListeners();
  }
  set password(String value) {
    _password = value;
    notifyListeners();
  }
  set vCallSchedule(DateTime value) {
    _vCallSchedule = value;
    notifyListeners();
  }
  set goals(String value) {
    _goals = value;
    notifyListeners();
  }
  set income(String value) {
    _income = value;
    notifyListeners();
  }
  set expense(String value) {
    _expense = value;
    notifyListeners();
  }
  set progress(int value) {
    _progress = value;
    notifyListeners();
  }

  // Account({this.email, this.password, this.vCallDateTime, this.goals, this.income, this.expense, this.progress});

}