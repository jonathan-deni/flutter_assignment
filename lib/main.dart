import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/account.dart';
import 'package:flutter_assignment/pages/confirm_page.dart';
import 'package:flutter_assignment/pages/welcome.dart';
import 'package:flutter_assignment/pages/password.dart';
import 'package:flutter_assignment/pages/personal_info.dart';
import 'package:flutter_assignment/pages/video_call.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
  create: (context) => Account(),
  child:
    MaterialApp(
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => Welcome(),
        '/password': (context) => Password(),
        '/info': (context) => PersonalInfo(),
        '/vcall': (context) => VideoCall(),
        '/confirm': (context) => ConfirmPage()
      },
)


));