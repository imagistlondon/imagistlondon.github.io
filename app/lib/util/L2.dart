import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class L2<A, B> extends StatelessWidget {
  L2(
    this.valueListenableA,
    this.valueListenableB,
    this.builder, {
    Key key,
  }) : super(key: key);

  final ValueListenable<A> valueListenableA;
  final ValueListenable<B> valueListenableB;
  final Widget Function(A a, B b) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: valueListenableA,
      builder: (context, a, _child) {
        return ValueListenableBuilder<B>(
          valueListenable: valueListenableB,
          builder: (context, b, _child) {
            return builder(a, b);
          },
        );
      },
    );
  }
}
