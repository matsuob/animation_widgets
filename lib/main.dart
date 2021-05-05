import 'package:flutter/material.dart';
import 'package:animation_widgets/fade_widget.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(body: _PlayGround(),),
  ));
}

class _PlayGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child:
      FadeWidget(
        fadeDuration: const Duration(seconds: 1),
        delayDuration: const Duration(seconds: 1),
        child:
          Text("Hello!",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
    );
  }
}