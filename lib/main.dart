import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pijar/screens/assignment.dart';
import 'package:pijar/screens/e_learning.dart';
import 'package:pijar/screens/home.dart';
import 'package:pijar/screens/login.dart';
import 'package:pijar/screens/logo.dart';
import 'package:pijar/screens/schedule.dart';
import 'package:pijar/screens/score.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Logo(),
    );
  }
}

