import 'package:flutter/material.dart';

class Hero_Test extends StatefulWidget {
  const Hero_Test({Key? key}) : super(key: key);

  @override
  _Hero_TestState createState() => _Hero_TestState();
}

class _Hero_TestState extends State<Hero_Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: Center(
        child: Hero(
            tag: 'hero',
            child: FlutterLogo(
              style: FlutterLogoStyle.stacked,
              size: 300,
            )),
      ),
    );
  }
}
