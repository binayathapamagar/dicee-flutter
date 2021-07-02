import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Dicee'),
      ),
      body: SafeArea(
        child: DicePage(),
      ),
    ),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({Key key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int randomNumber1 = 1;
  int randomNumber2 = 1;

  void updateBothImages() {
    setState(() {
      randomNumber1 = Random().nextInt(6) + 1;
      randomNumber2 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    updateBothImages();
                  },
                  child: Image.asset('images/dice$randomNumber1.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    updateBothImages();
                  },
                  child: Image.asset('images/dice$randomNumber2.png'),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red.shade900,
            ),
            onPressed: () {
              updateBothImages();
            },
            child: Text(
              'ROLL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
