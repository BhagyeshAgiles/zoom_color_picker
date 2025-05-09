import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zoom_color_picker/src/zoom_color_picker_controller.dart';

/// A widget that displays an image, allows users to zoom, and pick colors by tapping on the image.
class ZoomColorPicker extends StatelessWidget {
  const ZoomColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller using GetX
    final controller = Get.put(ZoomColorPickerController());

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => controller.selectedColor.value == null
            ? const Text("Zoom Color Picker")
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hex Code: #${controller.selectedColor.value?.value.toRadixString(16).substring(2).toUpperCase()}',
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: controller.selectedColor.value,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: controller.selectedColor.value ??
                                Colors.transparent,
                            width: 1),
                      ),
                    ),
                  ],
                ),
              )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: controller
                  .pickImageAndProcess, // Open the image picker when tapped
              child: const Icon(Icons.image),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Display the image if available
          Obx(() {
            return controller.imageBytes.value != null
                ? Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTapDown:
                            controller.onTapDown, // Detect tap on the image
                        child: InteractiveViewer(
                          child: Image.memory(
                            controller.imageBytes.value!,
                            key: controller.imageKey,
                            fit: BoxFit
                                .contain, // Make sure the image is displayed with zoom functionality
                          ),
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: Text(
                        "No image selected")); // Show a message when no image is selected
          }),
        ],
      ),
    );
  }
}
