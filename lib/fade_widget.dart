import 'package:flutter/material.dart';

import 'animation_widget.dart';

class FadeWidget extends AnimationWidget {
  FadeWidget({
    Key? key, required this.child,
    required Duration fadeDuration, Duration delayDuration = const Duration()
  }): super(key: key, animationDuration: fadeDuration, delay: delayDuration);

  final Widget child;

  @override
  State<StatefulWidget> createState() => _FadeWidgetState();
}

class _FadeWidgetState extends AnimationState<FadeWidget> {
  @override
  Tween<double> get tween => Tween(begin: 0, end: 1);

  @override
  Widget buildAnimation(BuildContext context) {
    return FadeTransition(opacity: animation, child: widget.child,);
  }
}

class ConsecutiveFadeWidgets extends StatelessWidget {
  ConsecutiveFadeWidgets({
    Key? key,
    required this.children,
    required this.direction,
    required this.fadeDuration,
    this.interval = const Duration(),
    this.delayDuration = const Duration(),
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }): super(key: key);

  final List<Widget> children;
  final Duration fadeDuration;
  /// After this(Default is 0s), Animation will start.
  final Duration interval;

  /// After this(Default is 0s), Animation will start.
  final Duration delayDuration;

  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: children.asMap().map((index, widget) {
        return MapEntry(index, FadeWidget(
          fadeDuration: fadeDuration,
          delayDuration: delayDuration + ((fadeDuration + interval) * index),
          child: widget,
        ));
      }).values.toList(),
    );
  }
}