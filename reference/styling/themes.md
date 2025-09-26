# Flutter Theme System

## Quick Setup
```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  ),
  home: MyHomePage(),
)
```

## Core Concepts

### Light & Dark Themes
```dart
MaterialApp(
  theme: ThemeData(        // Light theme
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    brightness: Brightness.light,
  ),
  darkTheme: ThemeData(    // Dark theme
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    brightness: Brightness.dark,
  ),
  themeMode: ThemeMode.system,  // or .light, .dark
)
```

### ColorScheme Magic
`ColorScheme.fromSeed()` generates 47 color variations from one seed color!

```dart
// Key colors you'll actually use:
Theme.of(context).colorScheme.primary      // Main brand color
Theme.of(context).colorScheme.secondary    // Accent color
Theme.of(context).colorScheme.error        // Error states
Theme.of(context).colorScheme.surface      // Card/surface backgrounds
Theme.of(context).colorScheme.background   // App background
```

[Full ColorScheme documentation →](https://api.flutter.dev/flutter/material/ColorScheme-class.html)

## Text Themes

### Defining Text Styles
```dart
ThemeData(
  textTheme: TextTheme(
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16),
    bodyMedium: TextStyle(fontSize: 14),  // Default for Text widgets
  ),
)
```

### Using Text Themes
```dart
Text(
  'Headline',
  style: Theme.of(context).textTheme.headlineLarge,
)
```

[Material 3 Typography Guide →](https://m3.material.io/styles/typography/overview)

## Component Themes

### Button Themes Example
```dart
ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.purple,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  ),
)
```

### Other Component Themes
- `appBarTheme` - AppBar styling
- `cardTheme` - Card appearance
- `inputDecorationTheme` - TextField styling
- `iconTheme` - Default icon styles

[Full component theming list →](https://api.flutter.dev/flutter/material/ThemeData-class.html)

## Common Patterns

### Accessing Theme in Widgets
```dart
Container(
  color: Theme.of(context).colorScheme.primary,
  child: Text(
    'Themed Text',
    style: TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,  // Contrast color
    ),
  ),
)
```

### Custom Theme Extension
```dart
// For complex apps - create a separate file
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    // All your customizations
  );
  
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),
    // Dark customizations
  );
}

// Use in MaterialApp
MaterialApp(
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
)
```

## Quick Reference

### Most Used Theme Properties
| Property | What It Controls |
|----------|-----------------|
| `colorScheme` | All app colors (primary, secondary, etc.) |
| `textTheme` | Text styles throughout app |
| `scaffoldBackgroundColor` | Default background |
| `fontFamily` | Global font family |
| `useMaterial3` | Enable Material You design |

### Accessing Theme Data
| To Get | Use |
|--------|-----|
| Current theme | `Theme.of(context)` |
| Primary color | `Theme.of(context).colorScheme.primary` |
| Text style | `Theme.of(context).textTheme.bodyLarge` |
| Is dark mode? | `Theme.of(context).brightness == Brightness.dark` |

## Important Notes

⚠️ **BuildContext Required**: You can only access theme inside widget build methods where context is available

⚠️ **Theme vs Inline Styles**: Theme provides defaults, inline styles override them

⚠️ **Hot Reload Issues**: Major theme changes (especially fonts) may require full restart

## External Resources

- [Material Design 3 Color System](https://m3.material.io/styles/color/overview) - Understanding color roles
- [Flutter ThemeData Cookbook](https://docs.flutter.dev/cookbook/design/themes) - Official examples
- [Material Theme Builder](https://m3.material.io/theme-builder) - Visual theme designer

## When Covered in Course
- **[Week 3B](../../weekly/3B.md)** - Theme basics and ColorScheme
- **[Week 4B](../../weekly/4B.md)** - Custom fonts in themes

---
*Last updated: Week 5 | IGME-340 Reference*
