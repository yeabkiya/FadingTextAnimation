import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadingTextAndImageAnimation(),
    );
  }
}

class FadingTextAndImageAnimation extends StatefulWidget {
  @override
  _FadingTextAndImageAnimationState createState() => _FadingTextAndImageAnimationState();
}

class _FadingTextAndImageAnimationState extends State<FadingTextAndImageAnimation> {
  bool _isVisible = true; // Controls text visibility
  bool _showFrame = false; // Controls image frame
  bool _rotateImage = false; // Controls image rotation

  // Function to toggle text visibility
  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  // Function to toggle the frame around the image
  void toggleFrame(bool value) {
    setState(() {
      _showFrame = value;
    });
  }

  // Function to toggle image rotation
  void toggleRotation() {
    setState(() {
      _rotateImage = !_rotateImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fading Text and Image Animation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Fading Text with GestureDetector for interactivity
            GestureDetector(
              onTap: toggleVisibility,
              child: AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0,
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut, // Adding curve for smoother animation
                child: const Text(
                  'Hello, Flutter!',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Image with rounded corners and optional frame
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: _showFrame ? Border.all(color: Colors.blueAccent, width: 5) : null, // Toggling frame
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/cat.png',
                  width: 250,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Switch to toggle the frame
            SwitchListTile(
              title: const Text('Show Frame'),
              value: _showFrame,
              onChanged: toggleFrame,
            ),
            const SizedBox(height: 20),
            // Rotating image
            GestureDetector(
              onTap: toggleRotation,
              child: AnimatedRotation(
                duration: const Duration(seconds: 1),
                turns: _rotateImage ? 1 : 0, // Rotate 1 turn on tap
                child: Image.asset(
                  'assets/images/cat.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tap the logo to rotate!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}