import 'package:animation/hero_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Animation',
    home: Animation(),
  ));
}

class Animation extends StatefulWidget {
  @override
  State<Animation> createState() => _AnimationState();
}

class _AnimationState extends State<Animation> {
  double isOpacity = 1;
  double targetValue = 24;
  bool isClicked = false;
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Hero(
              tag: 'hero',
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Hero_Test()));
                },
                child: FlutterLogo(
                  style: FlutterLogoStyle.horizontal,
                  size: 100,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Hero_Test()));
            },
            child: Text('hero animation'),
          ),
          AnimatedOpacity(
            opacity: isOpacity,
            duration: Duration(seconds: 5),
            child: FlutterLogo(
              size: 100,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (isOpacity == 1) {
                  isOpacity = 0;
                } else {
                  isOpacity = 1;
                }
              });
            },
            child: Text('Animated Opacity'),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: targetValue),
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutCirc,
            builder: (BuildContext context, double size, Widget? child) {
              return IconButton(
                iconSize: size,
                color: Colors.blue,
                icon: Icon(Icons.camera),
                onPressed: () {
                  setState(() {
                    targetValue = targetValue == 24.0 ? 48.0 : 24.0;
                  });
                },
              );
            },
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isClicked = !isClicked;
              });
            },
            child: Container(
              width: 200.0,
              height: 200.0,
              color: Colors.pink,
              child: Stack(
                children: [
                  AnimatedAlign(
                    alignment:
                        isClicked ? Alignment.topLeft : Alignment.topRight,
                    duration: Duration(seconds: 3),
                    child: FlutterLogo(
                      size: 30,
                    ),
                  ),
                  AnimatedAlign(
                    alignment:
                        isClicked ? Alignment.topRight : Alignment.bottomRight,
                    duration: Duration(seconds: 3),
                    child: FlutterLogo(
                      size: 30,
                    ),
                  ),
                  AnimatedAlign(
                    alignment: isClicked
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft,
                    duration: Duration(seconds: 3),
                    child: FlutterLogo(
                      size: 30,
                    ),
                  ),
                  AnimatedAlign(
                    alignment:
                        isClicked ? Alignment.bottomLeft : Alignment.topLeft,
                    duration: Duration(seconds: 3),
                    child: FlutterLogo(
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                tapped = !tapped;
              });
            },
            child: AnimatedContainer(
              width: tapped ? 200 : 100,
              height: tapped ? 100 : 200,
              curve: Curves.easeInOut,
              duration: Duration(seconds: 3),
              color: tapped ? Colors.amberAccent : Colors.greenAccent,
              child: FlutterLogo(
                size: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
