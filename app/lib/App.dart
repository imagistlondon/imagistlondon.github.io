import 'package:app/Index.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/Window.dart';
import 'package:app/util/Images.dart';
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
  }

  void loadContent(final BuildContext context) async {
    contentVN.value = await Content.load();
    print('App.loadContent.api.done');

    // precache images
    for (final Project project in contentVN.value.PROJECTS) {
      // homeImage
      Images.precache(project.homeImage, context);

      // showcaseImage
      Images.precache(project.showcaseImage, context);

      // archiveImage
      Images.precache(project.archiveImage, context);

      // tagImage
      Images.precache(project.tagImage, context);

      // studyImage
      Images.precache(project.studyImage, context);

      // disabled as it adds too much to intial page download
      // studyBlocks
      // if (project.studyBlocks != null) {
      //   project.studyBlocks.forEach((key, studyBlocks) {
      //     for (final ProjectStudyBlock studyBlock in studyBlocks) {
      //       Images.precache(studyBlock.image, context);
      //     }
      //   });
      // }
    }

    print('App.loadContent.images.done');
    loadingVN.value = false;
  }

  @override
  Widget build(BuildContext context) {
    // load content
    loadContent(context);

    // APP
    return MaterialApp(
      // TITLE
      title: 'Imagist',

      // ROUTES
      onGenerateRoute: (settings) {
        print('App.onGenerateRoute.init:' + settings.name);

        // define path
        final String path = settings.name;
        final List<String> parts = path.split('/');

        final String part1 = parts.length >= 2 ? parts[1] : null;
        final String part2 = parts.length >= 3 ? parts[2] : null;
        final String part3 = parts.length >= 4 ? parts[3] : null;

        // define initial
        Index initIndex = Index.HOME;
        String initStudyKey;

        // terms
        if (part1 == 'terms') initIndex = Index.TERMS;

        // work/showcase
        if (part1 == 'showcase') initIndex = Index.WORK_SHOWCASE;

        // work/archive
        if (part1 == 'archive') initIndex = Index.WORK_ARCHIVE;

        // work/tags
        if (part1 == 'tags') initIndex = Index.WORK_TAGS;

        // study (from /)
        if (part1 == ('study')) {
          initStudyKey = part2;
        }
        // study (from /x)
        if (part2 == ('study')) {
          initStudyKey = part3;
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
              headline1: Design.H1(context),
              headline2: Design.H2(context),
              headline3: Design.H2(context),
              headline4: Design.H2(context),
              headline5: Design.H2(context),
              headline6: Design.H2(context),
              subtitle1: Design.H2(context),
              subtitle2: Design.H2(context),
              bodyText1: Design.X4_P,
              bodyText2: Design.X4_P),
          fontFamily: 'UntitleSans',
          primaryColor: Design.COLOR,
          backgroundColor: Colors.transparent),
    );
  }
}
