import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

/// A controller to manage the image and color picking process with GetX.
class ZoomColorPickerController extends GetxController {
  // Observable state variables using GetX
  Rx<ui.Image?> uiImage = Rx<ui.Image?>(null); // To hold the raw image data
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null); // To hold the image bytes for display
  Rx<Color?> selectedColor = Rx<Color?>(null); // To store the selected color at the tapped position
  Rx<Offset?> tapPosition = Rx<Offset?>(null); // To store the position of the tap on the image

  final GlobalKey imageKey = GlobalKey(); // Key for the image widget to calculate the tap position

  /// Loads an image and its bytes.
  ///
  /// [provider] is the image provider to fetch the image.
  /// [file] is the file object used to get the image bytes for display.
  Future<void> loadImageAndBytes(ImageProvider provider, File file) async {
    final completer = Completer<ui.Image>();
    final stream = provider.resolve(const ImageConfiguration());
    final listener = ImageStreamListener((imageInfo, _) {
      completer.complete(imageInfo.image); // Completes the image loading
    });
    stream.addListener(listener);
    uiImage.value = await completer.future; // Set the loaded raw image data
    stream.removeListener(listener);

    imageBytes.value = await file.readAsBytes(); // Set the loaded bytes for display
  }

  /// Picks an image from the gallery and processes it.
  ///
  /// This function uses the image picker to select an image and then loads the image and its bytes.
  Future<void> pickImageAndProcess() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery); // Open the gallery for the user to pick an image
    if (picked != null) {
      final file = File(picked.path); // Get the file from the picked image
      final provider = FileImage(file); // Create an image provider for the file
      await loadImageAndBytes(provider, file); // Load the image and its bytes
    }
  }

  /// Handles the tap on the image to detect the color at the tapped position.
  ///
  /// [details] provides the position where the user tapped on the image.
  Future<void> onTapDown(TapDownDetails details) async {
    if (uiImage.value == null) return;
    final box = imageKey.currentContext!.findRenderObject() as RenderBox;
    final localPos = box.globalToLocal(details.globalPosition); // Convert global position to local position

    final pixelX = (localPos.dx * uiImage.value!.width / box.size.width).toInt();
    final pixelY = (localPos.dy * uiImage.value!.height / box.size.height).toInt();

    final byteData = await uiImage.value!.toByteData(format: ui.ImageByteFormat.rawRgba); // Get raw pixel data
    if (byteData == null) return;

    final data = byteData.buffer.asUint8List(); // Convert the byte data into a list
    final pixelIndex = (pixelY * uiImage.value!.width + pixelX) * 4; // Calculate the pixel index

    final r = data[pixelIndex]; // Red value
    final g = data[pixelIndex + 1]; // Green value
    final b = data[pixelIndex + 2]; // Blue value
    final a = data[pixelIndex + 3]; // Alpha value

    selectedColor.value = Color.fromARGB(a, r, g, b); // Set the selected color
    tapPosition.value = localPos; // Store the tapped position
  }
}
