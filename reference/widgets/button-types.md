# Button Types Reference

## Quick Comparison
```dart
ElevatedButton(      // Filled background, raised appearance
  onPressed: () {},
  child: Text('Elevated'),
)

OutlinedButton(      // Border, no fill
  onPressed: () {},
  child: Text('Outlined'),
)

TextButton(          // No border or fill, just text
  onPressed: () {},
  child: Text('Text'),
)

IconButton(          // Just an icon, often used in app bars
  onPressed: () {},
  icon: Icon(Icons.favorite),
)
```

## Core Concepts

### Button States
All buttons can be in different states:
```dart
ElevatedButton(
  onPressed: () {
    // Button is enabled
  },
  child: Text('Enabled'),
)

ElevatedButton(
  onPressed: null,  // Button is disabled
  child: Text('Disabled'),
)
```

### Button Callbacks
```dart
// Inline anonymous function
ElevatedButton(
  onPressed: () {
    print('Button pressed!');
  },
  child: Text('Press Me'),
)

// Reference to method
ElevatedButton(
  onPressed: _handlePress,  // No () - passing reference not calling
  child: Text('Press Me'),
)

void _handlePress() {
  print('Button pressed!');
}

// With setState for UI updates
ElevatedButton(
  onPressed: () {
    setState(() {
      counter++;
    });
  },
  child: Text('Increment'),
)
```

## Styling Buttons

### Using styleFrom() Method
```dart
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.purple,     // Button color
    foregroundColor: Colors.yellow,     // Text/icon color
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    textStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    elevation: 10,                      // Shadow depth
    shape: RoundedRectangleBorder(      // Button shape
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  child: Text('Styled Button'),
)
```

### OutlinedButton Styling
```dart
OutlinedButton(
  onPressed: () {},
  style: OutlinedButton.styleFrom(
    foregroundColor: Colors.blue,
    side: BorderSide(                   // Border styling
      color: Colors.blue,
      width: 2,
    ),
    padding: EdgeInsets.all(16),
  ),
  child: Text('Custom Outline'),
)
```

### TextButton Styling
```dart
TextButton(
  onPressed: () {},
  style: TextButton.styleFrom(
    foregroundColor: Colors.red,
    padding: EdgeInsets.all(20),
    textStyle: TextStyle(
      decoration: TextDecoration.underline,
    ),
  ),
  child: Text('Underlined Text Button'),
)
```

## Button Variants

### Button with Icon
```dart
// ElevatedButton with icon
ElevatedButton.icon(
  onPressed: () {},
  icon: Icon(Icons.send),
  label: Text('Send'),
)

// OutlinedButton with icon
OutlinedButton.icon(
  onPressed: () {},
  icon: Icon(Icons.download),
  label: Text('Download'),
)

// TextButton with icon
TextButton.icon(
  onPressed: () {},
  icon: Icon(Icons.add),
  label: Text('Add Item'),
)
```

### IconButton
```dart
IconButton(
  onPressed: () {},
  icon: Icon(Icons.volume_up),
  color: Colors.blue,
  iconSize: 30,
  tooltip: 'Increase volume',  // Long press tooltip
  padding: EdgeInsets.all(12),
)
```

### FloatingActionButton
```dart
FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
  backgroundColor: Colors.green,
)

// Extended version with text
FloatingActionButton.extended(
  onPressed: () {},
  icon: Icon(Icons.navigation),
  label: Text('Navigate'),
)
```

## Common Patterns

### Full Width Button
```dart
SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () {},
    child: Text('Full Width Button'),
  ),
)
```

### Button Row
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    TextButton(
      onPressed: () {},
      child: Text('Cancel'),
    ),
    ElevatedButton(
      onPressed: () {},
      child: Text('OK'),
    ),
  ],
)
```

### Loading Button
```dart
ElevatedButton(
  onPressed: isLoading ? null : _handleSubmit,
  child: isLoading 
    ? SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Colors.white,
        ),
      )
    : Text('Submit'),
)
```

## Theme-Based Styling

### Global Button Theme
```dart
MaterialApp(
  theme: ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.purple,
        side: BorderSide(color: Colors.purple),
      ),
    ),
  ),
)
```

## Properties Quick Reference

### Common Properties (All Buttons)
| Property | Type | Description |
|----------|------|-------------|
| `onPressed` | VoidCallback? | Function called on tap (null = disabled) |
| `child` | Widget | Button content (usually Text or Icon) |
| `style` | ButtonStyle? | Visual styling |
| `autofocus` | bool | Request focus on build |
| `clipBehavior` | Clip | How to clip content |

### styleFrom() Parameters
| Parameter | Type | Use Case |
|-----------|------|----------|
| `backgroundColor` | Color? | Button fill color (Elevated) |
| `foregroundColor` | Color? | Text and icon color |
| `padding` | EdgeInsets? | Internal spacing |
| `textStyle` | TextStyle? | Text formatting |
| `elevation` | double? | Shadow depth |
| `shape` | OutlinedBorder? | Button shape/borders |
| `side` | BorderSide? | Border styling (Outlined) |
| `minimumSize` | Size? | Minimum button dimensions |

## Common Mistakes & Solutions

| Issue | Solution |
|-------|----------|
| Button not responding | Check `onPressed` is not null |
| Can't change disabled color | Use `onSurface` property in styleFrom() |
| Icon and text misaligned | Use `.icon()` constructor variants |
| Button too small for touch | Set `minimumSize` or add padding |
| Style not applying | Check theme overrides inline styles |

## Choosing the Right Button

| Use Case | Recommended Button |
|----------|-------------------|
| Primary action | ElevatedButton |
| Secondary action | OutlinedButton |
| Low-emphasis action | TextButton |
| Toolbar/AppBar | IconButton |
| Main screen action | FloatingActionButton |
| Destructive action | TextButton (with red text) |

## When Covered in Course
- **[Week 3B](../../weekly/3B.md)** - Button types and basic styling
- **[Week 4A](../../weekly/4A.md)** - Button states with setState
- **[Week 9A](../../weekly/9A.md)** - FloatingActionButton

---
*Last updated: Week 5 | IGME-340 Reference*
