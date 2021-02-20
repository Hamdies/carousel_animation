import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> data = [
    'images/1.png',
    'images/2.jpeg',
    'images/3.jpeg',
    'images/hey.jpeg',
    'images/5.jpeg',
    'images/6.jpeg',
  ];
  int _currentImage = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: Container(
            key: ValueKey<String>(data[_currentImage]),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(data[_currentImage]), fit: BoxFit.cover),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        ),
        FractionallySizedBox(
          heightFactor: 0.55,
          child: PageView.builder(
            itemCount: data.length,
            onPageChanged: (int image) {
              setState(() {
                _currentImage = image;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return FractionallySizedBox(
                widthFactor: 0.8,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(data[_currentImage]),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        )
                      ]),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
