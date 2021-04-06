import 'package:app/Index.dart';
import 'package:app/config/Design.dart';
import 'package:app/util/Images.dart';
import 'package:app/util/IndexNotifier.dart';
import 'package:app/util/UA.dart';
import 'package:flutter/material.dart';

class LogoImage extends StatefulWidget {
  const LogoImage(
      {Key key, @required this.indexVN, @required this.bulletsEnabledVN})
      : super(key: key);

  final IndexNotifier indexVN;
  final ValueNotifier<bool> bulletsEnabledVN;

  @override
  LogoImageState createState() => LogoImageState();
}

class LogoImageState extends State<LogoImage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Design.HEADER_LOGO_ANIMATION_DURATION,
      vsync: this,
    );

    // reverse
    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) controller.reverse();
    });

    animation = Tween<Offset>(
            begin: Offset(0, 0),
            end: Offset(Design.HEADER_LOGO_ANIMATION_TRANSLATION, 0))
        .animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void onTap() {
    widget.bulletsEnabledVN.value = false;
    widget.indexVN.value = Index.HOME;
  }

  void onEnter(PointerEvent pe) {
    controller.forward();
  }

  void onExit(PointerEvent pe) {}

  @override
  Widget build(BuildContext context) {
    return UA(
        onTap: onTap,
        onEnter: onEnter,
        onExit: onExit,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: Design.gap(context)),
            alignment: Alignment.centerLeft,
            height: Design.gap(context),
            // TRANSLATE (ANIMATED)
            child: AnimatedBuilder(
                // CONTROLLER
                animation: controller,
                // TRANSLATION
                builder: (_, child) {
                  return Transform.translate(
                      offset: animation.value, child: child);
                },
                // IMAGE
                child: Images.of(Design.HEADER_LOGO_IMAGE,
                    height: Design.HEADER_LOGO_SIZE))));
  }
}
