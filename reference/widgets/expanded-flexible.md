# Expanded & Flexible Widgets

## Quick Example

```dart
Row(
  children: [
    Container(width: 100, height: 100, color: Colors.red),
    SizedBox(width: 20),
    Expanded(
      child: Container(
        height: 100,
        color: Colors.blue,
        child: Text('This fills remaining width'),
      ),
    ),
  ],
)
```

## Core Concepts

### The Problem: Hard-Coded Dimensions
```dart
// ❌ BREAKS ON DIFFERENT SCREEN SIZES
Row(
  children: [
    Container(width: 100, height: 100, color: Colors.red),
    Container(width: 250, height: 100, color: Colors.blue),  // What if screen is 320px wide?
  ],
)
```

**Issues with hard-coded widths:**
- Breaks when rotating device (portrait → landscape)
- Looks wrong on tablets vs phones
- Causes overflow errors on small screens
- Unprofessional results

### The Solution: Expanded Widget
```dart
// ✅ ADAPTS TO ANY SCREEN SIZE
Row(
  children: [
    Container(width: 100, height: 100, color: Colors.red),
    SizedBox(width: 20),
    Expanded(
      child: Container(
        height: 100,  // Only height specified!
        color: Colors.blue,
        child: Text('Automatically fills remaining space'),
      ),
    ),
  ],
)
```

**What Expanded does:**
- Calculates: `remaining space = total width - fixed widths`
- Child fills exactly the calculated space
- Recalculates automatically on rotation or screen size change

### Expanded in Columns (Vertical)
```dart
Column(
  children: [
    Container(height: 100, color: Colors.red),
    Expanded(
      child: Container(
        color: Colors.blue,
        child: Text('Fills remaining vertical space'),
      ),
    ),
    Container(height: 100, color: Colors.green),
  ],
)
```

**Use Cases:**
- Main content area that adapts to different screen heights
- Scrollable sections that fill available space
- Chat message lists that grow/shrink with keyboard

## Common Patterns

### Responsive Three-Column Layout
```dart
Row(
  children: [
    Container(width: 80, height: 100, color: Colors.red),
    SizedBox(width: 10),
    Expanded(
      child: Container(
        height: 100,
        color: Colors.blue,
        child: Text('Middle section adapts to screen width'),
      ),
    ),
    SizedBox(width: 10),
    Container(width: 80, height: 100, color: Colors.green),
  ],
)
```

### Multiple Expanded Widgets (Equal Distribution)
```dart
Row(
  children: [
    Expanded(
      child: Container(height: 100, color: Colors.red),
    ),
    Expanded(
      child: Container(height: 100, color: Colors.blue),
    ),
    Expanded(
      child: Container(height: 100, color: Colors.green),
    ),
  ],
)
// Each container gets 1/3 of the available width
```

### Weighted Distribution with `flex`
```dart
Row(
  children: [
    Expanded(
      flex: 1,  // Gets 1 part
      child: Container(height: 100, color: Colors.red),
    ),
    Expanded(
      flex: 2,  // Gets 2 parts (twice as wide)
      child: Container(height: 100, color: Colors.blue),
    ),
    Expanded(
      flex: 1,  // Gets 1 part
      child: Container(height: 100, color: Colors.green),
    ),
  ],
)
// Blue gets 50% width, red and green each get 25%
```

### Form Layout with Expanded
```dart
Column(
  children: [
    Container(height: 100, color: Colors.blue),  // Header
    Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Name')),
            TextField(decoration: InputDecoration(labelText: 'Email')),
            TextField(decoration: InputDecoration(labelText: 'Message')),
            // More fields...
          ],
        ),
      ),
    ),
    Container(
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Submit'),
      ),
    ),
  ],
)
```

### Responsive Search Bar
```dart
Row(
  children: [
    Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          border: OutlineInputBorder(),
        ),
      ),
    ),
    SizedBox(width: 10),
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    ),
  ],
)
```

## Flexible Widget (Advanced)

`Flexible` is like `Expanded`, but with more control over sizing behavior.

### Expanded vs Flexible
```dart
// Expanded - MUST fill the space
Row(
  children: [
    Container(width: 100, height: 50, color: Colors.red),
    Expanded(
      child: Container(
        height: 50,
        color: Colors.blue,
        child: Text('Short'),  // Still fills all remaining space
      ),
    ),
  ],
)

// Flexible - CAN shrink to fit content
Row(
  children: [
    Container(width: 100, height: 50, color: Colors.red),
    Flexible(
      child: Container(
        height: 50,
        color: Colors.blue,
        child: Text('Short'),  // Only takes space it needs
      ),
    ),
  ],
)
```

