import 'package:flutter/material.dart';
import 'package:flutter_assignment/pages/welcome.dart';
import 'package:flutter_assignment/pages/password.dart';
import 'package:flutter_assignment/pages/personal_info.dart';
import 'package:flutter_assignment/pages/video_call.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/welcome',
  routes: {
    '/welcome': (context) => Welcome(),
    '/password': (context) => Password(),
    '/info': (context) => PersonalInfo(),
    '/vcall': (context) => VideoCall()
  },

));