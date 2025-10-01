# Stack Widget Reference

## Quick Example
```dart
// Basic Stack with layered containers
Stack(
  alignment: Alignment.center,
  children: [
    Container(color: Colors.red, width: 300, height: 300),    // Bottom layer
    Container(color: Colors.green, width: 200, height: 200),  // Middle layer
    Container(color: Colors.yellow, width: 100, height: 100), // Top layer
  ],
)
```

## Core Concepts

### Layer Order
Children are rendered in array order - first child is the bottom layer, last child is the top layer.
```dart
Stack(
  children: [
    // These stack from bottom to top
    BottomWidget(),   // Renders first (bottom)
    MiddleWidget(),   // Renders second
    TopWidget(),      // Renders last (top)
  ],
)
```

### Stack Alignment
Controls default positioning of non-positioned children:
```dart
Stack(
  alignment: Alignment.bottomRight,  // All children align to bottom-right
  children: [
    Container(width: 200, height: 200, color: Colors.blue),
    Container(width: 100, height: 100, color: Colors.red),
  ],
)
```

### Positioned Widget
For precise placement within the Stack:
```dart
Stack(
  children: [
    Container(color: Colors.blue, width: 200, height: 200),
    Positioned(
      top: 10,
      left: 10,
      child: Container(color: Colors.red, width: 50, height: 50),
    ),
    Positioned(
      bottom: 10,
      right: 10,
      child: Container(color: Colors.green, width: 50, height: 50),
    ),
  ],
)
```

## Common Patterns

### Overflow with ClipBehavior
```dart
Stack(
  clipBehavior: Clip.none,  // Allow content to overflow Stack boundaries
  children: [
    Container(color: Colors.blue, width: 200, height: 200),
    Positioned(
      right: -50,   // Negative values create overflow
      bottom: -50,
      child: Container(color: Colors.orange, width: 100, height: 100),
    ),
  ],
)
```

### Badge on Icon Pattern
```dart
Stack(
  alignment: Alignment.center,
  children: [
    Icon(Icons.shopping_cart, size: 50),
    Positioned(
      right: 0,
      top: 0,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text('3', style: TextStyle(color: Colors.white, fontSize: 10)),
      ),
    ),
  ],
)
```

### Text Over Image
```dart
Stack(
  children: [
    Image.network('https://example.com/image.jpg'),
    Positioned(
      bottom: 20,
      left: 20,
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.black54,
        child: Text(
          'Image Caption',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ),
  ],
)
```

## Properties Reference

| Property | Type | Purpose |
|----------|------|---------|
| alignment | AlignmentGeometry | Default position for non-positioned children |
| textDirection | TextDirection | Direction for alignment resolution |
| fit | StackFit | How non-positioned children should be sized |
| clipBehavior | Clip | Whether to clip children that overflow |
| children | List<Widget> | The widgets to stack (bottom to top order) |

## Important Rules

⚠️ **Positioned must be direct child of Stack**
```dart
// ❌ WRONG - Positioned inside Container
Stack(
  children: [
    Container(
      child: Positioned(...)  // Won't work!
    ),
  ],
)

// ✅ CORRECT - Positioned as direct child
Stack(
  children: [
    Positioned(
      child: Container(...),
    ),
  ],
)
```

⚠️ **Stack takes size of largest non-positioned child**
```dart
Stack(
  children: [
    Container(width: 300, height: 300),  // Stack will be 300x300
    Positioned(
      top: 400,  // This can extend beyond Stack
      child: Container(width: 50, height: 50),
    ),
  ],
)
```

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| Positioned widget not working | Ensure it's a direct child of Stack |
| Content getting clipped | Set `clipBehavior: Clip.none` |
| Stack not sizing correctly | Add explicit size or wrap in SizedBox |
| Can't center Stack content | Wrap Stack in Center widget |
| Z-order issues | Remember: last child = topmost layer |

## When Covered in Course
- **[Week 5A](../../weekly/5A.md)** - Introduction to Stack widget, Positioned, and clipBehavior
- **Project 1** - Useful for layering images and gradient backgrounds

## External Resources
- [Flutter Stack Documentation](https://api.flutter.dev/flutter/widgets/Stack-class.html)
- [Positioned Widget Documentation](https://api.flutter.dev/flutter/widgets/Positioned-class.html)
- [Flutter Layout Cheat Sheet](https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e)

---
*Last updated: Week 5A | IGME-340 Reference*