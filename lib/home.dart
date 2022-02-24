
import 'package:flutterapp/simple.dart';
import 'package:flutter/material.dart';

import 'package:flutterapp/cat.dart';
import 'package:flutterapp/dashatar.dart';

class HomePuzzle extends StatefulWidget {

  const HomePuzzle({Key? key}) : super(key: key);

  @override
  createState() => _PuzzleState();
}

class _PuzzleState extends State<HomePuzzle> {

  int showSimplePuzzle = 1;

  final bool _visible = true;

  Widget renderWidgetPuzzle() {
    if(showSimplePuzzle == 1) {
      return const SimplePuzzle();
    } else if (showSimplePuzzle == 2) {
      return const DashatarPuzzle();
    } else if (showSimplePuzzle == 3) {
      return const CatPuzzle();
    } else {
      return const SimplePuzzle();
    }
  }

  @override
  Widget build(BuildContext context) {
    const String titles = 'Welcome to my Puzzle';

    return MaterialApp(
      title: titles,
      home: Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.transparent,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
              color: Colors.black12
          ),
          title: const Text(titles, style: TextStyle(
              color: Colors.grey
          )),
          //automaticallyImplyLeading: false,
          leading: IconButton (
            icon: const Icon(Icons.home),
            onPressed: () {
              setState(() {showSimplePuzzle=1;});
            },
          ),

          actions: <Widget>[
            TextButton(
              onPressed: () {setState(() {showSimplePuzzle=1;});},
              child: const Text('Simple'),
            ),
            TextButton(
              onPressed: () {setState(() {showSimplePuzzle=2;});},
              child: const Text('Dashatar'),
            ),
            TextButton(
              onPressed: () {setState(() {showSimplePuzzle=3;});},
              child: const Text('Cat'),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("web/images/puzzle.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
                child: Container(
                  child: AnimatedOpacity(
                    // If the widget is visible, animate to 0.0 (invisible).
                    // If the widget is hidden, animate to 1.0 (fully visible).
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1000),
                    child: renderWidgetPuzzle(),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, spreadRadius: 3),
                    ],
                  ),
                  height: 620, //double.infinity,//620,
                  width: 500,
                ),
          ),
        ),
      ),
    );
  }
}