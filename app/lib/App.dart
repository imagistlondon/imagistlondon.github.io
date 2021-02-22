import 'dart:async';

import 'package:app/Index.dart';
import 'package:app/config/Content.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/L1.dart';
import 'package:app/widget/Loading.dart';
import 'package:app/widget/ProgressBar.dart';
import 'package:app/widget/Window.dart';
import 'package:flutter/material.dart';

// App
class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  // loading
  final ValueNotifier<bool> loadingVN = ValueNotifier(true);
  final ValueNotifier<bool> contentCompleteVN = ValueNotifier(false);
  final ValueNotifier<bool> drawCompleteVN = ValueNotifier(false);

  // progress bar fraction
  final ValueNotifier<double> progressFractionVN = ValueNotifier(0.0);

  Timer timerBarDownloadFake;
  Timer timerBarDrawFake;
  Timer timerFinalizeDelay1;
  Timer timerFinalizeDelay2;

  @override
  void dispose() {
    super.dispose();
    if (timerBarDownloadFake != null) {
      timerBarDownloadFake.cancel();
      timerBarDownloadFake = null;
    }
    if (timerBarDrawFake != null) {
      timerBarDrawFake.cancel();
      timerBarDrawFake = null;
    }
    if (timerFinalizeDelay1 != null) {
      timerFinalizeDelay1.cancel();
      timerFinalizeDelay1 = null;
    }
    if (timerFinalizeDelay2 != null) {
      timerFinalizeDelay2.cancel();
      timerFinalizeDelay2 = null;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void loadData(final BuildContext context) async {
    // slowly increase the progress bar
    timerBarDownloadFake =
        Timer.periodic(Design.LOADING_BAR_DOWNLOAD_FAKE_PERIODIC_DURATION, (t) {
      // limit to a maximum
      if (progressFractionVN.value < Design.LOADING_BAR_DOWNLOAD_FAKE_MAX) {
        // increment
        progressFractionVN.value = progressFractionVN.value +
            Design.LOADING_BAR_DOWNLOAD_FAKE_INCREMENT;
      }
    });

    // load content
    await Content.load();
    contentCompleteVN.value = true;

    // calculate remaining progress
    final double remainingProgess =
        Design.LOADING_BAR_DOWNLOAD_FAKE_MAX - progressFractionVN.value;

    // calculate each project progress value
    final double projectProgessValue =
        (1 / Content.data.PROJECTS.length) * remainingProgess;

    // precache images
    for (final Project project in Content.data.PROJECTS) {
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

      // disabled as these will be loaded by the Study widgets anyway
      // studyBlocks (only enabled for the main projects on home and showcase)
      // if (project.home || project.showcase) {
      //   if (project.studyBlocks != null) {
      //     project.studyBlocks.forEach((key, studyBlocks) {
      //       for (final ProjectStudyBlock studyBlock in studyBlocks) {
      //         Images.precache(studyBlock.image, context);
      //       }
      //     });
      //   }
      // }

      // increment progress
      progressFractionVN.value = progressFractionVN.value + projectProgessValue;
    }
    print('App.loadData.images.done');

    // stop the download faker
    timerBarDownloadFake.cancel();
    timerBarDownloadFake = null;

    // slowly increase the progress bar
    timerBarDrawFake =
        Timer.periodic(Design.LOADING_BAR_DRAW_FAKE_PERIODIC_DURATION, (t) {
      // limit to a maximum
      if (progressFractionVN.value < Design.LOADING_BAR_DRAW_FAKE_MAX) {
        // increment
        progressFractionVN.value =
            progressFractionVN.value + Design.LOADING_BAR_DRAW_FAKE_INCREMENT;
      }
    });

    // wait for draw (of Window) to complete
    drawCompleteVN.addListener(() {
      print('App.loadData.drawComplete');

      // max the progress bar
      // progressFractionVN.value = 1;

      // delay 1
      timerFinalizeDelay1 = Timer(Design.LOADING_FINALIZE_DELAY, () {
        print('App.loadData.finalize.delay1');

        // kill timer bar draw
        timerBarDrawFake.cancel();
        timerBarDrawFake = null;

        // move progress bar to end
        progressFractionVN.value = 1;
      });

      // delay 2
      timerFinalizeDelay2 = Timer(
          Duration(
              milliseconds: Design.LOADING_FINALIZE_DELAY.inMilliseconds + 500),
          () {
        print('App.loadData.finalize.delay2');

        // remove progress bar
        progressFractionVN.value = null;

        // remove loading
        loadingVN.value = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // load data
    loadData(context);

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
        return MaterialPageRoute(builder: (context) {
          return Stack(children: <Widget>[
            // WINDOW (listening to content complete)
            L1(contentCompleteVN, (final bool complete) {
              print('App.L1.contentComplete.' + complete.toString());

              // skip if not complete
              if (!complete) return SizedBox.shrink();

              // build window
              return Window(
                  drawCompleteVN: drawCompleteVN,
                  progressFractionVN: progressFractionVN,
                  indexVN: IndexNotifier(initIndex),
                  bulletsEnabledVN: ValueNotifier(initIndex.isWork()),
                  studioEnabledVN: ValueNotifier(false),
                  initStudyKey: initStudyKey);
            }),

            // LOADING
            Loading(loadingVN: loadingVN),

            // PROGRESS BAR
            ProgressBar(
                progressFractionVN: progressFractionVN,
                max: MediaQuery.of(context).size.width)
          ]);
        });
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
