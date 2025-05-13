import 'package:flutter/painting.dart';
import 'package:zoom_color_picker/color_helper/color_name_util.dart';

/// Extension on [Color] to get the nearest color name from a predefined list.
///
/// This extension uses the [ColorNameUtil.findNearestColorName] method to
/// determine the closest matching color name based on RGB similarity.
///
/// Example:
/// ```dart
/// final color = Color(0xFF123456);
/// print(color.colorName); // Outputs: Closest color name from the predefined list
/// ```
extension ColorNameExtension on Color {
  /// Returns the name of the color closest to this [Color] instance.
  ///
  /// This uses a predefined list of hex color codes with names, and compares
  /// the RGB values using Euclidean distance to find the most visually similar name.
  String get colorName => ColorNameUtil.findNearestColorName(this);
}