import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dicee'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white.withOpacity(.8),
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.red,
      body: const Center(child: DicePage()),
    ),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePage createState() => _DicePage();
}

const int maxSide = 6;
Random random = Random();

class _DicePage extends State<DicePage> {
  int _leftDice = random.nextInt(maxSide) + 1;
  int _rightDice = random.nextInt(maxSide) + 1;

  void changeImage() {
    setState(() {
      _leftDice = random.nextInt(maxSide) + 1;
      _rightDice = random.nextInt(maxSide) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Expanded>[
        Expanded(
          child: TextButton(
            style: const ButtonStyle(
              splashFactory: NoSplash.splashFactory,
            ),
            child: Image.asset('images/dice$_leftDice.png'),
            onPressed: () => changeImage(),
          ),
        ),
        Expanded(
          child: TextButton(
            style: const ButtonStyle(
              splashFactory: NoSplash.splashFactory,
            ),
            child: Image.asset('images/dice$_rightDice.png'),
            onPressed: () => changeImage(),
          ),
        ),
      ],
    );
  }
}
