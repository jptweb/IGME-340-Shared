# Container Widget Reference

## Quick Example
```dart
Container(
  width: 200,
  height: 100,
  color: Colors.blue,
  child: Text('Basic Container'),
)
```

## Core Concepts

### Size Behavior
Containers behave differently depending on their context and properties:

```dart
// Container with no size constraints fills available space
Container(
  color: Colors.red,  // Will fill parent
)

// Container with child but no size wraps content
Container(
  color: Colors.green,
  child: Text('I determine the size'),
)

// Container with explicit size
Container(
  width: 150,
  height: 150,
  color: Colors.blue,
)
```

### Alignment & Positioning
```dart
// Centering child within container
Container(
  width: 200,
  height: 200,
  color: Colors.grey[300],
  alignment: Alignment.center,  // or .topLeft, .bottomRight, etc.
  child: Text('Centered'),
)

// Custom alignment
Container(
  alignment: Alignment(0.5, -0.5),  // (x, y) from -1.0 to 1.0
  child: Icon(Icons.star),
)
```

### Padding & Margin
```dart
Container(
  margin: EdgeInsets.all(20),        // Outside space
  padding: EdgeInsets.all(16),       // Inside space
  color: Colors.blue,
  child: Text('Spaced out'),
)

// Different padding patterns
EdgeInsets.all(16)                   // All sides
EdgeInsets.symmetric(
  horizontal: 20, 
  vertical: 10
)
EdgeInsets.only(
  left: 10, 
  top: 20, 
  right: 10, 
  bottom: 5
)
EdgeInsets.fromLTRB(10, 20, 10, 5)  // Left, Top, Right, Bottom
```

### Size Constraints
```dart
Container(
  constraints: BoxConstraints(
    minWidth: 100,
    maxWidth: 300,
    minHeight: 50,
    maxHeight: 200,
  ),
  color: Colors.orange,
  child: Text('Flexible size based on content'),
)
```

## Common Patterns

### Full Width Container
```dart
Container(
  width: double.infinity,  // Takes all available width
  height: 60,
  color: Colors.blue,
  child: Center(child: Text('Full Width')),
)
```

### Circular Container
```dart
Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
    color: Colors.red,
    shape: BoxShape.circle,
  ),
  child: Center(
    child: Text('A', style: TextStyle(color: Colors.white)),
  ),
)
```

### Container as Spacer
```dart
Column(
  children: [
    Text('Top'),
    Container(height: 20),  // Vertical spacer
    Text('Bottom'),
  ],
)

Row(
  children: [
    Text('Left'),
    Container(width: 30),   // Horizontal spacer
    Text('Right'),
  ],
)
```

### Responsive Container
```dart
Container(
  width: MediaQuery.of(context).size.width * 0.8,  // 80% of screen width
  height: MediaQuery.of(context).size.height * 0.3, // 30% of screen height
  color: Colors.purple,
)
```

## Properties Reference

| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `child` | Widget? | Content inside container | null |
| `width` | double? | Fixed width | null (wrap content) |
| `height` | double? | Fixed height | null (wrap content) |
| `color` | Color? | Background color (can't use with decoration) | null |
| `alignment` | Alignment? | How to align child | null |
| `padding` | EdgeInsets? | Inner spacing | null |
| `margin` | EdgeInsets? | Outer spacing | null |
| `decoration` | BoxDecoration? | Advanced styling | null |
| `constraints` | BoxConstraints? | Size constraints | null |
| `transform` | Matrix4? | Transformation matrix | null |

## Important Rules

⚠️ **Cannot use both `color` and `decoration`:**
```dart
// ❌ WRONG
Container(
  color: Colors.blue,
  decoration: BoxDecoration(...),  // Error!
)

// ✅ CORRECT - Put color in decoration
Container(
  decoration: BoxDecoration(
    color: Colors.blue,
  ),
)
```

⚠️ **Container with no properties does nothing:**
```dart
// This container is invisible and adds no value
Container(
  child: Text('Hello'),
)

// Better to just use the Text widget directly
Text('Hello')
```

## Container vs Other Widgets

| Use Container When | Use Alternative When |
|-------------------|---------------------|
| Need background color | Just padding → use `Padding` widget |
| Need specific size | Just centering → use `Center` widget |
| Need margin AND padding | Just sizing → use `SizedBox` widget |
| Need decoration (borders, etc.) | Just aligning → use `Align` widget |

## Common Errors & Solutions

| Error | Solution |
|-------|----------|
| Container fills entire screen | Wrap in `Center` or give explicit size |
| Container not visible | Add color or border to see it |
| Child overflows container | Check size constraints or wrap child in `Flexible` |
| Decoration color conflict | Remove `color` property, use `decoration` only |

## Debugging Tips

To visualize container bounds during development:
```dart
Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.red, width: 2),  // Debug border
  ),
  child: YourWidget(),
)
```

## When Covered in Course
- **[Week 3A](../../weekly/3A.md)** - Container basics and sizing
- **[Week 4A](../../weekly/4A.md)** - Container with BoxDecoration

---
*Last updated: Week 5 | IGME-340 Reference*
