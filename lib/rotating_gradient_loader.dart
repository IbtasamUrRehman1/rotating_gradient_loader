import 'package:flutter/material.dart';
/// A customizable rotating gradient loader widget for Flutter.
class RotatingGradientLoader extends StatefulWidget {
  /// The size of the loader.
  final double size;

  /// The primary color of the rotating gradient.
  final Color primaryColor;

  /// The secondary color of the rotating gradient.
  final Color secondaryColor;

  /// Creates a [RotatingGradientLoader] widget.
  ///
  /// Users must provide the [size], [primaryColor], and [secondaryColor].
  const RotatingGradientLoader({
    Key? key,
    required this.size,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  _RotatingGradientLoaderState createState() => _RotatingGradientLoaderState();
}

/// The state class for the [RotatingGradientLoader] widget.
///
/// Manages the animation controller and animation for the rotating gradient loader.
class _RotatingGradientLoaderState extends State<RotatingGradientLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with a 2-second duration, set to repeat.
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    // Dispose of the animation controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.1416,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              // Create a LinearGradient shader for the rotating gradient effect.
              return LinearGradient(
                colors: [widget.primaryColor, widget.secondaryColor],
                stops: [0.0, 1.0],
                transform: GradientRotation(_controller.value * 2 * 3.1416),
              ).createShader(bounds);
            },
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Change the color as needed.
              ),
            ),
          ),
        );
      },
    );
  }
}
