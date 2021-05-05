# animation_widgets

This provides animation widget.

## Getting Started

### 1. Write dependencies in 'pubspec.yaml'.
**pubspec.yaml**
```
dependencies:
  animation_widgets:
    git:
      url: git@github.com:matsuob/animation_widgets.git
      ref: 0.0.1
```

### 2. Run flutter pub get in the terminal.
```
$flutter pub get
```

### 3. Write code such as sample.
```
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
```
