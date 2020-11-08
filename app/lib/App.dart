import 'package:app/config/Design.dart';
import 'package:app/page/Main.dart';
import 'package:app/page/TermsPage.dart';
import 'package:app/page/WorkPage.dart';
import 'package:flutter/material.dart';

// App
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imagist',
      routes: {
        '/': (context) => Main(),
        '/work': (context) => WorkPage(),
        '/terms': (context) => TermsPage()
      },
      theme: ThemeData(
          textTheme: TextTheme(
              headline1: Design.X4_H1,
              headline2: Design.X4_H2,
              bodyText1: Design.X4_P),
          fontFamily: 'UntitleSans',
          primaryColor: Design.COLOR,
          backgroundColor: Colors.transparent),
    );
  }
}
