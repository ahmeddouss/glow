import 'package:flutter/material.dart';
import 'package:glow/glowWidget.dart';
import 'package:glow/innerGlowWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      final List<Color> _colors = [
    Colors.blue,
    const Color.fromARGB(255, 135, 232, 49).withOpacity(0.5),
    Colors.purple,
    Colors.pink,
  
  ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apple Intelligence Glow',
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: InnerGlowingWidget(
            width: 300,
            height: 600,
            colors: _colors,
            borderRadius: 32,
            glowWidth: 17,
            blure: 9,
            child: Container(
              width: 300,
              height: 600,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Text(
                "Apple Glow",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
