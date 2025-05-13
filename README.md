
🔵 Apple Glow Widget for Flutter

A sleek Flutter widget inspired by the Apple Intelligence glow style. This package provides glowing effects similar to what Apple showcased in their latest UI, designed for modern, minimal, and futuristic apps.


⸻

✨ Features
	•	Apple-style inner glow effect
	•	Customizable glow width, blur, and colors
	•	Fully responsive and composable
	•	Easily integrates into any Flutter project
	•	Perfect for futuristic UI elements, smart assistants, or dark-mode apps

⸻

📦 Installation

Add this to your pubspec.yaml:

dependencies:
  glow:
    git:
      url: https://github.com/your-username/glow-widget.git

Or replace with your actual package name and location once published to pub.dev.

⸻

🚀 Usage

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
      Colors.transparent,
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
            height: 180,
            colors: _colors,
            borderRadius: 32,
            glowWidth: 5,
            blure: 7,
            child: Container(
              width: 300,
              height: 180,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(32),
                border: Border.all(
                  color: const Color.fromARGB(60, 84, 23, 169),
                ),
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


⸻

🧩 Customization

Property	Description
colors	Gradient of the glow effect
glowWidth	Thickness of the glowing edge
blure	Intensity of the blur
borderRadius	Rounded corners of the glowing container
child	Your custom widget inside the glow frame


⸻

📸 Preview

Outer Glow Example

![z](https://github.com/user-attachments/assets/6e1c72a4-b2c1-4a9a-9014-4c48781dd4a3)


Inner Glow Example

![image](https://github.com/user-attachments/assets/bb6465d3-4626-4047-8c68-b48045809810)


⸻

🛠️ Roadmap
	•	Publish to pub.dev
	•	Add outer glow support
	•	Support animation effects
	•	Add light mode and color theme presets
	•	Example app and demo site

⸻

📄 License

This project is licensed under the MIT License. See the LICENSE file for details.

⸻

🙌 Acknowledgments

Inspired by Apple’s Intelligence Glow featured in WWDC 2024. Built with 💙 using Flutter.

⸻

Let me know if you want to include installable instructions for publishing on pub.dev, or want me to add a logo/banner for the README.
