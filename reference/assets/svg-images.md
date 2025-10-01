# SVG Images in Flutter Reference

## Quick Example
```dart
// First: Add package to pubspec.yaml
// flutter pub add flutter_svg

import 'package:flutter_svg/flutter_svg.dart';

// Basic SVG from assets
SvgPicture.asset(
  'assets/images/icon.svg',
  width: 100,
  height: 100,
)
```

## Core Concepts

### Package Installation
Add to your `pubspec.yaml`:
```yaml
dependencies:
  flutter_svg: ^2.0.0  # Check pub.dev for latest version
```

Then run:
```bash
flutter pub get
```

### Asset Configuration
In `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/  # Include trailing slash for entire folder
```

**Critical:** Asset folder must be at project root, NOT inside lib/

### Loading SVGs from Assets
```dart
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture.asset(
  'assets/images/hand.svg',
  width: 50,
  height: 50,
  fit: BoxFit.contain,  // How to scale the SVG
)
```

### Loading SVGs from Network
```dart
SvgPicture.network(
  'https://example.com/icon.svg',
  width: 200,
  height: 200,
  placeholderBuilder: (context) => CircularProgressIndicator(),
)
```

## Common Patterns

### Applying Colors to SVGs
```dart
// Modern approach using ColorFilter
SvgPicture.asset(
  'assets/images/icon.svg',
  width: 50,
  height: 50,
  colorFilter: ColorFilter.mode(
    Colors.white,
    BlendMode.srcIn,  // Replaces all colors with white
  ),
)
```

### SVG in AppBar
```dart
AppBar(
  leading: Padding(
    padding: EdgeInsets.all(8),
    child: SvgPicture.asset(
      'assets/images/logo.svg',
      colorFilter: ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
    ),
  ),
  title: Text('My App'),
)
```

### SVG with Error Handling
```dart
SvgPicture.asset(
  'assets/images/icon.svg',
  width: 100,
  height: 100,
  placeholderBuilder: (BuildContext context) => Container(
    padding: EdgeInsets.all(30.0),
    child: CircularProgressIndicator(),
  ),
  // Shows if SVG fails to load
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.error, color: Colors.red);
  },
)
```

## Properties Reference

| Property | Type | Purpose |
|----------|------|---------|
| width | double? | SVG display width |
| height | double? | SVG display height |
| fit | BoxFit | How to inscribe the SVG |
| alignment | AlignmentGeometry | How to align SVG within bounds |
| colorFilter | ColorFilter? | Apply color transformations |
| semanticsLabel | String? | Accessibility description |
| placeholderBuilder | WidgetBuilder? | Widget shown while loading |
| errorBuilder | Widget Function()? | Widget shown on error |

## BlendMode Options for ColorFilter

| BlendMode | Effect |
|-----------|---------|
| srcIn | Replace all colors with filter color |
| srcATop | Overlay color on existing |
| modulate | Tint the colors |
| saturation | Adjust saturation level |

## Important Rules

⚠️ **SVGs with embedded CSS often render black**
```dart
// Problem: SVG has internal styles that override Flutter colors
// Solution: Use online tools to clean SVG files

// Option 1: Strip CSS from SVG file (recommended)
// Use: https://www.iloveimg.com/resize-image

// Option 2: Force color override
SvgPicture.asset(
  'assets/images/icon.svg',
  colorFilter: ColorFilter.mode(
    Colors.blue,
    BlendMode.srcIn,  // This replaces ALL colors
  ),
)
```

⚠️ **Asset path must match exactly**
```dart
// ❌ WRONG - Missing folder
SvgPicture.asset('icon.svg')

// ❌ WRONG - Wrong folder name
SvgPicture.asset('assets/icon.svg')

// ✅ CORRECT - Full path from assets declaration
SvgPicture.asset('assets/images/icon.svg')
```

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| SVG renders as black | Use iLoveIMG.com to clean CSS, or apply ColorFilter |
| Asset not found error | Check pubspec.yaml indentation and exact path |
| SVG not updating after change | Stop and restart app (hot reload may not work) |
| Network SVG not loading | Check internet connection, add error handling |
| Deprecated 'color' property warning | Use ColorFilter instead of color parameter |
| SVG too large/small | Set explicit width/height or use fit property |

## When Covered in Course
- **[Week 5A](../../weekly/5A.md)** - SVG package installation, asset configuration, color issues
- **Project 1** - Using SVG icons in UI design

## Useful SVG Resources
- [Heroicons](https://heroicons.com) - Free SVG icon set
- [Feather Icons](https://feathericons.com) - Minimalist icon set  
- [SVG Cleaner Tool](https://www.iloveimg.com/resize-image) - Fix rendering issues
- [flutter_svg Package](https://pub.dev/packages/flutter_svg) - Official package page

---
*Last updated: Week 5A | IGME-340 Reference*