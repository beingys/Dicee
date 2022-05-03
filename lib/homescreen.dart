import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void roll() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Dicee")), //appBar
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image(
                      image: AssetImage('images/dice-png-$leftDiceNumber.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Image(
                      image: AssetImage('images/dice-png-$rightDiceNumber.png'),
                    ),
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: roll,
              child: Text('Roll'),
              style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ]),
        ));
  }
}
