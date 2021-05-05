library animation_widgets;

import 'package:flutter/material.dart';

/// This is for animation. Use this with [AnimationState].
abstract class AnimationWidget extends StatefulWidget {
  AnimationWidget({
    Key? key,
    required this.animationDuration, this.delay = const Duration()
  }): super(key: key);

  final Duration animationDuration;

  /// After this(Default is 0s), Animation will start.
  final Duration delay;
}

/// This is for animation. Use this with [AnimationWidget].
abstract class AnimationState<T extends AnimationWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  @protected late AnimationController animationController;
  @protected late Animation<double> animation;

  abstract final Tween<double> tween;

  @override
  void initState() {
    super.initState();
    animationController
    = AnimationController(duration: widget.animationDuration, vsync: this);
    animation = tween.animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(widget.delay, () { // Delay animation start.
      if (!mounted) {return;}
      animationController.forward();
    });
    return buildAnimation(context);
  }

  /// Implement to built a widget with animation, for example [FadeTransition].
  @protected
  Widget buildAnimation(BuildContext context);

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}