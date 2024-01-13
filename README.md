## Features
A Flutter package that provides a customizable rotating gradient loader widget. 
Enhance your Flutter app's user experience with this visually appealing loading indicator.


## Getting started

To use this package, add `rotating_gradient_loader` to your `pubspec.yaml` file:


## Usage


```dart

class RotatingGradientLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotating Gradient Loader'),
      ),
      body: Center(
        child: RotatingGradientLoader(
          size: 50.0,
          primaryColor: Colors.red,
          secondaryColor: Colors.yellow,
        ),
      ),
    );
  }
}
```


