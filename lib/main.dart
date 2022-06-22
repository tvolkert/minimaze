import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:window_size/window_size.dart';

const double _tileSize = 24;

void main() async {
  double windowSize = _tileSize * 30;
  WidgetsFlutterBinding.ensureInitialized();
  setWindowFrame(Rect.fromLTWH(0, 0, windowSize, windowSize + 50));
  setWindowMaxSize(Size(windowSize, windowSize + 50));
  setWindowMinSize(Size(windowSize, windowSize + 50));
  await Future.delayed(const Duration(milliseconds: 50));
  runApp(MyApp(tileSize: _tileSize));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.tileSize}) : super(key: key);

  final double tileSize;

  List<List<String>> boardLayout = [
    ['b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b'],
    ['b', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'b', 'p', 'b', 'p', 'p', 'p', 'b', 'p', 'p', 'p', 'b', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'b'],
    ['b', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'p', 'b', 'p', 'p', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'b', 'b', 'p', 'b'],
    ['b', 'p', 'p', 'b', 'p', 'b', 'p', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'b', 'p', 'p', 'p', 'b', 'p', 'p', 'p', 'b', 'p', 'b', 'p', 'p', 'p', 'p', 'b'],
    ['b', 'p', 'b', 'b', 'p', 'b', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'w', 'p', 'p', 'b', 'b', 'b', 'p', 'b', 'b', 'b', 'p', 'b', 'p', 'b', 'b', 'b', 'b'],
    ['b', 'p', 'b', 'p', 'p', 'p', 'b', 'w', 'b', 'p', 'b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'p', 'b', 'p', 'p', 'p', 'b', 'p', 'p', 'p', 'p', 'b'],
    ['b', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'b', 'p', 'b', 'p', 'p', 'p', 'p', 'p', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'b'],
    ['b', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'b', 'b', 'p', 'b', 'b', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'b'],
    ['b', 'p', 'b', 'b', 'b', 'p', 'p', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'p', 'p', 'p', 'b', 'b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b'],
    ['b', 'p', 'b', 'p', 'b', 'b', 'b', 'b', 'b', 'p', 'b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'b'],
    ['b', 'p', 'b', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'b', 'p', 'p', 'p', 'b', 'p', 'p', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'b'],
    ['b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'b'],
    ['b', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'b', 'p', 'p', 'p', 'b', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'b', 'p', 'b'],
    ['b', 'b', 'b', 'b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'b', 'b', 'b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'b'],
    ['b', 'p', 'p', 'p', 'p', 'b', 'p', 'b', 'p', 'p', 'p', 'p', 'p', 'p', 'b', 'p', 'p', 'p', 'b', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'b', 'p', 'p', 'b'],
    ['b', 'p', 'b', 'b', 'b', 'b', 'p', 'b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'b', 'b', 'b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'b', 'b'],
    ['b', 'p', 'p', 'p', 'p', 'p', 'p', 'b', 'p', 'b', 'p', 'p', 'p', 'b', 'b', 'p', 'b', 'p', 'p', 'p', 'b', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'b', 'b'],
    ['b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'p', 'p', 'p', 'b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b'],
    ['b', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'b', 'p', 'p', 'p', 'b', 'p', 'p', 'p', 'p', 'b'],
    ['b', 'p', 'b', 'b', 'b', 'p', 'b', 'b', 'b', 'b', 'p', 'b', 'p', 'p', 'p', 'b', 'p', 'p', 'p', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'p', 'b'],
    ['b', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'p', 'p', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'p', 'b', 'b', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'p', 'b'],
    ['b', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'b', 'b', 'p', 'b', 'p', 'b', 'b', 'p', 'b', 'p', 'p', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'p', 'b'],
    ['b', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'p', 'p', 'b', 'p', 'p', 'b', 'p', 'b', 'b', 'p', 'p', 'p', 'b', 'b', 'b', 'p', 'b', 'p', 'b', 'b', 'p', 'b'],
    ['b', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'p', 'p', 'b', 'p', 'b', 'b', 'p', 'b'],
    ['b', 'p', 'p', 'p', 'b', 'p', 'p', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'p', 'b', 'p', 'p', 'p', 'p', 'p', 'p', 'b', 'b', 'b', 'p', 'b', 'b', 'p', 'b'],
    ['b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'b', 'b', 'b', 'b', 'p', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'p', 'p', 'b', 'b', 'p', 'b'],
    ['b', 'p', 'b', 'p', 'p', 'p', 'b', 'b', 'b', 'w', 'w', 'w', 'b', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'b', 'p', 'b', 'b', 'p', 'b'],
    ['b', 'p', 'b', 'p', 'b', 'p', 'b', 'b', 'w', 'w', 'w', 'w', 'w', 'w', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'p', 'b', 'b', 'p', 'b'],
    ['b', 'p', 'p', 'p', 'b', 'p', 'p', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p', 'b', 'b', 'p', 'b'],
    ['b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'b', 'c', 'b'],
  ];

  Widget _buildRow(BuildContext context, int numCol, int numBoxPerCol) {
    List<Widget> children = [];

    for (int col = 0; col < numCol; col++) {
      children.add(_buildCol(context, col, numBoxPerCol));
    }
    return Row(children: children);
  }

  Widget _buildCol(BuildContext context, int col, int numBoxes) {
    List<Widget> children = [];
    math.Random random = math.Random();

    for (int row = 0; row < numBoxes; row++) {
      Color color = Color.fromARGB(255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
      children.add(_buildBox(context, color, boardLayout[row][col]));
    }
    return Column(children: children);
  }

  Widget _buildBox(BuildContext context, Color myColor, String value) {
    Tile? tile;
    switch (value) {
      case 'b':
        tile = Bush();
        break;
      case 'w':
        tile = Water();
        break;
      case 'c':
        tile = Castle();
        break;
      default:
    }
    return SizedBox(
      width: tileSize,
      height: tileSize,
      child: ColoredBox(
        color: const Color.fromARGB(255, 255, 219, 174),
        child: DecoratedBox(
          decoration: const BoxDecoration(border: Border.fromBorderSide(BorderSide(width: 1))),
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Center(
              child: tile?.build(context),
            ),
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: _buildRow(context, 30, 30),
    );
  }
}

abstract class Tile {
  Widget build(BuildContext context);
}

class Bush extends Tile {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/bush.gif', width: 22, height: 22);
  }
}

class Path extends Tile {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Water extends Tile {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/water.gif', width: 22, height: 22);
  }
}

class Castle extends Tile {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/castle.gif', width: 22, height: 22);
  }
}
