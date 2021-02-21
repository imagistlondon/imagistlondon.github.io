import 'dart:async';

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

  // progress bar fraction
  final ValueNotifier<double> progressFractionVN = ValueNotifier(0.0);

  Timer timerBarInitialLoadFake;
  Timer timerBarCloseDelay;
  Timer timerFinalizeDelay;

  @override
  void dispose() {
    super.dispose();
    if (timerBarInitialLoadFake != null) {
      timerBarInitialLoadFake.cancel();
      timerBarInitialLoadFake = null;
    }
    if (timerBarCloseDelay != null) {
      timerBarCloseDelay.cancel();
      timerBarCloseDelay = null;
    }
    if (timerFinalizeDelay != null) {
      timerFinalizeDelay.cancel();
      timerFinalizeDelay = null;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void loadContent(final BuildContext context) async {
    // slowly increase the progress bar
    timerBarInitialLoadFake =
        Timer.periodic(Design.LOADING_BAR_INITIAL_LOAD_FAKE_DURATION, (t) {
      // limit to a maximum
      if (progressFractionVN.value < Design.LOADING_BAR_INITIAL_LOAD_FAKE_MAX) {
        // increment
        progressFractionVN.value = progressFractionVN.value +
            Design.LOADING_BAR_INITIAL_LOAD_FAKE_INCREMENT;
      }
    });

    // load
    contentVN.value = await Content.load();
    print('App.loadContent.api.done');

    // calculate remaining progress
    final double remainingProgess = 1 - progressFractionVN.value;

    // calculate each project progress value
    final double projectProgessValue =
        (1 / contentVN.value.PROJECTS.length) * remainingProgess;

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

      // increment progress
      progressFractionVN.value = progressFractionVN.value + projectProgessValue;
    }
    print('App.loadContent.images.done');

    // stop the initial load faker
    timerBarInitialLoadFake.cancel();
    timerBarInitialLoadFake = null;

    // delay removal of progress bar
    timerBarCloseDelay = Timer(Design.LOADING_BAR_CLOSE_DELAY_DURATION, () {
      print('App.loadContent.progress.close');
      progressFractionVN.value = null;
    });

    // delay closing loading to allow content to draw behind
    timerFinalizeDelay = Timer(Design.LOADING_FINALIZE_DELAY, () {
      print('App.loadContent.loading.close');
      loadingVN.value = false;
    });

    print('App.loadContent.done');
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
                progressFractionVN: progressFractionVN,
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
