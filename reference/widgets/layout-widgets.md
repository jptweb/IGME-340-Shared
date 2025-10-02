# Row & Column Layout Widgets

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

## Common Patterns

### Card Layout with Row and Column
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

### Form Layout with Column
```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Text('Login Form', style: TextStyle(fontSize: 24)),
    SizedBox(height: 20),
    TextField(
      decoration: InputDecoration(labelText: 'Email'),
    ),
    SizedBox(height: 16),
    TextField(
      decoration: InputDecoration(labelText: 'Password'),
      obscureText: true,
    ),
    SizedBox(height: 24),
    ElevatedButton(
      onPressed: () {},
      child: Text('Login'),
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
| `textDirection` | TextDirection? | Direction for alignment |
| `verticalDirection` | VerticalDirection | Order of children vertically |

### MainAxisAlignment Values
| Value | Description | Visual |
|-------|-------------|--------|
| `start` | Place at beginning | Items cluster at start |
| `end` | Place at end | Items cluster at end |
| `center` | Center items | Items centered |
| `spaceBetween` | Space between items | Equal space between, none at edges |
| `spaceEvenly` | Even space | Equal space including edges |
| `spaceAround` | Space around items | Equal space, half at edges |

## Key Differences Between Row and Column

| Aspect | Column | Row |
|--------|--------|-----|
| Direction | Vertical | Horizontal |
| Main Axis | Vertical (↓) | Horizontal (→) |
| Cross Axis | Horizontal (→) | Vertical (↓) |
| Children Order | Top to bottom | Left to right (or RTL) |
| Common Overflow | Height issues | Width issues |
| Scroll Direction | Vertical | Horizontal |

## Common Mistakes & Solutions

| Issue | Solution |
|-------|----------|
| Column/Row overflow errors | Wrap in SingleChildScrollView or use Expanded |
| Alignment not working | Check if parent is constraining size |
| Spacing between items | Use `spacing` property or SizedBox widgets |
| Text overflow in Row | Wrap Text in Expanded or Flexible |
| Items not stretching | Use `crossAxisAlignment: CrossAxisAlignment.stretch` |
| Unwanted space | Check `mainAxisSize` - try `MainAxisSize.min` |

## Best Practices

1. **Use `spacing` property** - Cleaner than multiple SizedBox widgets
2. **Wrap long content** - Always use Expanded/Flexible for variable-length text in Rows
3. **Handle overflow early** - Add ScrollView before you need it
4. **Consider mainAxisSize** - Use `MainAxisSize.min` when Column/Row shouldn't take full space
5. **Test on different screens** - Row overflow often only appears on smaller devices

## When Covered in Course
- **[Week 3A](../../weekly/3A.md)** - Introduction to Column and Row
- Used throughout course in almost every layout

## Related Topics
- [Stack Widget](stack-widget.md) - For layering widgets on top of each other
- [Padding & SizedBox](padding-sizedbox.md) - For spacing between widgets
- [SingleChildScrollView](singlechildscrollview.md) - For handling overflow
- [Expanded & Flexible](../coming-soon.md) - For responsive sizing within Row/Column

---
*Last updated: Week 5 | IGME-340 Reference*
