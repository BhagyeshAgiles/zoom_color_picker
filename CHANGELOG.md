## [1.0.1] - 2025-05-09
### Added
- Callback support:
  - `onColorPicked(Color color)` to return the tapped pixel color.
  - `onImagePicked(XFile imageFile)` to return the picked image.
- Floating action button to confirm selection and trigger callbacks.

## [1.0.0+1] - 2025-05-09
- Initial release of `zoom_color_picker`.
- Features:
  - Pick image from gallery.
  - Zoom in/out on the image.
  - Tap to detect color using pixel hashcode.
  - GetX used for state management instead of setState.