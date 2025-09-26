# InkWell & GestureDetector Reference

## Quick Comparison
```dart
// InkWell - Material ripple effect on tap
InkWell(
  onTap: () {
    print('Tapped with ripple!');
  },
  child: Container(
    padding: EdgeInsets.all(12),
    child: Text('Tap me'),
  ),
)

// GestureDetector - Invisible, more gesture options
GestureDetector(
  onTap: () {
    print('Tapped!');
  },
  child: Container(
    color: Colors.blue,
    padding: EdgeInsets.all(12),
    child: Text('Tap me'),
  ),
)
```

## InkWell - Material Ripple Effects

### Basic InkWell
```dart
InkWell(
  onTap: () {
    // Handle tap
  },
  onLongPress: () {
    // Handle long press
  },
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Clickable with ripple'),
  ),
)
```

### InkWell with Visible Ripple
**Important:** For ripple to show, wrap InkWell in Material or Ink widget:

```dart
Material(
  color: Colors.blue,  // Background color goes here
  child: InkWell(
    onTap: () {},
    splashColor: Colors.white.withOpacity(0.3),  // Ripple color
    child: Container(
      padding: EdgeInsets.all(20),
      child: Text('Tap for ripple', style: TextStyle(color: Colors.white)),
    ),
  ),
)
```

### Custom Ripple Effects
```dart
InkWell(
  onTap: () {},
  splashColor: Colors.red,         // Ripple color
  highlightColor: Colors.yellow,   // Hold down color
  borderRadius: BorderRadius.circular(20),  // Ripple shape
  child: Container(
    padding: EdgeInsets.all(16),
    child: Text('Custom ripple'),
  ),
)
```

## GestureDetector - More Control

### Multiple Gestures
```dart
GestureDetector(
  onTap: () => print('Tap'),
  onDoubleTap: () => print('Double tap'),
  onLongPress: () => print('Long press'),
  onPanUpdate: (details) {
    print('Dragging: ${details.delta}');
  },
  child: Container(
    width: 200,
    height: 200,
    color: Colors.green,
    child: Center(child: Text('Try different gestures')),
  ),
)
```

### Drag Gestures
```dart
GestureDetector(
  onVerticalDragUpdate: (details) {
    setState(() {
      position += details.delta.dy;
    });
  },
  onHorizontalDragEnd: (details) {
    // Detect swipe direction
    if (details.velocity.pixelsPerSecond.dx > 0) {
      print('Swiped right');
    }
  },
  child: Container(
    color: Colors.blue,
    child: Text('Drag me'),
  ),
)
```

## Common Patterns

### Making Any Widget Clickable (Project 1 Pattern!)
```dart
// Turn a styled container into a button
GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Item Details'),
        content: Text('You tapped the item!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  },
  child: Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.amber,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.black),
    ),
    child: Text('Clickable Item Box'),
  ),
)
```

### Card with InkWell
```dart
Card(
  child: InkWell(
    onTap: () {
      // Navigate or show details
    },
    borderRadius: BorderRadius.circular(4),  // Match card radius
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Icon(Icons.shopping_cart),
          Text('Shop Now'),
        ],
      ),
    ),
  ),
)
```

### Icon with Tap Feedback
```dart
Material(
  color: Colors.transparent,
  child: InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(20),
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Icon(Icons.favorite_border),
    ),
  ),
)
```

## When to Use Which?

| Use InkWell When | Use GestureDetector When |
|------------------|-------------------------|
| Want Material ripple effect | Need multiple gesture types |
| Following Material Design | Need drag/swipe detection |
| Making cards/list items clickable | No visual feedback needed |
| Want splash color feedback | Working with custom painted widgets |

## Common Issues

### InkWell Ripple Not Showing?
```dart
// ❌ PROBLEM - Color blocks ripple
InkWell(
  onTap: () {},
  child: Container(
    color: Colors.blue,  // This blocks the ripple!
    child: Text('No ripple visible'),
  ),
)

// ✅ SOLUTION - Use Material or Ink
Material(
  color: Colors.blue,  // Color goes here
  child: InkWell(
    onTap: () {},
    child: Container(  // No color here
      padding: EdgeInsets.all(16),
      child: Text('Ripple works!'),
    ),
  ),
)
```

### GestureDetector Not Working?
- Check if another gesture detector is intercepting
- Ensure child has actual size (not zero)
- Try wrapping in Container with color to debug

## Properties Quick Reference

### InkWell Main Properties
| Property | Type | Purpose |
|----------|------|---------|
| `onTap` | VoidCallback? | Single tap handler |
| `onDoubleTap` | VoidCallback? | Double tap handler |
| `onLongPress` | VoidCallback? | Long press handler |
| `splashColor` | Color? | Ripple color |
| `highlightColor` | Color? | Press and hold color |
| `borderRadius` | BorderRadius? | Ripple shape |

### GestureDetector Main Properties
| Property | Type | Purpose |
|----------|------|---------|
| `onTap` | GestureTapCallback? | Single tap |
| `onDoubleTap` | GestureTapCallback? | Double tap |
| `onLongPress` | GestureLongPressCallback? | Long press |
| `onPanUpdate` | GestureDragUpdateCallback? | Drag movement |
| `onScaleUpdate` | GestureScaleUpdateCallback? | Pinch zoom |

[Full GestureDetector documentation →](https://api.flutter.dev/flutter/widgets/GestureDetector-class.html)

## When Covered in Course
- **[Week 4B](../../weekly/4B.md)** - InkWell and GestureDetector basics
- **[Week 5B](../../weekly/5B.md)** - Using GestureDetector for Project 1

---
*Last updated: Week 5 | IGME-340 Reference*
