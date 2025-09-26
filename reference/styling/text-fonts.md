# Text Styling & Custom Fonts

## Quick Text Styling
```dart
Text(
  'Styled Text',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    fontStyle: FontStyle.italic,
  ),
)
```

## Custom Font Installation

### Step 1: Add Font Files
Create folder structure:
```
your_project/
  ├── assets/
  │   └── fonts/
  │       ├── Lobster-Regular.ttf
  │       └── Sacramento-Regular.ttf
  └── lib/
```

### Step 2: Configure pubspec.yaml
```yaml
flutter:
  fonts:
    - family: Lobster
      fonts:
        - asset: assets/fonts/Lobster-Regular.ttf
    - family: Sacramento
      fonts:
        - asset: assets/fonts/Sacramento-Regular.ttf
        - asset: assets/fonts/Sacramento-Bold.ttf
          weight: 700
```

⚠️ **CRITICAL**: Use exact indentation (2 spaces, not tabs!)

### Step 3: Use Custom Font
```dart
// Inline usage
Text(
  'Custom Font Text',
  style: TextStyle(
    fontFamily: 'Lobster',
    fontSize: 30,
  ),
)

// In theme (better!)
MaterialApp(
  theme: ThemeData(
    fontFamily: 'Lobster',  // App-wide default
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Sacramento',
        fontSize: 48,
      ),
    ),
  ),
)
```

## TextStyle Properties

### Common Properties
```dart
TextStyle(
  fontSize: 20,                    // Size in logical pixels
  fontWeight: FontWeight.bold,     // Bold, normal, w100-w900
  fontStyle: FontStyle.italic,     // Normal or italic
  color: Colors.blue,              // Text color
  letterSpacing: 2.0,              // Space between letters
  wordSpacing: 5.0,                // Space between words
  height: 1.5,                     // Line height multiplier
  decoration: TextDecoration.underline,  // Underline, lineThrough
  decorationColor: Colors.red,     // Decoration color
  decorationStyle: TextDecorationStyle.wavy,  // Decoration style
  shadows: [
    Shadow(
      blurRadius: 10,
      color: Colors.black,
      offset: Offset(5, 5),
    ),
  ],
)
```

## Using Theme Text Styles

### Accessing Theme Styles (Week 3B Example!)
```dart
Text(
  'Headline',
  style: Theme.of(context).textTheme.headlineLarge,
)

Text(
  'Body text',
  style: Theme.of(context).textTheme.bodyMedium,  // Default for Text
)
```

### Extending Theme Styles
```dart
Text(
  'Modified Theme Text',
  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
    color: Colors.purple,
    fontWeight: FontWeight.w900,
  ),
)
```

## Google Fonts Package

### Installation
```yaml
dependencies:
  google_fonts: ^6.0.0  # Check pub.dev for latest
```

### Basic Usage
```dart
import 'package:google_fonts/google_fonts.dart';

Text(
  'Google Font Text',
  style: GoogleFonts.lobster(
    fontSize: 30,
    color: Colors.blue,
  ),
)
```

### In Theme
```dart
MaterialApp(
  theme: ThemeData(
    textTheme: GoogleFonts.latoTextTheme(),
  ),
)
```

⚠️ **Note from Week 4B**: Some Google Fonts may not work correctly with the package!

## Common Patterns

### Gradient Text (Advanced)
```dart
ShaderMask(
  blendMode: BlendMode.srcIn,
  shaderCallback: (bounds) => LinearGradient(
    colors: [Colors.blue, Colors.purple],
  ).createShader(bounds),
  child: Text(
    'Gradient Text',
    style: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.white,  // Required but overridden by gradient
    ),
  ),
)
```

### Text with Multiple Styles (RichText)
```dart
RichText(
  text: TextSpan(
    style: TextStyle(color: Colors.black, fontSize: 16),
    children: [
      TextSpan(text: 'Normal '),
      TextSpan(
        text: 'bold',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(text: ' and '),
      TextSpan(
        text: 'colored',
        style: TextStyle(color: Colors.blue),
      ),
    ],
  ),
)
```

### Overflow Handling
```dart
Text(
  'Very long text that might overflow the container',
  overflow: TextOverflow.ellipsis,  // Add ...
  maxLines: 2,  // Limit lines
)

// Other overflow options:
// TextOverflow.clip     // Cut off
// TextOverflow.fade     // Fade out
// TextOverflow.visible  // Show anyway (may cause layout issues)
```

## Font Weight Reference

| Weight | Constant | Description |
|--------|----------|-------------|
| w100 | FontWeight.w100 | Thin |
| w300 | FontWeight.w300 | Light |
| w400 | FontWeight.normal | Regular |
| w500 | FontWeight.w500 | Medium |
| w700 | FontWeight.bold | Bold |
| w900 | FontWeight.w900 | Black |

## Common Issues

| Problem | Solution |
|---------|----------|
| Custom font not showing | Check pubspec.yaml indentation, run `flutter pub get` |
| Font looks different on iOS/Android | Use consistent font families |
| Google Fonts not working | Try manual installation method instead |
| Text overflow | Use overflow property and maxLines |
| Font size changes crash hot reload | Do full restart (Week 4B issue!) |

## Project 1 Tip
For Project 1, fonts are provided. Download from Google Fonts and use manual installation rather than the package for reliability.

## When Covered in Course
- **[Week 3B](../../weekly/3B.md)** - Text themes
- **[Week 4B](../../weekly/4B.md)** - Custom fonts and Google Fonts

## External Resources
- [Google Fonts](https://fonts.google.com) - Download fonts
- [Flutter Text Class](https://api.flutter.dev/flutter/widgets/Text-class.html)
- [Typography Guidelines](https://m3.material.io/styles/typography/overview)

---
*Last updated: Week 5 | IGME-340 Reference*
