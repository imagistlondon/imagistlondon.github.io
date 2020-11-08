import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class L1<A> extends StatelessWidget {
  L1(this.valueListenable, this.builder, {Key key}) : super(key: key);

  final ValueListenable<A> valueListenable;
  final Widget Function(A a) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
        valueListenable: valueListenable,
        builder: (context, a, _child) {
          return builder(a);
        });
  }
}
