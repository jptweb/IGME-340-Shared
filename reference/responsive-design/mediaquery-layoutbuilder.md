# MediaQuery & LayoutBuilder

## Quick Example - MediaQuery

```dart
@override
Widget build(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;

  return Scaffold(
    body: width < 600
        ? const MobileLayout()
        : const TabletLayout(),
  );
}
```

## Quick Example - LayoutBuilder

```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth < 400) {
      return SingleColumnLayout();
    } else {
      return TwoColumnLayout();
    }
  },
)
```

## Core Concepts

### MediaQuery vs LayoutBuilder

| Tool | What it measures | Use when... |
|------|------------------|-------------|
| **MediaQuery.sizeOf()** | Entire screen/window size | Making app-level layout decisions |
| **LayoutBuilder** | Parent widget's constraints | Building reusable responsive components |

**Simple way to think about it:**
- **MediaQuery** - "How big is the whole screen/window?"
- **LayoutBuilder** - "How much space does my parent give me?"

### Common Breakpoints (Material Design)

```dart
if (width < 600) {
  // Phone - use bottom navigation
} else if (width < 1200) {
  // Tablet - use navigation rail
} else {
  // Desktop - use full side navigation
}
```

## MediaQuery Patterns

### Get Screen Dimensions

```dart
@override
Widget build(BuildContext context) {
  final size = MediaQuery.sizeOf(context);
  final width = size.width;
  final height = size.height;

  return Text('Screen: ${width.toStringAsFixed(0)} x ${height.toStringAsFixed(0)}');
}
```

### Check Orientation

```dart
@override
Widget build(BuildContext context) {
  final orientation = MediaQuery.orientationOf(context);

  return orientation == Orientation.portrait
      ? PortraitLayout()
      : LandscapeLayout();
}
```

### Responsive GridView Columns

```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: MediaQuery.orientationOf(context) == Orientation.portrait
        ? 2   // 2 columns in portrait
        : 4,  // 4 columns in landscape
  ),
  itemBuilder: (context, index) => GridTile(...),
)
```

### Conditional Navigation

```dart
@override
Widget build(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;

  return Scaffold(
    body: Row(
      children: [
        if (width >= 600)
          NavigationRail(
            destinations: [...],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) => setState(() => _selectedIndex = index),
          ),
        Expanded(child: _pages[_selectedIndex]),
      ],
    ),
    bottomNavigationBar: width < 600
        ? BottomNavigationBar(
            items: [...],
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          )
        : null,
  );
}
```

## LayoutBuilder Patterns

### Basic Responsive Widget

```dart
class ResponsiveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 300) {
          return CompactCard();
        } else {
          return ExpandedCard();
        }
      },
    );
  }
}
```

### Responsive Grid with LayoutBuilder

```dart
LayoutBuilder(
  builder: (context, constraints) {
    int columns;
    if (constraints.maxWidth < 400) {
      columns = 1;
    } else if (constraints.maxWidth < 800) {
      columns = 2;
    } else {
      columns = 3;
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
      ),
      itemBuilder: (context, index) => ItemCard(index: index),
    );
  },
)
```

### Nested Responsive Layout

```dart
// LayoutBuilder is great for reusable widgets that might be
// placed in different sized containers
class AdaptivePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // This adapts based on where it's placed, not screen size
        if (constraints.maxWidth < 200) {
          return IconOnlyView();
        } else {
          return IconAndTextView();
        }
      },
    );
  }
}
```

## Why StatelessWidgets Rebuild on Resize

When you resize the window with a StatelessWidget using MediaQuery, it still updates. Why?

**The answer: InheritedWidget mechanism**

```dart
// This widget is Stateless, but still responds to window resize!
class ResponsiveDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;  // Registers as dependent
    return Text('Width: $width');
  }
}
```

**What happens when you resize:**
1. OS notifies Flutter of new dimensions
2. Flutter updates `MediaQuery` data at the widget tree root
3. Any widget that called `MediaQuery.sizeOf(context)` gets rebuilt automatically

