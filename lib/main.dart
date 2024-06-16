import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    home: App(),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Color> _colors = [
    Colors.red.shade900,
    Colors.orange.shade900,
    Colors.yellow.shade900,
    Colors.green.shade900,
    Colors.blue.shade900,
    Colors.indigo.shade900,
    Colors.purple.shade900,
  ];

  final Duration _animationDuration = const Duration(seconds: 1);

  final double _canvasWidth = 400;
  final double _canvasHeight = 600;

  double _left = 0;
  double _top = 0;
  int _color = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: _canvasHeight,
          width: _canvasWidth,
          child: Stack(
            children: [
              AnimatedPositioned(
                top: _top,
                left: _left,
                duration: _animationDuration,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: const WidgetStatePropertyAll(0),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _top = Random().nextInt(_canvasHeight.toInt() - 100) + 50;
                      _left = Random().nextInt(_canvasWidth.toInt() - 50) + 25;
                      _color = Random().nextInt(_colors.length);
                    });
                  },
                  child: AnimatedDefaultTextStyle(
                    duration: _animationDuration,
                    style: TextStyle(
                      color: _colors[_color],
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                    child: const Text(
                      'Press me',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
