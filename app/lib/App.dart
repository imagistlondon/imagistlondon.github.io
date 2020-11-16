import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/page/Main.dart';
import 'package:app/page/TermsPage.dart';
import 'package:app/util/L1.dart';
import 'package:flutter/material.dart';

// App
class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  // content
  final ValueNotifier<Content> contentVN = ValueNotifier(Content());

  @override
  void initState() {
    super.initState();
    loadContent();
  }

  void loadContent() async {
    contentVN.value = await Content.load();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imagist',
      routes: {
        '/': (context) => L1(contentVN, (c) => Main(contentVN: contentVN)),
        '/terms': (context) => TermsPage(contentVN: contentVN)
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
