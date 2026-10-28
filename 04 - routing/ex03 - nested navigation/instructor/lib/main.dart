import 'package:flutter/material.dart';

import 'routes.dart';
import 'pages/home.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        /* I'm now declaring routes by variable name rather than '/some-string'
           which might seem like silly 'bureaucracy' but:
             - simple, descriptive variable names are easier to read than potentially complicated URL paths, and
             - MORE IMPORTANTLY, a typo or issue with a route now becomes a *compile-time* error rather than a runtime one. 
        */
        homeRoute: (context) => const HomePage(),
      },
    );
  }
}
