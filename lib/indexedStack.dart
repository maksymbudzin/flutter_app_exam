import 'package:flutter/material.dart';
import 'dart:math';
import 'global.dart' as global;

import 'SecondRoute.dart';

Random random = new Random();

class IndexedStackWidget extends StatefulWidget {
  @override
  _IndexedStackWidgetState createState() => _IndexedStackWidgetState();
}

class _IndexedStackWidgetState extends State<IndexedStackWidget> {
  int _index = 2;
  double firstRand = 0.0;
  double secondRand = 0.0;

  void _encrease() {
    setState(() {
      firstRand += random.nextInt(20) + 10;

      global.size += firstRand;

      if (global.size > 700) {
        global.size = 700;
      }
      if (global.size > 395 && global.size < 405) {
        _index = 0;
      }
      global.secondSize -= firstRand;
    });
  }

  void _reduce() {
    setState(() {
      secondRand += random.nextInt(20) + 10;
      global.size -= secondRand;
      if (global.size < 100) {
        global.size = 100;
      }
      if (global.size > 395 && global.size < 405) {
        _index = 0;
      }
      global.secondSize += secondRand;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IndexedStack(
            index: _index,
            children: [
              AnimatedSquare(global.size, Colors.redAccent),
              AnimatedSquare(global.size, Colors.orangeAccent),
              AnimatedSquare(global.size, Colors.greenAccent),
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
    );
  }
}

class AnimatedSquare extends StatelessWidget {
  final double size;
  final Color color;

  const AnimatedSquare(this.size, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SecondRoute()),
        );
      },
      child: AnimatedContainer(
        child: new Image.network(
            'https://script.ws/public/storage/users/1607946988.png'),
        curve: Curves.easeInBack,
        duration: Duration(seconds: 1),
        width: size,
        height: size,
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
