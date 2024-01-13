import 'package:flutter/material.dart';

/// A Flutter widget that displays a rotating gradient loader.
///
/// The loader consists of a circular icon with a rotating gradient effect.
/// It uses [AnimatedBuilder] and [Transform.rotate] to achieve the rotation,
/// and [ShaderMask] with [LinearGradient] for the rotating gradient effect.
class RotatingGradientLoader extends StatefulWidget {
  @override
  _RotatingGradientLoaderState createState() => _RotatingGradientLoaderState();
}

/// The state class for [RotatingGradientLoader].
///
/// Manages the [AnimationController] and builds the widget tree using
/// [AnimatedBuilder] to achieve the rotating gradient loader effect.
class _RotatingGradientLoaderState extends State<RotatingGradientLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with a 2-second duration, set to repeat
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    // Dispose of the animation controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotating Gradient Loader'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // Rotate the gradient circle using Transform.rotate
            return Transform.rotate(
              angle: _controller.value * 2 * 3.1416,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  // Create a LinearGradient shader for the rotating gradient effect
                  return LinearGradient(
                    colors: [Color(0xff36D1DC), Color(0xff5B86E5)],
                    stops: [0.0, 1.0],
                    transform: GradientRotation(_controller.value * 2 * 3.1416),
                  ).createShader(bounds);
                },
                // Display an icon (could be replaced with any other widget)
                child: Icon(
                  Icons.circle,
                  size: 100.0,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