**This is NOT `setState()`** - it's the InheritedWidget pattern:
- `setState()` = internal state change triggers rebuild
- `InheritedWidget` change = external data change triggers rebuild of dependents

Both cause rebuilds, but through different mechanisms!

## Properties Reference

### MediaQuery Methods

| Method | Returns | Description |
|--------|---------|-------------|
| `MediaQuery.sizeOf(context)` | Size | Screen width and height |
| `MediaQuery.orientationOf(context)` | Orientation | Portrait or landscape |
| `MediaQuery.of(context).padding` | EdgeInsets | Safe area insets (notch, status bar) |
| `MediaQuery.of(context).viewInsets` | EdgeInsets | Keyboard height when visible |
| `MediaQuery.of(context).textScaleFactor` | double | User's text size preference |

### LayoutBuilder Constraints

| Property | Type | Description |
|----------|------|-------------|
| `constraints.maxWidth` | double | Maximum available width |
| `constraints.maxHeight` | double | Maximum available height |
| `constraints.minWidth` | double | Minimum required width |
| `constraints.minHeight` | double | Minimum required height |

## Important Rules

⚠️ **Use `MediaQuery.sizeOf()` instead of `MediaQuery.of().size`**
```dart
// ❌ Less efficient - listens to ALL MediaQuery changes
final width = MediaQuery.of(context).size.width;

// ✅ More efficient - only listens to size changes
final width = MediaQuery.sizeOf(context).width;
```

⚠️ **Base decisions on window size, NOT device type**
```dart
// ❌ Don't do this - checking device type
if (Platform.isAndroid && isTablet) {
  return TabletLayout();
}

// ✅ Do this - checking available space
if (MediaQuery.sizeOf(context).width >= 600) {
  return TabletLayout();
}
```

⚠️ **LayoutBuilder rebuilds on constraint changes**
```dart
// Be careful with expensive operations inside LayoutBuilder
LayoutBuilder(
  builder: (context, constraints) {
    // ❌ Don't make API calls here - this rebuilds often!
    // ✅ Only do layout calculations here
    return constraints.maxWidth < 400 ? SmallView() : LargeView();
  },
)
```

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| Layout not updating on resize | Make sure you're using `MediaQuery.sizeOf(context)` in build method |
| Expensive rebuilds | Use `MediaQuery.sizeOf()` instead of `MediaQuery.of()` for better performance |
| LayoutBuilder constraints are infinite | Parent widget has unbounded constraints - wrap in a sized container |
| Breakpoints feel wrong | Test on actual devices, not just emulator - DPI matters |

## When to Use Which

| Scenario | Use |
|----------|-----|
| App-level navigation (bottom nav vs rail) | MediaQuery |
| Full-screen layout decisions | MediaQuery |
| Reusable widget that adapts to container | LayoutBuilder |
| Widget that might be in a sidebar or full-screen | LayoutBuilder |
| Checking device orientation | MediaQuery |
| Building responsive grid inside a panel | LayoutBuilder |

## When Covered in Course

- **[Week 7B](../../weekly/7B.md)** - GridView with orientation (first responsive pattern)
- **[Week 14B](../../weekly/14B.md)** - MediaQuery and LayoutBuilder in-depth

## Related Topics

- [Expanded & Flexible](../widgets/expanded-flexible.md) - Flex-based responsive layouts
- [GridView & GridTile](../widgets/gridview-basics.md) - Responsive grids

## External Resources

- [Flutter Adaptive/Responsive Docs](https://docs.flutter.dev/ui/adaptive-responsive/general)
- [MediaQuery class](https://api.flutter.dev/flutter/widgets/MediaQuery-class.html)
- [LayoutBuilder class](https://api.flutter.dev/flutter/widgets/LayoutBuilder-class.html)

---
*Last updated: Week 14B | IGME-340 Reference*
