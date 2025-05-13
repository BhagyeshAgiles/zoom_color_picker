## [1.0.2] - 2025-05-13
### Changed
- `onColorPicked` callback updated to include the color name:
  - **Old**: `void Function(Color color)?`
  - **New**: `void Function(Color color, String colorName)?`
- `onImagePicked` callback now returns image file path instead of `XFile`:
  - **Old**: `void Function(XFile imageFile)?`
  - **New**: `void Function(String imageFilePath)?`

### Added
- Integrated color name resolution using nearest match from 2,245 color hex codes.
- Internal logic uses RGB distance to calculate the closest color name.

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