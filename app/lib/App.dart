import 'package:app/Index.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/Window.dart';
import 'package:flutter/material.dart';

// App
class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  // content
  final ValueNotifier<Content> contentVN = ValueNotifier(Content());

  // loading
  final ValueNotifier<bool> loadingVN = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    loadContent();
  }

  void loadContent() async {
    contentVN.value = await Content.load();
    print('App.loadContent.done');
    loadingVN.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TITLE
      title: 'Imagist',

      // ROUTES
      onGenerateRoute: (settings) {
        print('App.onGenerateRoute.init:' + settings.name);

        // define path
        final String path = settings.name;
        final List<String> parts = path.split('/');

        // define initial
        Index initIndex = Index.HOME;
        String initStudyKey;

        // terms
        if (path.startsWith('/terms'))
          initIndex = Index.TERMS;

        // work/showcase
        else if (path.startsWith('/showcase'))
          initIndex = Index.WORK_SHOWCASE;

        // work/archive
        else if (path.startsWith('/archive'))
          initIndex = Index.WORK_ARCHIVE;

        // work/tags
        else if (path.startsWith('/tags'))
          initIndex = Index.WORK_TAGS;

        // study
        else if (path.startsWith('/study')) {
          initIndex = Index.HOME;
          initStudyKey = parts.isNotEmpty ? parts.last : null;
        }

        // build route
        return MaterialPageRoute(
            builder: (context) => Window(
                contentVN: contentVN,
                loadingVN: loadingVN,
                initIndex: initIndex,
                initStudyKey: initStudyKey));
      },

      // THEME
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
