import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class L3<A, B, C> extends StatelessWidget {
  L3(
    this.valueListenableA,
    this.valueListenableB,
    this.valueListenableC,
    this.builder, {
    Key key,
  }) : super(key: key);

  final ValueListenable<A> valueListenableA;
  final ValueListenable<B> valueListenableB;
  final ValueListenable<C> valueListenableC;
  final Widget Function(A a, B b, C c) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: valueListenableA,
      builder: (context, a, _child) {
        return ValueListenableBuilder<B>(
          valueListenable: valueListenableB,
          builder: (context, b, _child) {
            return ValueListenableBuilder<C>(
                valueListenable: valueListenableC,
                builder: (context, c, _child) {
                  return builder(a, b, c);
                });
          },
        );
      },
    );
  }
}
