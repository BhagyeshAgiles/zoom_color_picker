import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoom_color_picker/zoom_color_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ZoomColorPicker(),
    );
  }
}
