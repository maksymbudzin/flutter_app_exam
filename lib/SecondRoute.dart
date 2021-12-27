import 'package:flutter/material.dart';
import 'dart:math';

import 'global.dart' as global;

import 'indexedStack.dart';
import 'indexedStack.dart';
import 'main.dart';

Random random = new Random();

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  int _index = 2;
  double firstRand = 0.0;
  double secondRand = 0.0;

  void _encrease() {
    setState(() {
      firstRand += random.nextInt(20) + 10;
      global.secondSize += firstRand;

      if (global.secondSize > 700) {
        global.secondSize = 700;
      }
      if (global.size > 345 && global.size < 355) {
        _index = 0;
      }
      global.size -= firstRand;
    });
  }

  void _reduce() {
    setState(() {
      secondRand += random.nextInt(20) + 10;
      global.secondSize -= secondRand;
      if (global.secondSize < 100) {
        global.secondSize = 100;
      }
      if (global.size > 345 && global.size < 355) {
        _index = 0;
      }
      global.size += secondRand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Route"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IndexedStack(
                    index: _index,
                    children: [
                      AnimatedSquare(global.secondSize, Colors.redAccent),
                      AnimatedSquare(global.secondSize, Colors.orangeAccent),
                      AnimatedSquare(global.secondSize, Colors.greenAccent),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 300.0, 0.0, 0.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloatingActionButton(
                            child: new Icon(Icons.remove),
                            onPressed: () {
                              _reduce();
                            },
                          ),
                        ),
                        SizedBox(
                          width: 275.0,
                        ),
                        FloatingActionButton(
                          child: new Icon(Icons.add),
                          onPressed: () {
                            _encrease();
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class AnimatedSquare extends StatelessWidget {
  final double secondSize;
  final Color color;

  const AnimatedSquare(this.secondSize, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScreenWidget()),
        );
      },
      child: AnimatedContainer(
        child: new Image.network(
            'https://script.ws/public/storage/users/1607946988.png'),
        curve: Curves.easeInBack,
        duration: Duration(seconds: 1),
        width: secondSize,
        height: secondSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(180.0),
              bottomRight: Radius.circular(180.0),
              topLeft: Radius.circular(180.0),
              bottomLeft: Radius.circular(180.0)),
          color: color,
        ),
      ),
    );
  }
}
