# Zoom Color Picker

A Flutter package for picking colors from an image with zoom functionality and returning the selected color **and its name**, along with the selected image path, to the parent widget.

## Features

- Pick an image from the gallery.
- Zoom in and out of the image.
- Tap anywhere on the image to get the **color of the pixel**.
- Return the selected color, its name, and image file path via callbacks.
- **Accurate color name detection** using RGB-based closest match (2,245 color references).

## Installation

Add the following dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  zoom_color_picker: ^1.0.2