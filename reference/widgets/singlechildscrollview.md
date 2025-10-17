# SingleChildScrollView Reference

## Quick Fix for Overflow
```dart
// When you see yellow/black overflow stripes, wrap in SingleChildScrollView
SingleChildScrollView(
  child: Column(
    children: [
      Container(height: 200, color: Colors.red),
      Container(height: 200, color: Colors.green),
      Container(height: 200, color: Colors.blue),
      Container(height: 200, color: Colors.yellow),
      // More containers that overflow screen
    ],
  ),
)
```

## Core Concept
Flutter doesn't automatically add scrolling when content overflows. You must explicitly wrap overflowing content in a scrollable widget.

## Vertical Scrolling (Default)

### Basic Column Scrolling
```dart
// From Week 3A class example!
SingleChildScrollView(
  child: Column(
    children: [
      for (int i = 0; i < 8; i++)
        Container(
          height: 200,
          color: Colors.primaries[i],
          child: Center(
            child: Text('Item ${i + 1}'),
          ),
        ),
    ],
  ),
)
```

### With Padding
```dart
SingleChildScrollView(
  padding: EdgeInsets.all(16),  // Adds padding to scrollable area
  child: Column(
    children: [
      // Your widgets
    ],
  ),
)
```

## Horizontal Scrolling

### Scrollable Row
```dart
SingleChildScrollView(
  scrollDirection: Axis.horizontal,  // Enable horizontal scroll
  child: Row(
    children: [
      for (int i = 0; i < 10; i++)
        Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.all(8),
          color: Colors.primaries[i % Colors.primaries.length],
        ),
    ],
  ),
)
```

## Common Patterns

### Form with Keyboard Avoidance
```dart
Scaffold(
  body: SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(decoration: InputDecoration(labelText: 'Name')),
          TextField(decoration: InputDecoration(labelText: 'Email')),
          TextField(decoration: InputDecoration(labelText: 'Phone')),
          // More fields - keyboard won't cover them
        ],
      ),
    ),
  ),
)
```

> **📖 Pro Tip:** Combine with [Focus Management](../input-forms/focus-management.md) for professional form navigation and keyboard control.

### Card List (Before Learning ListView)
```dart
SingleChildScrollView(
  child: Column(
    children: [
      for (var item in items)
        Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            title: Text(item.title),
            subtitle: Text(item.subtitle),
          ),
        ),
    ],
  ),
)
```

## Properties

| Property | Type | Purpose | Default |
|----------|------|---------|---------|
| `child` | Widget | Content to make scrollable | Required |
| `scrollDirection` | Axis | Vertical or horizontal | Axis.vertical |
| `reverse` | bool | Reverse scroll direction | false |
| `padding` | EdgeInsets? | Padding around content | null |
| `physics` | ScrollPhysics? | Scroll behavior | Platform default |

## iOS vs Android Behavior

Flutter automatically uses platform-appropriate scroll physics:
- **iOS**: Elastic bounce effect at edges
- **Android**: Glow effect at edges

## Common Issues

### Column Inside Column
```dart
// ❌ PROBLEM - Inner column causes issues
Column(
  children: [
    Text('Header'),
    SingleChildScrollView(
      child: Column(  // Can cause render issues
        children: [...],
      ),
    ),
  ],
)

// ✅ SOLUTION - Use Expanded
Column(
  children: [
    Text('Header'),
    Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [...],
        ),
      ),
    ),
  ],
)
```

### When NOT to Use
- For lists of similar items → Use `ListView` instead (Week 6B)
- For grids → Use `GridView` instead (Week 7B)
- For single widgets that fit on screen → Not needed

## Debugging Tip
```dart
// Make scroll area visible during development
Container(
  decoration: BoxDecoration(
    border: Border.all(color: Colors.red, width: 2),
  ),
  child: SingleChildScrollView(
    child: YourContent(),
  ),
)
```

## When Covered in Course
- **[Week 3A](../../weekly/3A.md)** - Fixing overflow with scrolling
- **[Week 5B](../../weekly/5B.md)** - Used in Project 1 for scrollable text
- **[Week 8B](../../weekly/8B.md)** - Preventing keyboard from covering form fields

## Related Topics
- [Focus Management](../input-forms/focus-management.md) - Keyboard control in forms (commonly paired with SingleChildScrollView)
- [TextField Basics](../input-forms/textfield-basics.md) - Text input widgets
- [ListView Basics](listview-basics.md) - Better for long lists of similar items
- [Expanded & Flexible](expanded-flexible.md) - Use with Column + SingleChildScrollView

## External Resources
- [Flutter Scrolling Documentation](https://docs.flutter.dev/ui/layout/scrolling)
- [ScrollPhysics Options](https://api.flutter.dev/flutter/widgets/ScrollPhysics-class.html)

---
*Last updated: Week 5 | IGME-340 Reference*
