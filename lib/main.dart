import 'package:flutter/material.dart';

import 'indexedStack.dart';

void main() => runApp(ScreenWidget());

class ScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exam'),
        ),
        // body: Example(),
        // body: StackWidget(),
        // body: PositionedWidget(),
        body: IndexedStackWidget(),
      ),
    );
  }
}
