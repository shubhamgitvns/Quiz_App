import 'package:flutter/material.dart';
import 'stateless.dart';

void main() => runApp( MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => QuizOne(),
    '/second': (context) => MyApp(),
  },
));
