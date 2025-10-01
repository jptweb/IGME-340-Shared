# Padding & SizedBox Reference

## Quick Examples

### Padding - Add space around a widget
```dart
Padding(
  padding: EdgeInsets.all(20),  // 20 pixels on all sides
  child: Text('I have breathing room!'),
)
```

### SizedBox - Control exact dimensions or add space
```dart
// Fixed size container
SizedBox(
  width: 200,
  height: 100,
  child: Container(color: Colors.blue),
)

// Spacer between widgets
Column(
  children: [
    Text('First'),
    SizedBox(height: 20),  // 20 pixel gap
    Text('Second'),
  ],
)
```

## Core Concepts

### Padding Widget
The Padding widget adds empty space around its child. Unlike margins in CSS, Flutter uses Padding widgets to create space between elements.

```dart
// Uniform padding on all sides
Padding(
  padding: EdgeInsets.all(16),
  child: Container(
    color: Colors.red,
    child: Text('Padded text'),
  ),
)

// Different padding per side
Padding(
  padding: EdgeInsets.only(
    left: 20,
    top: 10,
    right: 20,
    bottom: 30,
  ),
  child: Text('Custom padding'),
)

// Symmetric padding (horizontal/vertical)
Padding(
  padding: EdgeInsets.symmetric(
    horizontal: 30,  // left & right
    vertical: 15,    // top & bottom
  ),
  child: Text('Symmetric padding'),
)
```

### SizedBox Widget
SizedBox serves two main purposes: controlling exact dimensions and creating fixed spacing.

```dart
// Control exact size
SizedBox(
  width: 150,
  height: 150,
  child: Container(
    color: Colors.blue,
    child: Center(child: Text('Fixed size')),
  ),
)

// Force infinite width (like width: 100% in CSS)
SizedBox(
  width: double.infinity,
  height: 50,
  child: ElevatedButton(
    onPressed: () {},
    child: Text('Full Width Button'),
  ),
)

// Create spacing in Column/Row
Column(
  children: [
    Container(color: Colors.red, height: 100),
    SizedBox(height: 20),  // Vertical space
    Container(color: Colors.blue, height: 100),
  ],
)
```

## EdgeInsets Patterns

### All EdgeInsets Options
```dart
// All sides equal
EdgeInsets.all(20)

// Each side individually
EdgeInsets.only(
  left: 10,
  top: 20,
  right: 10,
  bottom: 30,
)

// Horizontal and vertical
EdgeInsets.symmetric(
  horizontal: 20,  // left + right
  vertical: 10,    // top + bottom
)

// Specific values for each side
EdgeInsets.fromLTRB(
  10,  // left
  20,  // top
  30,  // right
  40,  // bottom
)

// No padding
EdgeInsets.zero
```

## Common Patterns

### Card with Padding
```dart
Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Text('Card Title', style: TextStyle(fontSize: 20)),
        SizedBox(height: 10),
        Text('Card content goes here'),
      ],
    ),
  ),
)
```

### Responsive Button Row
```dart
Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: Row(
    children: [
      Expanded(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Cancel'),
        ),
      ),
      SizedBox(width: 16),  // Gap between buttons
      Expanded(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Confirm'),
        ),
      ),
    ],
  ),
)
```

### ListView with Item Spacing
```dart
ListView(
  padding: EdgeInsets.all(8),  // Padding around entire list
  children: [
    Container(height: 100, color: Colors.red),
    SizedBox(height: 8),  // Space between items
    Container(height: 100, color: Colors.blue),
    SizedBox(height: 8),
    Container(height: 100, color: Colors.green),
  ],
)
```

### Safe Area Padding
```dart
// Avoid system UI (notches, status bar)
SafeArea(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Text('Content safe from system UI'),
      ],
    ),
  ),
)
```

## SizedBox vs Container

| Use SizedBox When | Use Container When |
|-------------------|-------------------|
| Only setting width/height | Need decoration (color, border, etc.) |
| Creating spacing between widgets | Need padding AND decoration |
| Forcing specific dimensions | Need transform or rotation |
| Performance matters (SizedBox is lighter) | Need margin (though avoid if possible) |

```dart
// SizedBox for spacing (preferred)
Column(
  children: [
    Text('First'),
    SizedBox(height: 20),
    Text('Second'),
  ],
)

// Container for decoration + sizing
Container(
  width: 200,
  height: 200,
  padding: EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Text('Decorated'),
)
```

## Properties Reference

### Padding Properties
| Property | Type | Description |
|----------|------|-------------|
| `padding` | EdgeInsetsGeometry | The amount of space to add |
| `child` | Widget? | The widget to add padding around |

### SizedBox Properties
| Property | Type | Description |
|----------|------|-------------|
| `width` | double? | Exact width (null = child's width) |
| `height` | double? | Exact height (null = child's height) |
| `child` | Widget? | Widget to constrain |

### EdgeInsets Methods
| Method | Parameters | Use Case |
|--------|------------|----------|
| `all()` | double | Same padding all sides |
| `only()` | left, top, right, bottom | Individual side control |
| `symmetric()` | horizontal, vertical | Paired sides |
| `fromLTRB()` | left, top, right, bottom | All sides in order |
| `zero` | (constant) | No padding |

## Important Rules

⚠️ **Padding vs Margin**
```dart
// ❌ AVOID - Container margin can cause confusion
Container(
  margin: EdgeInsets.all(20),
  color: Colors.red,
)

// ✅ PREFER - Explicit Padding widget
Padding(
  padding: EdgeInsets.all(20),
  child: Container(
    color: Colors.red,
  ),
)
```

⚠️ **SizedBox with No Child**
```dart
// ✅ CORRECT - Empty SizedBox for spacing
Column(
  children: [
    Text('Above'),
    SizedBox(height: 50),  // Just space, no child needed
    Text('Below'),
  ],
)
```

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| Padding not visible | Check if parent is constraining size |
| SizedBox ignored | Parent might be forcing different constraints |
| Overflow with padding | Wrap in Expanded or Flexible |
| Padding looks different on devices | Use MediaQuery for responsive padding |
| Column spacing uneven | Use consistent SizedBox heights |

## Responsive Padding

```dart
// Adjust padding based on screen size
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final horizontalPadding = screenWidth > 600 ? 32.0 : 16.0;
  
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
    child: Text('Responsive padding'),
  );
}
```

## Best Practices

1. **Use SizedBox for spacing** - Cleaner than empty Containers
2. **Padding widget over Container padding** - More explicit and readable
3. **Consistent spacing** - Define spacing constants for your app
4. **SafeArea for system UI** - Always consider notches and status bars
5. **Test on different screen sizes** - Padding might need adjustment

```dart
// Define consistent spacing
class AppSpacing {
  static const double small = 8;
  static const double medium = 16;
  static const double large = 24;
}

// Use throughout app
Padding(
  padding: EdgeInsets.all(AppSpacing.medium),
  child: Column(
    children: [
      Text('Consistent'),
      SizedBox(height: AppSpacing.small),
      Text('Spacing'),
    ],
  ),
)
```

## When Covered in Course
- **[Week 3A](../../weekly/3A.md)** - First introduced with layout widgets
- Used throughout course in various contexts

## Related Topics
- [Container Basics](container-basics.md) - Container's padding parameter
- [Layout Widgets](layout-widgets.md) - Using with Row/Column
- [SingleChildScrollView](singlechildscrollview.md) - Padding in scrollable content

---
*Last updated: Week 5 | IGME-340 Reference*
