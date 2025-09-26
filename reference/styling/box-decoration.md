# BoxDecoration Reference

## Quick Example
```dart
Container(
  width: 200,
  height: 200,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: Colors.black, width: 2),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: Center(child: Text('Styled Box')),
)
```

## Common Use Cases

### Rounded Corners
```dart
BoxDecoration(
  borderRadius: BorderRadius.circular(10), // All corners
  // OR
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
)
```

### Borders
```dart
BoxDecoration(
  border: Border.all(
    color: Colors.red,
    width: 3,
  ),
  // OR individual sides
  border: Border(
    top: BorderSide(color: Colors.blue, width: 2),
    bottom: BorderSide(color: Colors.green, width: 4),
  ),
)
```

### Gradients
```dart
BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.blue, Colors.purple],
  ),
  // OR radial gradient
  gradient: RadialGradient(
    colors: [Colors.yellow, Colors.orange],
  ),
)
```

### Shadows
```dart
BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 10,      // How blurry
      spreadRadius: 2,     // How much it spreads
      offset: Offset(5, 5), // X and Y offset
    ),
  ],
)
```

### Background Images
```dart
BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/background.png'),
    fit: BoxFit.cover,  // or .contain, .fill, .fitWidth, etc.
  ),
)
```

## Important Rules

⚠️ **Cannot have both `color` in Container AND BoxDecoration:**
```dart
// ❌ WRONG - This will error!
Container(
  color: Colors.blue,  // Don't put color here
  decoration: BoxDecoration(
    color: Colors.red,  // if you have decoration
  ),
)

// ✅ CORRECT
Container(
  decoration: BoxDecoration(
    color: Colors.blue,  // Put color inside BoxDecoration
  ),
)
```

## Common Patterns

### Card-like Container
```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 6,
        offset: Offset(0, 2),
      ),
    ],
  ),
  child: Text('Card Content'),
)
```

### Circle Shape
```dart
Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.blue,
  ),
)
```

### Gradient Button Style
```dart
Container(
  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.purple, Colors.blue],
    ),
    borderRadius: BorderRadius.circular(30),
  ),
  child: Text(
    'Gradient Button',
    style: TextStyle(color: Colors.white),
  ),
)
```

## Properties Reference

| Property | Type | Description |
|----------|------|-------------|
| `color` | Color | Background color (can't use if gradient is set) |
| `gradient` | Gradient | LinearGradient or RadialGradient |
| `border` | Border | Border.all() or custom Border() |
| `borderRadius` | BorderRadius | Rounded corners |
| `boxShadow` | List<BoxShadow> | Drop shadows |
| `shape` | BoxShape | .rectangle (default) or .circle |
| `image` | DecorationImage | Background image |

## When Covered in Course
- **[Week 4A](../../weekly/4A.md)** - First introduction with borders and shadows
- **[Week 5A](../../weekly/5A.md)** - Advanced styling with gradients (if covered)
- **[Project 1](../../projects/design_to_spec.md)** - Used for gradient backgrounds

## Common Errors & Solutions

| Error | Solution |
|-------|----------|
| "Cannot provide both a color and a decoration" | Remove color from Container, put it in BoxDecoration |
| Image doesn't show | Check pubspec.yaml has asset declared |
| Shadow not visible | Ensure parent has enough space for shadow |
| Gradient looks wrong | Check begin/end alignment directions |

## Try It Yourself
1. Create a container that looks like a playing card
2. Make a circular profile picture with a border
3. Design a gradient background for an app header
4. Create a neumorphic (soft UI) effect with shadows

---
*Last updated: Week 5 | IGME-340 Reference*