### Flexible with fit: FlexFit.tight (Same as Expanded)
```dart
Row(
  children: [
    Flexible(
      fit: FlexFit.tight,  // This is identical to Expanded
      child: Container(height: 50, color: Colors.blue),
    ),
  ],
)
```

### When to Use Flexible
- When child content might not need all available space
- When you want content to "shrink-wrap" instead of fill
- When combining with intrinsic widget sizes

**Most Common:** Just use `Expanded` - it's simpler and covers 95% of use cases.

## Properties Reference

### Expanded Properties
| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `child` | Widget | The widget to expand | Required |
| `flex` | int | Relative size compared to other Expanded widgets | 1 |

### Flexible Properties
| Property | Type | Description | Default |
|----------|------|-------------|---------|
| `child` | Widget | The widget to make flexible | Required |
| `flex` | int | Relative size compared to other Flexible widgets | 1 |
| `fit` | FlexFit | `tight` (fill space) or `loose` (shrink-wrap) | `loose` |

## Important Rules

⚠️ **Expanded Must Be Direct Child of Row or Column**
```dart
// ❌ WRONG - Expanded inside Container
Row(
  children: [
    Container(
      child: Expanded(  // ERROR! Won't work
        child: Text('Hello'),
      ),
    ),
  ],
)

// ✅ CORRECT - Expanded directly in Row
Row(
  children: [
    Expanded(
      child: Container(
        child: Text('Hello'),
      ),
    ),
  ],
)
```

⚠️ **Don't Specify Width in Row or Height in Column**
```dart
// ❌ WRONG - Width conflicts with Expanded
Row(
  children: [
    Expanded(
      child: Container(
        width: 200,  // Don't do this! Expanded controls width
        height: 100,
        color: Colors.blue,
      ),
    ),
  ],
)

// ✅ CORRECT - Only specify the dimension Expanded doesn't control
Row(
  children: [
    Expanded(
      child: Container(
        height: 100,  // OK - Expanded controls width, we set height
        color: Colors.blue,
      ),
    ),
  ],
)
```

⚠️ **Calculate Flex Ratios Correctly**
```dart
// If you want 70/30 split:
Row(
  children: [
    Expanded(flex: 7, child: Container()),  // 70%
    Expanded(flex: 3, child: Container()),  // 30%
  ],
)

// Total flex = 7 + 3 = 10
// First gets 7/10 = 70%
// Second gets 3/10 = 30%
```

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| "RenderFlex overflowed" error | Wrap long content in Expanded |
| Layout breaks on rotation | Replace fixed widths with Expanded |
| Expanded not working | Ensure it's a direct child of Row/Column |
| Wrong proportions | Check flex values add up correctly |
| Child too small | Child might need minimum size - add constraints |
| "Incorrect use of ParentDataWidget" | Expanded used outside Row/Column - fix hierarchy |

## Testing Responsive Layouts

### Always Test These Scenarios:
1. **Portrait Orientation** - Default view
2. **Landscape Orientation** - Rotate device/emulator
3. **Small Phone** - Pixel 4 (smaller screen)
4. **Tablet** - Pixel Tablet (larger screen)
5. **With Content Variations** - Long text, short text, many items, few items

### Quick Rotation Test
```dart
// Run your app and press Ctrl+H (Windows) or Cmd+H (Mac)
// to rotate the emulator and see if layout adapts
```

## Best Practices

1. **Use Expanded for responsive layouts** - Stop guessing widths
2. **Test rotations early** - Don't wait until the end of development
3. **Combine with SingleChildScrollView** - For forms that might exceed screen height
4. **Use flex for precise ratios** - When you need exact proportions (70/30, etc.)
5. **Keep it simple** - Use Expanded over Flexible unless you have a specific reason
6. **Document flex ratios** - Comment why you chose specific flex values

## When Covered in Course
- **[Week 3A](../../weekly/3A.md)** - Brief introduction with Row/Column
- **[Week 8A](../../weekly/8A.md)** - In-depth coverage for responsive design
- **Project 2** - Essential for responsive search results

## Related Topics
- [Row & Column Layout](layout-widgets.md) - Parent widgets that contain Expanded
- [SingleChildScrollView](singlechildscrollview.md) - Combine for scrollable expanding content
- [Container Basics](container-basics.md) - Children of Expanded widgets

## External Resources
- [Expanded Widget - Flutter Documentation](https://api.flutter.dev/flutter/widgets/Expanded-class.html)
- [Flexible Widget - Flutter Documentation](https://api.flutter.dev/flutter/widgets/Flexible-class.html)
- [Understanding constraints - Flutter](https://docs.flutter.dev/ui/layout/constraints)

---
*Last updated: Week 8A | IGME-340 Reference*
