import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class L2C<A, B> extends StatelessWidget {
  L2C(this.valueListenableA, this.valueListenableB, this.builder,
      {Key key, this.child})
      : super(key: key);

  final ValueListenable<A> valueListenableA;
  final ValueListenable<B> valueListenableB;
  final Widget Function(A a, B b, Widget child) builder;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
        valueListenable: valueListenableA,
        builder: (context, a, child) {
          return ValueListenableBuilder<B>(
              valueListenable: valueListenableB,
              builder: (context, b, child) {
                return builder(a, b, child);
              },
              child: child);
        },
        child: child);
  }
}
