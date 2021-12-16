import 'package:flutter/material.dart';
import 'dart:math';

Random random = new Random();

class IndexedStackWidget extends StatefulWidget {
  @override
  _IndexedStackWidgetState createState() => _IndexedStackWidgetState();
}

class _IndexedStackWidgetState extends State<IndexedStackWidget> {
  int _index = 0;
  double size = 100.0;

  void _switchEncrease() {
    if (_index != 2) {
      setState(() {
        _index++;
        size += random.nextInt(30) ;
      });
    } else if (size >= 700 ){
      setState(() {
        _index = 0;
        size = 100;
      });
    }
  }

  void _switchReduce() {
    if (_index != 2) {
      setState(() {
        _index++;
        size -= random.nextInt(30) ;
      });
    } 
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
              AnimatedSquare(size, Colors.redAccent),
              AnimatedSquare(size, Colors.orangeAccent),
              AnimatedSquare(size, Colors.greenAccent),
            ],
          ),
          FloatingActionButton(
            child: new Icon(Icons.add),
            onPressed: () {
              _switchEncrease();
            },
          ),
          FloatingActionButton(
            child: new Icon(Icons.remove),
            onPressed: () {
               _switchReduce();
            },
          )
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
    return AnimatedContainer(
      child: Image.network(
          'https://logowik.com/content/uploads/images/flutter5786.jpg'),
      curve: Curves.easeInBack,
      duration: Duration(seconds: 1),
      width: size,
      height: size,
      color: color,
    );
  }
}
