# Images & Assets Reference

## Quick Setup
1. Create `assets/images/` folder at project root (NOT inside lib!)
2. Add images to the folder
3. Declare in `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/
```
4. Run `flutter pub get`

## Local Images (AssetImage)

### Basic Usage
```dart
// Method 1: Image widget
Image(
  image: AssetImage('assets/images/icon.png'),
  width: 200,
  height: 200,
)

// Method 2: Image.asset constructor
Image.asset(
  'assets/images/icon.png',
  width: 200,
  height: 200,
)
```

### Image in Container (Week 4A Example!)
```dart
Container(
  width: 300,
  height: 300,
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/background.png'),
      fit: BoxFit.cover,
    ),
  ),
)
```

## Network Images

### Basic Network Image
```dart
// From Week 4A class!
String netImg = 'https://picsum.photos/300/300';

Image.network(
  netImg,
  width: 200,
  height: 200,
)
```

### Network Image in BoxDecoration
```dart
Container(
  width: 300,
  height: 300,
  decoration: BoxDecoration(
    border: Border.all(color: Colors.black, width: 5),
    borderRadius: BorderRadius.circular(50),
    image: DecorationImage(
      image: NetworkImage('https://picsum.photos/300/300'),
      fit: BoxFit.cover,
    ),
  ),
)
```

### With Error Handling
```dart
Image.network(
  'https://example.com/image.jpg',
  errorBuilder: (context, error, stackTrace) {
    return Container(
      color: Colors.grey,
      child: Icon(Icons.error, color: Colors.red),
    );
  },
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  },
)
```

## pubspec.yaml Configuration

### Specific Files
```yaml
flutter:
  assets:
    - assets/images/logo.png
    - assets/images/background.jpg
```

### Entire Folder (Easier!)
```yaml
flutter:
  assets:
    - assets/images/
```

### Multiple Asset Types
```yaml
flutter:
  assets:
    - assets/images/
    - assets/icons/
    - assets/data/
```

## BoxFit Options

```dart
DecorationImage(
  image: AssetImage('assets/images/photo.jpg'),
  fit: BoxFit.cover,    // Crop to fill (most common)
  // Other options:
  // BoxFit.contain    // Show entire image
  // BoxFit.fill       // Stretch to fill
  // BoxFit.fitWidth   // Scale to fit width
  // BoxFit.fitHeight  // Scale to fit height
  // BoxFit.none       // No scaling
)
```

## Common Patterns

### Circular Avatar
```dart
Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    image: DecorationImage(
      image: AssetImage('assets/images/avatar.png'),
      fit: BoxFit.cover,
    ),
  ),
)
```

### Image with Overlay Text
```dart
Stack(
  children: [
    Image.asset('assets/images/banner.jpg'),
    Positioned(
      bottom: 20,
      left: 20,
      child: Text(
        'Overlay Text',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          shadows: [
            Shadow(
              blurRadius: 10,
              color: Colors.black,
            ),
          ],
        ),
      ),
    ),
  ],
)
```

### Placeholder While Loading
```dart
FadeInImage.assetNetwork(
  placeholder: 'assets/images/loading.gif',
  image: 'https://example.com/image.jpg',
  width: 200,
  height: 200,
)
```

## Important Rules

⚠️ **Asset Path Must Be Exact**
```dart
// ❌ WRONG - Missing folder
Image.asset('icon.png')

// ✅ CORRECT - Full path
Image.asset('assets/images/icon.png')
```

⚠️ **pubspec.yaml Indentation**
```yaml
# ❌ WRONG - Bad indentation
flutter:
assets:
  - assets/images/

# ✅ CORRECT - Proper indentation (2 spaces!)
flutter:
  assets:
    - assets/images/
```

## Common Errors & Solutions

| Error | Solution |
|-------|----------|
| "Unable to load asset" | Check path spelling and pubspec.yaml |
| Network image not showing | Check internet, airplane mode, cold boot emulator |
| Image looks stretched | Use appropriate BoxFit |
| pubspec.yaml changes not working | Run `flutter pub get` or restart app |
| Image too large (memory) | Resize images before adding to assets |

## Debugging Network Issues

From Week 4A:
- Check if emulator is in airplane mode
- Try cold booting the emulator
- Test with a known working URL like `https://picsum.photos/200`

## File Size Tips

- Keep asset images under 1-2 MB
- Use `.jpg` for photos
- Use `.png` for images with transparency
- Consider different resolutions (1x, 2x, 3x) for production

## When Covered in Course
- **[Week 4A](../../weekly/4A.md)** - Local and network images
- **[Project 1](../../projects/design_to_spec.md)** - Using provided assets

## External Resources
- [Flutter Images Documentation](https://docs.flutter.dev/ui/assets/assets-and-images)
- [Image Optimization Guide](https://docs.flutter.dev/perf/best-practices#minimize-asset-sizes)

---
*Last updated: Week 5 | IGME-340 Reference*
