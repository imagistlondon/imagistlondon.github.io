import 'package:app/config/Break.dart';
import 'package:flutter/material.dart';

class Video {
  static const double DEFAULT_MULTIPLIER = 10;
  static const double DEFAULT_WIDTH_UNIT = 16;
  static const double DEFAULT_HEIGHT_UNIT = 9;

  static const double DEFAULT_WIDTH = DEFAULT_WIDTH_UNIT * DEFAULT_MULTIPLIER;
  static const double DEFAULT_HEIGHT = DEFAULT_HEIGHT_UNIT * DEFAULT_MULTIPLIER;

  static const double DEFAULT_WIDTH_FACTOR = 16 / 9;
  static const double DEFAULT_HEIGHT_FACTOR = 9 / 16;

  final String id;
  final bool cinema;

  final double heightFactorX1;
  final double heightFactorX2;
  final double heightFactorX3;
  final double heightFactorX4;

  const Video(this.id,
      {this.cinema = false,
      this.heightFactorX1 = DEFAULT_HEIGHT_FACTOR,
      this.heightFactorX2 = DEFAULT_HEIGHT_FACTOR,
      this.heightFactorX3 = DEFAULT_HEIGHT_FACTOR,
      this.heightFactorX4 = DEFAULT_HEIGHT_FACTOR});

  double height(final BuildContext context,
      {final double width: DEFAULT_WIDTH}) {
    return width *
        Break.decideOr(context, heightFactorX1, heightFactorX2, heightFactorX3,
            heightFactorX4, DEFAULT_HEIGHT_FACTOR);
  }
}
