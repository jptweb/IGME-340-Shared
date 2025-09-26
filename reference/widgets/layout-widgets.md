# Layout Widgets (Row, Column, Stack)

## Quick Examples

### Column - Vertical Layout
```dart
Column(
  children: [
    Text('Top'),
    Text('Middle'),
    Text('Bottom'),
  ],
)
```

### Row - Horizontal Layout
```dart
Row(
  children: [
    Icon(Icons.star),
    Text('5.0'),
    Text('(100 reviews)'),
  ],
)
```

### Stack - Layered Layout
```dart
Stack(
  children: [
    Container(color: Colors.blue, width: 200, height: 200),  // Bottom
    Container(color: Colors.red, width: 100, height: 100),   // Top
  ],
)
```

## Column Widget

### Main Axis Alignment (Vertical)
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,  // Vertical centering
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)

// All MainAxisAlignment options:
MainAxisAlignment.start        // Top (default)
MainAxisAlignment.end          // Bottom  
MainAxisAlignment.center       // Center
MainAxisAlignment.spaceBetween // Space between items
MainAxisAlignment.spaceEvenly  // Even space around items
MainAxisAlignment.spaceAround  // Space around (half at edges)
```

### Cross Axis Alignment (Horizontal)
```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,  // Align left
  children: [
    Text('Short'),
    Text('Much longer text'),
    Text('Mid'),
  ],
)

// All CrossAxisAlignment options:
CrossAxisAlignment.start    // Left
CrossAxisAlignment.end      // Right
CrossAxisAlignment.center   // Center (default)
CrossAxisAlignment.stretch  // Fill width
```

### Spacing in Column (New Feature!)
```dart
Column(
  spacing: 20,  // Adds 20 pixels between all children
  children: [
    Container(height: 50, color: Colors.red),
    Container(height: 50, color: Colors.green),
    Container(height: 50, color: Colors.blue),
  ],
)
```

## Row Widget

### Main Axis Alignment (Horizontal)
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    ElevatedButton(onPressed: () {}, child: Text('Yes')),
    ElevatedButton(onPressed: () {}, child: Text('No')),
    ElevatedButton(onPressed: () {}, child: Text('Maybe')),
  ],
)
```

### Cross Axis Alignment (Vertical)
```dart
Row(
  crossAxisAlignment: CrossAxisAlignment.start,  // Align to top
  children: [
    Icon(Icons.info, size: 40),
    Text('Important message'),
  ],
)
```

### Making Row Scrollable
```dart
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      // Many containers that overflow screen width
      for (int i = 0; i < 20; i++)
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

## Stack Widget

### Basic Layering
```dart
Stack(
  alignment: Alignment.center,  // How to align non-positioned children
  children: [
    // Bottom layer
    Container(
      width: 300,
      height: 300,
      color: Colors.blue,
    ),
    // Middle layer
    Container(
      width: 200,
      height: 200,
      color: Colors.green,
    ),
    // Top layer
    Container(
      width: 100,
      height: 100,
      color: Colors.red,
    ),
  ],
)
```

### Positioned Widget in Stack
```dart
Stack(
  children: [
    Container(
      width: 300,
      height: 300,
      color: Colors.grey[300],
    ),
    Positioned(
      top: 20,
      left: 20,
      child: Text('Top Left'),
    ),
    Positioned(
      bottom: 20,
      right: 20,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Bottom Right'),
      ),
    ),
    Positioned(
      left: 0,
      right: 0,
      bottom: 50,
      child: Center(
        child: Text('Centered Horizontally'),
      ),
    ),
  ],
)
```

### Stack with Overflow
```dart
Stack(
  clipBehavior: Clip.none,  // Allow children to overflow
  children: [
    Container(
      width: 200,
      height: 200,
      color: Colors.blue,
    ),
    Positioned(
      top: -25,    // Negative positioning
      right: -25,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text('3', style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
  ],
)
```

## Common Patterns

### Card Layout with Row
```dart
Card(
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        Icon(Icons.account_circle, size: 50),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('John Doe', style: TextStyle(fontSize: 18)),
            Text('john@example.com', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    ),
  ),
)
```

### Navigation Bar with Row
```dart
Container(
  color: Colors.blue,
  padding: EdgeInsets.all(16),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(Icons.menu, color: Colors.white),
      Text('My App', style: TextStyle(color: Colors.white, fontSize: 20)),
      Icon(Icons.search, color: Colors.white),
    ],
  ),
)
```

### Overlay Badge with Stack
```dart
Stack(
  children: [
    Icon(Icons.shopping_cart, size: 40),
    Positioned(
      right: 0,
      top: 0,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        constraints: BoxConstraints(minWidth: 16, minHeight: 16),
        child: Center(
          child: Text(
            '3',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ),
    ),
  ],
)
```

## Dealing with Overflow

### Column Overflow Solution
```dart
// Problem: Too many items
Column(
  children: [
    // 20 containers that don't fit on screen
  ],
)

// Solution 1: Make scrollable
SingleChildScrollView(
  child: Column(
    children: [
      // Now can have unlimited items
    ],
  ),
)

// Solution 2: Use Expanded
Column(
  children: [
    Container(height: 100, color: Colors.red),
    Expanded(  // Takes remaining space
      child: Container(color: Colors.blue),
    ),
    Container(height: 100, color: Colors.green),
  ],
)
```

### Row Overflow Solution
```dart
// Problem: Text too long
Row(
  children: [
    Icon(Icons.error),
    Text('This is a very long error message that will overflow'),
  ],
)

// Solution: Wrap text in Expanded or Flexible
Row(
  children: [
    Icon(Icons.error),
    Expanded(
      child: Text('This is a very long error message that will wrap'),
    ),
  ],
)
```

## Properties Reference

### Common Properties (Row & Column)
| Property | Type | Description |
|----------|------|-------------|
| `children` | List<Widget> | Widgets to display |
| `mainAxisAlignment` | MainAxisAlignment | Alignment along main axis |
| `crossAxisAlignment` | CrossAxisAlignment | Alignment along cross axis |
| `mainAxisSize` | MainAxisSize | How much space to take |
| `spacing` | double? | Space between children (new!) |

### Stack Properties
| Property | Type | Description |
|----------|------|-------------|
| `children` | List<Widget> | Widgets to layer (first = bottom) |
| `alignment` | AlignmentDirectional | How to align non-positioned children |
| `fit` | StackFit | How to size non-positioned children |
| `clipBehavior` | Clip | Whether to clip overflowing children |

## Key Differences

| Aspect | Column | Row | Stack |
|--------|--------|-----|-------|
| Direction | Vertical | Horizontal | Layered (z-axis) |
| Main Axis | Vertical | Horizontal | N/A |
| Cross Axis | Horizontal | Vertical | N/A |
| Children Order | Top to bottom | Left to right | Bottom to top |
| Overflow | Height issues | Width issues | Clips by default |

## Common Mistakes & Solutions

| Issue | Solution |
|-------|----------|
| Column/Row overflow errors | Wrap in SingleChildScrollView or use Expanded |
| Stack children not visible | Check layering order (first = bottom) |
| Alignment not working | Check if parent is constraining size |
| Spacing between items | Use `spacing` property or SizedBox widgets |
| Text overflow in Row | Wrap Text in Expanded or Flexible |

## When Covered in Course
- **[Week 3A](../../weekly/3A.md)** - Column and Row basics
- **[Week 5A](../../weekly/5A.md)** - Stack widget and Positioned

---
*Last updated: Week 5 | IGME-340 Reference*
