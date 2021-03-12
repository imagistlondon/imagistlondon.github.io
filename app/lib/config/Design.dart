import 'package:app/config/Break.dart';
import 'package:flutter/material.dart';

// Definition of all design related information.
//
// - Text styles for the various screen sizes.
// - Default margin and padding.
class Design {
  ///// MAIN

  // default color
  static const Color COLOR = Colors.black;

  // default background color
  static const Color BACKGROUND_COLOR = Color.fromRGBO(250, 250, 250, 1.0);

  // default negative space
  static const double SPACE = 20;

  // max width for section (includes margin)
  static const double SECTION_MAX_WIDTH = 1200;

  // number of units the finger must drag before a swip call-to-action
  static const double SWIPE_THRESHOLD = 30;

  // the margin gutter spacing throughout app
  static const double GAP_X1 = Design.SPACE;
  static const double GAP_X2 = Design.SPACE * 3;
  static const double GAP_X3 = Design.SPACE * 3;
  static const double GAP_X4 = Design.SPACE * 3;

  // margin (negative space of page)
  static double gap(final BuildContext context) {
    return Break.decide(context, GAP_X1, GAP_X2, GAP_X3, GAP_X4);
  }

  // full screen width
  static double screenWidth(final BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // the width percentage of screen
  static double screenWidthPercent(
      final BuildContext context,
      final double widthPercentX1,
      final double widthPercentX2,
      final double widthPercentX3,
      final double widthPercentX4,
      final double defaultWidthPercent) {
    // calculate full width
    final double w = screenWidth(context);

    // pull desired width percent
    double widthPercent = Break.decideOr(context, widthPercentX1,
        widthPercentX2, widthPercentX3, widthPercentX4, defaultWidthPercent);

    // use default width if none
    if (widthPercent == null) return (defaultWidthPercent / 100) * w;

    // use full width if out of range
    if (widthPercent < 0 || widthPercent > 100) return w;

    // use accurate divider for thirds
    if (widthPercent > 33 / 100 && widthPercent < 34 / 100)
      widthPercent = 1 / 3;

    // return width
    return (widthPercent / 100) * w;
  }

  // the width of screen without gap
  static double screenInnerWidth(final BuildContext context) {
    return screenWidth(context) - (gap(context) * 2);
  }

  // the width percentage of screen without gap
  static double screenInnerWidthPercent(
      final BuildContext context,
      final double widthPercentX1,
      final double widthPercentX2,
      final double widthPercentX3,
      final double widthPercentX4,
      final double defaultWidthPercent) {
    // calculate full width
    final double w = screenInnerWidth(context);

    // pull desired width percent
    double widthPercent = Break.decideOr(context, widthPercentX1,
        widthPercentX2, widthPercentX3, widthPercentX4, defaultWidthPercent);

    // use default width if none
    if (widthPercent == null) return (defaultWidthPercent / 100) * w;

    // use full width if out of range
    if (widthPercent < 0 || widthPercent > 100) return w;

    // use accurate divider for thirds
    if (widthPercent > 33 / 100 && widthPercent < 34 / 100)
      widthPercent = 1 / 3;

    // return width
    return (widthPercent / 100) * w;
  }

  // full screen height
  static double screenHeight(final BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // normally just screen width (but constrained to a max)
  static double sectionWidth(final BuildContext context) {
    final double width = Design.screenWidth(context);
    return width > SECTION_MAX_WIDTH ? SECTION_MAX_WIDTH : width;
  }

  // the width of section without gap
  static double sectionInnerWidth(final BuildContext context) {
    return sectionWidth(context) - (gap(context) * 2);
  }

  // the width percentage of section without gap
  static double sectionInnerWidthPercent(
      final BuildContext context,
      final double widthPercentX1,
      final double widthPercentX2,
      final double widthPercentX3,
      final double widthPercentX4,
      final double defaultWidthPercent) {
    // calculate full width
    final double w = sectionInnerWidth(context);

    // pull desired width percent
    double widthPercent = Break.decideOr(context, widthPercentX1,
        widthPercentX2, widthPercentX3, widthPercentX4, defaultWidthPercent);

    // use default width if none
    if (widthPercent == null) return (defaultWidthPercent / 100) * w;

    // use full width if out of range
    if (widthPercent < 0 || widthPercent > 100) return w;

    // use accurate divider for thirds
    if (widthPercent > 33 / 100 && widthPercent < 34 / 100)
      widthPercent = 1 / 3;

    // return width
    return (widthPercent / 100) * w;
  }

  ///// CROSS (CLOSE ICON)

  // The cross icon
  static const String ICON_CROSS = 'assets/img-cross.png';

  // The duration in milliseconds for the cross icon to animate (rotate)
  static const Duration ICON_CROSS_ANIMATION_DURATION =
      Duration(milliseconds: 200);

  ///// PROGRESS BAR

  // progress bar color
  static const Color PROGRESS_BAR_COLOR = Color.fromRGBO(255, 0, 103, 1);

  // height of the progress bar
  static const double PROGRESS_BAR_SIZE = 3;

  // duration of the progress bar to transition
  static const Duration PROGRESS_BAR_ANIMATION_DURATION =
      Duration(milliseconds: 300);

  ///// LOADING PAGE

  static const String LOADING_LINE_1 =
      'The apparition of these faces in the crowd:';
  static const String LOADING_LINE_2 = 'Petals on a wet, black bough.';

  // loading page background color
  static const Color LOADING_PAGE_COLOR = Color.fromRGBO(20, 20, 20, 1);

  // loading page text color
  static const Color LOADING_PAGE_TEXT_COLOR = Colors.white;

  // animation for the loading page fade in/out
  static const Duration LOADING_TRANSLATE_ANIMATION_DURATION =
      Duration(milliseconds: 1000);
  static const Curve LOADING_TRANSLATE_ANIMATION_CURVE = Curves.easeInOut;

  // fakes the progress bar loading when download the content from the CMS
  static const double LOADING_BAR_DOWNLOAD_FAKE_MAX = 0.5;
  static const Duration LOADING_BAR_DOWNLOAD_FAKE_PERIODIC_DURATION =
      Duration(milliseconds: 20);
  static const double LOADING_BAR_DOWNLOAD_FAKE_INCREMENT = 0.01;

  // fakes the progress bar loading when drawing the content
  static const double LOADING_BAR_DRAW_FAKE_MAX = 1;
  static const Duration LOADING_BAR_DRAW_FAKE_PERIODIC_DURATION =
      Duration(milliseconds: 50);
  static const double LOADING_BAR_DRAW_FAKE_INCREMENT = 0.01;

  // delay closing loading to allow content to draw behind
  static const Duration LOADING_FINALIZE_DELAY = Duration(milliseconds: 5000);

  ///// HEADER

  // The header logo image
  static const String HEADER_LOGO_IMAGE = 'assets/img-logo.png';

  // the height of the Header logo
  static const double HEADER_LOGO_SIZE = Design.SPACE * 0.8;

  // The duration in milliseconds for the logo icon to animate (translate x)
  static const Duration HEADER_LOGO_ANIMATION_DURATION =
      Duration(milliseconds: 50);
  static const double HEADER_LOGO_ANIMATION_TRANSLATION =
      Design.SPACE * -0.50; // make me 0 to disable

  // header link text color
  static const Color HEADER_LINK_COLOR = Color.fromRGBO(0, 0, 0, 0.7);

  // header link faded color
  static const Color HEADER_LINK_FADE_COLOR = Color.fromRGBO(0, 0, 0, 0.4);

  // header link underline color
  static const Color HEADER_LINK_UNDERLINE_COLOR = Color.fromRGBO(0, 0, 0, 0.3);

  // header bullet point color
  static const Color HEADER_BULLET_COLOR = Color.fromRGBO(0, 0, 0, 1.0);

  // The duration in milliseconds for the Header hover underline animation
  static const Duration HEADER_LINK_UNDERLINE_ANIMATION_DURATION =
      Duration(milliseconds: 100);
  static const Curve HEADER_LINK_UNDERLINE_ANIMATION_CURVE = Curves.easeInOut;

  // The animation Header work bullets to slide in
  static const Duration HEADER_WORK_SLIDE_ANIMATION_DURATION =
      Duration(milliseconds: 500);
  static const Curve HEADER_WORK_SLIDE_ANIMATION_CURVE = Curves.easeInOut;

  // Header bullets (for X1) slide in transation
  static const Duration HEADER_X1_BULLETS_ANIMATION_DURATION =
      Duration(milliseconds: 500);
  static const Curve HEADER_X1_BULLETS_ANIMATION_CURVE = Curves.easeInOut;

  // padding for the header bullets for X1
  static const EdgeInsets HEADER_X1_BULLETS_PADDING =
      EdgeInsets.only(right: Design.GAP_X1, bottom: Design.GAP_X1);

  // header links widths (needed for animation translation)
  static const double HEADER_STUDIO_LINK_WIDTH = Design.SPACE * 5;
  static const double HEADER_BULLETS_WIDTH = Design.SPACE * 16;

  // spacing for header (vertical height of header)
  static const double HEADER_CLEARANCE_X1 = Design.SPACE * 4;
  static const double HEADER_CLEARANCE_X2 = Design.SPACE * 8;
  static const double HEADER_CLEARANCE_X3 = Design.SPACE * 8;
  static const double HEADER_CLEARANCE_X4 = Design.SPACE * 8;
  static double clearance(final BuildContext context) {
    return Break.decide(context, HEADER_CLEARANCE_X1, HEADER_CLEARANCE_X2,
        HEADER_CLEARANCE_X3, HEADER_CLEARANCE_X4);
  }

  // spacing for header link
  static const double HEADER_LINK_HEIGHT_X1 = Design.SPACE * 3;
  static const double HEADER_LINK_HEIGHT_X2 = Design.SPACE * 3;
  static const double HEADER_LINK_HEIGHT_X3 = Design.SPACE * 3;
  static const double HEADER_LINK_HEIGHT_X4 = Design.SPACE * 3;
  static double headerLinkHeight(final BuildContext context) {
    return Break.decide(context, HEADER_LINK_HEIGHT_X1, HEADER_LINK_HEIGHT_X2,
        HEADER_LINK_HEIGHT_X3, HEADER_LINK_HEIGHT_X4);
  }

  // spacing for header bullet link
  static const double HEADER_BULLET_HEIGHT_X1 =
      HEADER_LINK_HEIGHT_X1 - Design.SPACE;
  static const double HEADER_BULLET_HEIGHT_X2 = HEADER_LINK_HEIGHT_X2;
  static const double HEADER_BULLET_HEIGHT_X3 = HEADER_LINK_HEIGHT_X3;
  static const double HEADER_BULLET_HEIGHT_X4 = HEADER_LINK_HEIGHT_X4;
  static double headerBulletHeight(final BuildContext context) {
    return Break.decide(
        context,
        HEADER_BULLET_HEIGHT_X1,
        HEADER_BULLET_HEIGHT_X2,
        HEADER_BULLET_HEIGHT_X3,
        HEADER_BULLET_HEIGHT_X4);
  }

  ///// STUDIO

  // spacing for studio header
  static const double STUDIO_HEADER_CLEARANCE_X1 = Design.SPACE * 5;
  static const double STUDIO_HEADER_CLEARANCE_X2 = Design.SPACE * 8;
  static const double STUDIO_HEADER_CLEARANCE_X3 = Design.SPACE * 8;
  static const double STUDIO_HEADER_CLEARANCE_X4 = Design.SPACE * 8;
  static double studioClearance(final BuildContext context) {
    return Break.decide(
        context,
        STUDIO_HEADER_CLEARANCE_X1,
        STUDIO_HEADER_CLEARANCE_X2,
        STUDIO_HEADER_CLEARANCE_X3,
        STUDIO_HEADER_CLEARANCE_X4);
  }

  // studio widget background color
  static const Color STUDIO_BACKGROUND_COLOR = Design.BACKGROUND_COLOR;

  // the color of the cross icon to close the studio
  static const Color STUDIO_X_COLOR = Color.fromRGBO(5, 5, 5, 1);

  // top spacing/clearance for studio X icon
  static const double STUDIO_X_CLEARANCE_X1 = GAP_X1;
  static const double STUDIO_X_CLEARANCE_X2 = GAP_X2 - Design.SPACE;
  static const double STUDIO_X_CLEARANCE_X3 = GAP_X3 - Design.SPACE;
  static const double STUDIO_X_CLEARANCE_X4 = GAP_X4 - Design.SPACE;
  static double studioCloseClearance(final BuildContext context) {
    return Break.decide(context, STUDIO_X_CLEARANCE_X1, STUDIO_X_CLEARANCE_X2,
        STUDIO_X_CLEARANCE_X3, STUDIO_X_CLEARANCE_X4);
  }

  // studio widget opposite background color
  static const Color STUDIO_OFFSET_COLOR = Color.fromRGBO(189, 189, 189, 0.4);
  static const ColorFilter STUDIO_OFFSET_BLEND_MODE =
      ColorFilter.mode(Design.STUDIO_OFFSET_COLOR, BlendMode.multiply);

  // studio width (for x2, x3, x4)
  static const double STUDIO_SIZE = Design.SPACE * 30;

  // The Studio widget to slide in/out animation
  static const Duration STUDIO_SLIDE_ANIMATION_DURATION =
      Duration(milliseconds: 500);
  static const Curve STUDIO_SLIDE_ANIMATION_CURVE = Curves.easeInOut;

  // the animation duration to show the underline on hover for anchor links in the text area of Studio
  static const Duration STUDIO_ANCHOR_LINE_DURATION =
      Duration(milliseconds: 200);
  static const Curve STUDIO_ANCHOR_LINE_CURVE = Curves.easeInOut;
  static const Color STUDIO_ANCHOR_LINE_COLOR = Color.fromRGBO(20, 20, 20, 1);

  // Studio footer text color
  static const Color STUDIO_FOOTER_TEXT_COLOR = Color.fromRGBO(0, 0, 0, 0.4);

  // The spacing between the studio content
  static const double STUDIO_CONTENT_SPACING = Design.SPACE * 2;

  ///// HOME

  // Home menu subtitle color (faded)
  static const Color HOME_MENU_SUBTITLE_COLOR = Color.fromRGBO(0, 0, 0, 0.4);

  // the animation for the home page to swtich between projects
  static const Duration HOME_TRANSTION_ANIMATION_DURATION =
      Duration(milliseconds: 5000);

  // the animation details for the cross fade of images
  static const Duration HOME_OPACITY_ANIMATION_DURATION =
      Duration(milliseconds: 500);
  static const Curve HOME_OPACITY_ANIMATION_CURVE = Curves.easeInOut;

  ///// SHOWCASE

  // the Showcase X12 underline animation
  static const Duration SHOWCASE_X12_LINK_UNDERLINE_ANIMATION_DURATION =
      Duration(milliseconds: 100);
  static const Curve SHOWCASE_X12_LINK_UNDERLINE_ANIMATION_CURVE =
      Curves.easeInOut;

  // the color for the Showcase X12 underline
  static const Color SHOWCASE_X12_LINK_UNDERLINE_COLOR =
      Color.fromRGBO(10, 10, 10, 1.0);

  // showcase menu link hover opacity
  static const SHOWCASE_MENU_LINK_OPACITY_ANIMATION_MIN = 0.1;
  static const SHOWCASE_MENU_LINK_OPACITY_ANIMATION_DURATION =
      Duration(milliseconds: 200);
  static const SHOWCASE_MENU_LINK_OPACITY_ANIMATION_CURVE = Curves.easeInOut;

  ///// ARCHIVE

  // Archive row height
  static const double ARCHIVE_MENU_ROW_HEIGHT = Design.SPACE * 4;

  // the number of rows for the image to occupy
  static const int ARCHIVE_IMAGE_SCALE_X12 = 3;
  static const int ARCHIVE_IMAGE_SCALE_X34 = 4;

  // how to fit the image
  static const BoxFit ARCHIVE_IMAGE_BOX_FIT = BoxFit.cover;

  // border color of the archive menu link
  static const Color ARCHIVE_MENU_LINK_BORDER_COLOR =
      Color.fromRGBO(0, 0, 0, 0.1);
  static const double ARCHIVE_MENU_LINK_BORDER_WIDTH = 1.0;

  // archive menu link opacity (background gray color)
  static const Color ARCHIVE_MENU_LINK_HOVER_BACKGROUND_COLOR =
      Color.fromRGBO(0, 0, 0, 0.03);

  ///// TAGS

  // tags row height
  static const double TAGS_MENU_ROW_HEIGHT = Design.SPACE * 4;

  // number of tags to show per row
  static const int TAGS_MENU_LINKS_PER_ROW_X1 = 2;
  static const int TAGS_MENU_LINKS_PER_ROW_X2 = 4;
  static const int TAGS_MENU_LINKS_PER_ROW_X3 = 4;
  static const int TAGS_MENU_LINKS_PER_ROW_X4 = 4;

  // the height of the tag image (x1 and x2)
  static const double TAGS_IMAGE_HEIGHT_X1 = 200;
  static const double TAGS_IMAGE_HEIGHT_X2 = 300;

  // the aspect ratio of the tag image (for x1 and x2)
  static const double TAGS_IMAGE_SCALE_X1 = 5 / 7;
  static const double TAGS_IMAGE_SCALE_X2 = 5 / 7;

  // the number of rows for the image to occupy (for x3 and x4)
  static const int TAGS_IMAGE_SCALE_X3 = 4;
  static const int TAGS_IMAGE_SCALE_X4 = 4;

  // how to fit the image
  static const BoxFit TAGS_IMAGE_BOX_FIT = BoxFit.cover;

  // space between tag images that appear on the right
  static const double TAGS_IMAGES_VERTICAL_SPACE = 2;

  // space between tag images that appear at the top
  static const double TAGS_IMAGES_HORIZONTAL_SPACE = Design.SPACE;

  // border color of the tags menu link
  static const Color TAGS_MENU_LINK_BORDER_COLOR = Color.fromRGBO(0, 0, 0, 0.1);
  static const double TAGS_MENU_LINK_BORDER_WIDTH = 1.0;

  // tags menu link opacity (background gray color)
  static const Color TAGS_MENU_LINK_HOVER_BACKGROUND_COLOR =
      Color.fromRGBO(0, 0, 0, 0.03);

  // tags menu link label opacity when out of scope
  static const double TAGS_MENU_LINK_DISABLED_OPACITY = 0.3;

  ///// STUDY

  // study widget background color
  static const Color STUDY_BACKGROUND_COLOR = Design.BACKGROUND_COLOR;

  // animation for the study page fade in/out
  static const Duration STUDY_TRANSLATE_ANIMATION_DURATION =
      Duration(milliseconds: 1000);
  static const Curve STUDY_TRANSLATE_ANIMATION_CURVE = Curves.easeInOut;

  // study main thumb image height
  static const double STUDY_THUMB_DEFAULT_HEIGHT_RATIO =
      2 / 3; //66.6% of height
  static const double STUDY_THUMB_MIN_HEIGHT = 500;
  static const double STUDY_THUMB_MAX_HEIGHT = 1000;

  // the color of the cross icon to close the study
  static const Color STUDY_X_COLOR = Color.fromRGBO(171, 167, 171, 1);

  // study arrow image
  static const String STUDY_ARROW_IMAGE = 'assets/img-arrow.png';
  static const Color STUDY_ARROW_COLOR = Color.fromRGBO(171, 167, 171, 1);
  static const double STUDY_ARROW_WIDTH = Design.SPACE * 2;
  static const double STUDY_ARROW_TRANSLATION_OFFSET = Design.SPACE;
  static const Duration STUDY_ARROW_ANIMATION_DURATION =
      Duration(milliseconds: 200);
  static const Curve STUDY_ARROW_ANIMATION_CURVE = Curves.easeInOut;
  static const double STUDY_ARROW_ANIMATION_HEIGHT_SCALE = 0.6;

  // study content intro block
  static const Color STUDY_CONTENT_INTRO_TITLE_COLOR = Design.COLOR;
  static const Color STUDY_CONTENT_INTRO_SUBTITLE_COLOR =
      Color.fromRGBO(0, 0, 0, 0.4);
  static const double STUDY_CONTENT_INTRO_BLOCK_WIDTH_FACTOR = 0.4;
  static const double STUDY_CONTENT_INTRO_BLOCK_MIN_WIDTH = 100;
  static const double STUDY_CONTENT_INTRO_BLOCK_MAX_WIDTH = 500;

  // study scroll to top animation (when arrow button clicked)
  static const STUDY_SCROLL_TO_TOP_ANIMATION_DURATION =
      Duration(milliseconds: 500);
  static const STUDY_SCROLL_TO_TOP_ANIMATION_CURVE = Curves.easeInOut;

  // how the blocks should align
  // (a) the horizontal alignment of elements in the same row
  static const WrapAlignment STUDY_CONTENT_BLOCKS_ALIGNMENT =
      WrapAlignment.center;
  // (b)
  static const WrapAlignment STUDY_CONTENT_BLOCKS_RUN_ALIGNMENT =
      WrapAlignment.start;
  // (c) the vertical alignment of the elements in the same row
  static const WrapCrossAlignment STUDY_CONTENT_BLOCKS_CROSS_ALIGNMENT =
      WrapCrossAlignment.center;

  // default width percent of content blocks (if none provided)
  static const double STUDY_CONTENT_BLOCKS_DEFAULT_WIDTH_PERCENT = 80;

  // how to fit the study content image
  static const BoxFit STUDY_CONTENT_IMAGE_BOX_FIT = BoxFit.cover;

  // the animation details for the cross fade of images
  static const Duration STUDY_CONTENT_IMAGE_TRANSTION_ANIMATION_DURATION =
      Duration(milliseconds: 5000);
  static const Duration STUDY_CONTENT_IMAGE_OPACITY_ANIMATION_DURATION =
      Duration(milliseconds: 500);
  static const Curve STUDY_CONTENT_IMAGE_OPACITY_ANIMATION_CURVE =
      Curves.easeInOut;

  // background color for the study content blocks A
  static const Color STUDY_CONTENT_BLOCKS_A_BACKGROUND_COLOR = BACKGROUND_COLOR;

  // background color for the study conent blocks B area
  static const Color STUDY_CONTENT_BLOCKS_B_BACKGROUND_COLOR =
      Color.fromRGBO(243, 232, 224, 1);

  // top spacing/clearance for studio X icon
  static const double STUDY_X_CLEARANCE_X1 = GAP_X1;
  static const double STUDY_X_CLEARANCE_X2 = GAP_X2 - Design.SPACE;
  static const double STUDY_X_CLEARANCE_X3 = GAP_X3 - Design.SPACE;
  static const double STUDY_X_CLEARANCE_X4 = GAP_X4 - Design.SPACE;
  static double studyCloseClearance(final BuildContext context) {
    return Break.decide(context, STUDY_X_CLEARANCE_X1, STUDY_X_CLEARANCE_X2,
        STUDY_X_CLEARANCE_X3, STUDY_X_CLEARANCE_X4);
  }

  // X1

  // <h1>
  static const TextStyle X1_H1 = TextStyle(
      fontFamily: 'SaolText',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 25,
      height: 1.2,
      letterSpacing: -1,
      color: Design.COLOR,
      decoration: TextDecoration.none);

  // <h2> (same as paragraph caps)
  static const TextStyle X1_H2 = TextStyle(
      fontFamily: 'UntitledSans',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 13,
      height: 1.6,
      letterSpacing: 0.05,
      color: Design.COLOR,
      decoration: TextDecoration.none);
  static const TextStyle X1_H3 = X1_H2;
  static const TextStyle X1_H4 = X1_H2;
  static const TextStyle X1_H5 = X1_H2;
  static const TextStyle X1_H6 = X1_H2;

  // <p>
  static const TextStyle X1_P = TextStyle(
      fontFamily: 'UntitledSans',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 14,
      height: 1.6,
      color: Design.COLOR,
      decoration: TextDecoration.none);

  // <a>
  static const TextStyle X1_A = TextStyle(
      fontFamily: 'UntitledSans',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 14,
      height: 1.6,
      color: Design.COLOR,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: 1.0,
      decorationColor: Design.COLOR);

  // X2

  // <h1>
  static const TextStyle X2_H1 = TextStyle(
      fontFamily: 'SaolText',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 25,
      height: 1.2,
      letterSpacing: -1,
      color: Design.COLOR,
      decoration: TextDecoration.none);

  // <h2> (same as paragraph caps)
  static const TextStyle X2_H2 = TextStyle(
      fontFamily: 'UntitledSans',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 13,
      height: 1.6,
      letterSpacing: 0.05,
      color: Design.COLOR,
      decoration: TextDecoration.none);
  static const TextStyle X2_H3 = X2_H2;
  static const TextStyle X2_H4 = X2_H2;
  static const TextStyle X2_H5 = X2_H2;
  static const TextStyle X2_H6 = X2_H2;

  // <p>
  static const TextStyle X2_P = TextStyle(
      fontFamily: 'UntitledSans',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 14,
      height: 1.6,
      color: Design.COLOR,
      decoration: TextDecoration.none);

  // <a>
  static const TextStyle X2_A = TextStyle(
      fontFamily: 'UntitledSans',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 14,
      height: 1.6,
      color: Design.COLOR,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: 1.0,
      decorationColor: Design.COLOR);

  // X3

  // <h1>
  static const TextStyle X3_H1 = TextStyle(
      fontFamily: 'SaolText',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 40,
      height: 1.2,
      letterSpacing: -1,
      color: Design.COLOR,
      decoration: TextDecoration.none);

  // <h2> (same as paragraph caps)
  static const TextStyle X3_H2 = TextStyle(
      fontFamily: 'UntitledSans',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 14,
      height: 1.6,
      letterSpacing: 0.05,
      color: Design.COLOR,
      decoration: TextDecoration.none);
  static const TextStyle X3_H3 = X3_H2;
  static const TextStyle X3_H4 = X3_H2;
  static const TextStyle X3_H5 = X3_H2;
  static const TextStyle X3_H6 = X3_H2;

  // <p>
  static const TextStyle X3_P = TextStyle(
      fontFamily: 'UntitledSans',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 15,
      height: 1.6,
      color: Design.COLOR,
      decoration: TextDecoration.none);

  // <a>
  static const TextStyle X3_A = TextStyle(
      fontFamily: 'UntitledSans',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 15,
      height: 1.6,
      color: Design.COLOR,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: 1.0,
      decorationColor: Design.COLOR);

  // X4

  // <h1>
  static const TextStyle X4_H1 = TextStyle(
      fontFamily: 'SaolText',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 60,
      height: 1.2,
      letterSpacing: -1,
      color: Design.COLOR,
      decoration: TextDecoration.none);

  // <h2> (same as paragraph caps)
  static const TextStyle X4_H2 = TextStyle(
      fontFamily: 'UntitledSans',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 14,
      height: 1.6,
      letterSpacing: 0.05,
      color: Design.COLOR,
      decoration: TextDecoration.none);
  static const TextStyle X4_H3 = X4_H2;
  static const TextStyle X4_H4 = X4_H2;
  static const TextStyle X4_H5 = X4_H2;
  static const TextStyle X4_H6 = X4_H2;

  // <p>
  static const TextStyle X4_P = TextStyle(
      fontFamily: 'UntitledSans',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 15,
      height: 1.6,
      color: Design.COLOR,
      decoration: TextDecoration.none);

  // <a>
  static const TextStyle X4_A = TextStyle(
      fontFamily: 'UntitledSans',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w300,
      fontSize: 15,
      height: 1.6,
      color: Design.COLOR,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.solid,
      decorationThickness: 1.0,
      decorationColor: Design.COLOR);

  static TextStyle H1(final BuildContext context) {
    try {
      return Break.decide(context, X1_H1, X2_H1, X3_H1, X4_H1);
    } catch (e) {
      return X4_H1;
    }
  }

  static TextStyle H2(final BuildContext context) {
    try {
      return Break.decide(context, X1_H2, X2_H2, X3_H2, X4_H2);
    } catch (e) {
      return X4_H2;
    }
  }

  static TextStyle H3(final BuildContext context) {
    try {
      return Break.decide(context, X1_H3, X2_H3, X3_H3, X4_H3);
    } catch (e) {
      return X4_H3;
    }
  }

  static TextStyle H4(final BuildContext context) {
    try {
      return Break.decide(context, X1_H4, X2_H4, X3_H4, X4_H4);
    } catch (e) {
      return X4_H4;
    }
  }

  static TextStyle H5(final BuildContext context) {
    try {
      return Break.decide(context, X1_H5, X2_H5, X3_H5, X4_H5);
    } catch (e) {
      return X4_H5;
    }
  }

  static TextStyle H6(final BuildContext context) {
    try {
      return Break.decide(context, X1_H6, X2_H6, X3_H6, X4_H6);
    } catch (e) {
      return X4_H6;
    }
  }

  static TextStyle P(final BuildContext context) {
    try {
      return Break.decide(context, X1_P, X2_P, X3_P, X4_P);
    } catch (e) {
      return X4_P;
    }
  }

  static TextStyle A(final BuildContext context) {
    try {
      return Break.decide(context, X1_A, X2_A, X3_A, X4_A);
    } catch (e) {
      return X4_A;
    }
  }
}
