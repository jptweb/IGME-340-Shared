# ColorScheme & Color Generation

## Quick Example
```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  ),
)
// This generates 47 different color variations from one seed color!
```

## Core Concepts

### What is ColorScheme?
ColorScheme defines a set of 47 colors based on Material Design 3 specifications. These colors work together harmoniously and are used throughout your app's widgets automatically.

### Color Generation from Seed
Flutter's `ColorScheme.fromSeed()` uses Material Design's color algorithm to generate a complete palette from a single color:

```dart
// Just provide one color
ColorScheme.fromSeed(seedColor: Colors.green)

// Generates all these colors automatically:
// - primary, onPrimary
// - secondary, onSecondary  
// - tertiary, onTertiary
// - error, onError
// - background, onBackground
// - surface, onSurface
// - surfaceVariant, onSurfaceVariant
// - outline, shadow
// - inverseSurface, inversePrimary
// ... and more!
```

## Understanding Color Roles

### Primary Colors - Your Brand
```dart
Container(
  color: Theme.of(context).colorScheme.primary,        // Main brand color
  child: Text(
    'Primary Container',
    style: TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,  // Contrasting text color
    ),
  ),
)
```

### The "on" Colors
Every major color has an "on" variant that ensures readable text:
- `primary` → `onPrimary` (text that goes on primary color)
- `secondary` → `onSecondary`
- `surface` → `onSurface`
- `error` → `onError`

```dart
// Flutter automatically handles contrast
Card(
  color: Theme.of(context).colorScheme.errorContainer,
  child: Text(
    'Error Message',
    style: TextStyle(
      color: Theme.of(context).colorScheme.onErrorContainer,  // Always readable!
    ),
  ),
)
```

## Common Color Roles

| Role | Usage | Example Widget |
|------|-------|----------------|
| `primary` | Main brand color | AppBar, ElevatedButton |
| `secondary` | Accent/complementary | FAB, selected items |
| `tertiary` | Additional accent | Links, highlights |
| `surface` | Card/sheet backgrounds | Card, BottomSheet |
| `background` | App background | Scaffold background |
| `error` | Error states | Error text, validation |
| `outline` | Borders and dividers | OutlinedButton, Divider |

## Color Scheme Variations

### Light vs Dark Themes
```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,  // Light theme
    ),
  ),
  darkTheme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,   // Dark theme
    ),
  ),
  themeMode: ThemeMode.system,  // Follows device setting
)
```

### Custom Color Overrides
```dart
// Start with generated scheme, then customize specific colors
final ColorScheme myScheme = ColorScheme.fromSeed(
  seedColor: Colors.green,
).copyWith(
  secondary: Colors.orange,  // Override just secondary
  error: Colors.red.shade700,  // Custom error color
);

ThemeData(
  colorScheme: myScheme,
  useMaterial3: true,
)
```

## Accessing Colors in Widgets

### Using Theme.of(context)
```dart
// Always use Theme.of(context) to access colors
Container(
  color: Theme.of(context).colorScheme.primaryContainer,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Icon(
          Icons.star,
          color: Theme.of(context).colorScheme.primary,
        ),
        Text(
          'Themed Text',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ],
    ),
  ),
)
```

### Direct Color Access (Not Recommended)
```dart
// ❌ AVOID - Doesn't respond to theme changes
Container(
  color: Colors.blue,  // Hard-coded color
)

// ✅ PREFER - Responds to theme changes
Container(
  color: Theme.of(context).colorScheme.primary,
)
```

## Material Design 3 (Material You)

### Enabling Material 3
```dart
ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  useMaterial3: true,  // Enable Material Design 3
)
```

### Material 3 Color Features
- Dynamic color that adapts to wallpaper (Android 12+)
- More color roles for nuanced design
- Tonal palettes for each color
- Better accessibility with guaranteed contrast ratios

## Common Patterns

### Adaptive Colors
```dart
// Use surface colors for adaptive backgrounds
Card(
  // Automatically adapts to light/dark theme
  color: Theme.of(context).colorScheme.surfaceVariant,
  child: ListTile(
    title: Text('Adaptive Card'),
    // Text automatically uses onSurfaceVariant
  ),
)
```

### Status Colors
```dart
// Success (no built-in, use custom)
Container(
  color: Colors.green.shade100,
  child: Text('Success!', style: TextStyle(color: Colors.green.shade900)),
)

// Warning (no built-in, use custom)
Container(
  color: Colors.orange.shade100,
  child: Text('Warning!', style: TextStyle(color: Colors.orange.shade900)),
)

// Error (built-in)
Container(
  color: Theme.of(context).colorScheme.errorContainer,
  child: Text(
    'Error!',
    style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
  ),
)
```

### Creating a Color Palette Class
```dart
// For colors outside the theme system
class AppColors {
  // Semantic colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
  
  // Brand colors not in ColorScheme
  static const Color brandGold = Color(0xFFFFD700);
  static const Color brandSilver = Color(0xFFC0C0C0);
}
```

## Testing Different Seeds

### Quick Color Testing
```dart
// Try different seeds to find your brand colors
static const List<Color> seedOptions = [
  Colors.blue,
  Colors.green,
  Colors.deepOrange,
  Colors.purple,
  Colors.teal,
];

// In your app, cycle through them
ColorScheme.fromSeed(seedColor: seedOptions[selectedIndex])
```

## Properties Reference

### ColorScheme Properties
| Property | Description | Typical Use |
|----------|-------------|-------------|
| `primary` | Main brand color | App bars, buttons |
| `onPrimary` | Text/icons on primary | Button text |
| `primaryContainer` | Container using primary | Cards, containers |
| `secondary` | Accent color | FABs, selections |
| `tertiary` | Third accent | Special highlights |
| `error` | Error color | Validation, alerts |
| `surface` | Surface color | Cards, sheets |
| `background` | Background color | Scaffold background |
| `outline` | Borders/dividers | Outlined buttons |
| `shadow` | Shadow color | Elevation shadows |

### Brightness Options
| Value | Description |
|-------|-------------|
| `Brightness.light` | Light theme colors |
| `Brightness.dark` | Dark theme colors |

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| Colors look wrong in dark mode | Define separate light and dark ColorSchemes |
| Can't find the right color role | Check Material Design docs or use custom colors |
| Text not readable on backgrounds | Always use matching "on" colors (onPrimary, etc.) |
| Colors not updating with theme | Use Theme.of(context) not direct colors |
| Want custom brand colors | Use copyWith() to override specific colors |

## Best Practices

1. **Always use theme colors** - Avoid hard-coded Colors.blue
2. **Use "on" colors for text** - Ensures readability
3. **Test in both themes** - Check light and dark mode
4. **Start with fromSeed** - Generates harmonious palettes
5. **Override sparingly** - Keep most generated colors
6. **Document custom colors** - Explain why you override

## Resources

- [Material Design 3 Color System](https://m3.material.io/styles/color/overview)
- [Material Theme Builder](https://m3.material.io/theme-builder) - Web tool to preview color schemes
- [Color Roles Documentation](https://m3.material.io/styles/color/roles)

## When Covered in Course
- **[Week 3B](../../weekly/3B.md)** - ColorScheme.fromSeed and theme system
- Used throughout course for styling

## Related Topics
- [Themes & ThemeData](themes.md) - Complete theme system
- [Button Types & Styling](../widgets/button-types.md) - Using theme colors in buttons

---
*Last updated: Week 5 | IGME-340 Reference*
