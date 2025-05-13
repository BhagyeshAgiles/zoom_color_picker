import 'package:flutter/material.dart';
import 'package:zoom_color_picker/zoom_color_picker.dart';

/// Entry point of the Zoom Color Picker demo application.
void main() => runApp(const MyApp());

/// Root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoom Color Picker Demo',
      home: Scaffold(
        body: ZoomColorPicker(
          // Callback triggered when a pixel is tapped.
          // Returns the selected [Color] and its nearest name.
          onColorPicked: (color, colorName) {
            debugPrint('Selected Color: $color');
            debugPrint('Color Name: $colorName');
          },

          // Callback triggered when an image is picked.
          // Returns the image file path as a [String].
          onImagePicked: (imagePath) {
            debugPrint('Image saved to: $imagePath');
          },
        ),
      ),
    );
  }
}
