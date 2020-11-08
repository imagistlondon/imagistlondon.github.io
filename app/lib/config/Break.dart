import 'package:flutter/material.dart';

// Defines how to break the layout depending on the size of the screen.

// x1 (< 768)

// iPhone SE (portait-320)
// iPhone 6 to X (portrait-375)
// iPhone 8 Plus (portrait-414)
//
// iPhone SE (landscape-568)
// iPhone 6 to 8 (landscape-667)
// iPhone 8 Plus (landscape-736)

// x2 (768 to 1023)

// iPad Air, iPad Mini, iPad Pro 9″ (portrait-768)
// iPad Pro 10″ (portrait-834)
// iPad Pro 12″ (portrait-1024)
//
// iPhone X (landscape-812)
// iPad Air, iPad Mini, iPad Pro 9″ (landcape-1024)

// x3 (1024 to 1440)

// iPad Pro 10″ (landcape-1112)
// HD 768p laptops (landcape-1366)
// iPad Pro 12″ (landscape-1366)
// 13″ MacBook Pro 2x scaling (landcape-1440)

// x4 (1441+)

// 13″ MacBook Pro 1.5x scaling (landscape-1680)
// 1080p displays (landcape-1920)

class Break {
  // x1->x2 breakpoint
  static const double X1 = 768;

  // x2->x3 breakpoint
  static const double X2 = 1024;

  // x3->x4 breakpoint
  static const double X3 = 1441;

  // x1 specifically
  static bool x1(BuildContext context) {
    return MediaQuery.of(context).size.width < X1;
  }

  // x2 specifically
  static bool x2(BuildContext context) {
    return MediaQuery.of(context).size.width >= X1 &&
        MediaQuery.of(context).size.width < X2;
  }

  // x3 specifically
  static bool x3(BuildContext context) {
    return MediaQuery.of(context).size.width >= X2 &&
        MediaQuery.of(context).size.width < X3;
  }

  // x4 specifically
  static bool x4(BuildContext context) {
    return MediaQuery.of(context).size.width >= X3;
  }

  // x1 or x2
  static bool x12(BuildContext context) {
    return x1(context) || x2(context);
  }

  // x1 or x2 or x3
  static bool x123(BuildContext context) {
    return x1(context) || x2(context) || x3(context);
  }

  // x2 or x3
  static bool x23(BuildContext context) {
    return x2(context) || x3(context);
  }

  // x2 or x3 or x4
  static bool x234(BuildContext context) {
    return x2(context) || x3(context) || x4(context);
  }

  // x3 or x4
  static bool x34(BuildContext context) {
    return x3(context) || x4(context);
  }

  static Object decide(BuildContext context, var x1, var x2, var x3, var x4) {
    return Break.x1(context)
        ? x1
        : Break.x2(context)
            ? x2
            : Break.x3(context)
                ? x3
                : x4;
  }
}
