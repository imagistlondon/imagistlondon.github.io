import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class L1C<A> extends StatelessWidget {
  L1C(this.valueListenable, this.builder, {Key key, this.child})
      : super(key: key);

  final ValueListenable<A> valueListenable;
  final Widget Function(A a, Widget child) builder;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
        valueListenable: valueListenable,
        builder: (context, a, child) {
          return builder(a, child);
        },
        child: child);
  }
}
