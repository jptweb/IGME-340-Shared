# setState Basics Reference

## The Golden Rule
**If you change a variable that affects the UI, wrap it in setState()**

```dart
// ❌ WRONG - UI won't update
void _incrementCounter() {
  counter++;  // Variable changes but UI doesn't know
}

// ✅ CORRECT - UI updates
void _incrementCounter() {
  setState(() {
    counter++;  // Tells Flutter to rebuild
  });
}
```

## Core Concept

setState() does two things:
1. Executes the code inside the callback
2. Tells Flutter to rebuild the widget

## Basic Example

```dart
class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;  // State variable
  
  void _increment() {
    setState(() {
      counter++;  // Change state
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Count: $counter'),  // Display state
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,  // Trigger state change
        child: Icon(Icons.add),
      ),
    );
  }
}
```

## Common Patterns

### Toggle Boolean
```dart
bool isLiked = false;

void _toggleLike() {
  setState(() {
    isLiked = !isLiked;
  });
}

// In build:
IconButton(
  icon: Icon(
    isLiked ? Icons.favorite : Icons.favorite_border,
    color: isLiked ? Colors.red : Colors.grey,
  ),
  onPressed: _toggleLike,
)
```

### Update Text
```dart
String displayText = "Hello";

void _changeText() {
  setState(() {
    displayText = "Goodbye";
  });
}

// In build:
Text(displayText)
```

### Multiple State Changes
```dart
int score = 0;
int lives = 3;
String status = "Playing";

void _gameOver() {
  setState(() {
    score = 0;      // All changes
    lives = 0;      // in one
    status = "Game Over";  // setState call
  });
}
```

## setState with Collections

### List Operations
```dart
List<String> items = [];

void _addItem(String item) {
  setState(() {
    items.add(item);
  });
}

void _removeItem(int index) {
  setState(() {
    items.removeAt(index);
  });
}

// In build:
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => Text(items[index]),
)
```

### Map Updates
```dart
Map<String, int> inventory = {};

void _updateInventory(String item, int quantity) {
  setState(() {
    inventory[item] = quantity;
  });
}
```

## Common Mistakes

### Forgetting setState
```dart
// ❌ Nothing happens on screen
void _updateName() {
  userName = "New Name";  // Variable changes but UI doesn't
}

// ✅ UI updates
void _updateName() {
  setState(() {
    userName = "New Name";
  });
}
```

### setState in initState
```dart
// ❌ WRONG - Widget not ready
@override
void initState() {
  super.initState();
  setState(() {  // Error!
    counter = 10;
  });
}

// ✅ CORRECT - Just set directly
@override
void initState() {
  super.initState();
  counter = 10;  // No setState needed here
}
```

### Async Operations
```dart
// ❌ Can cause errors if widget unmounted
Future<void> _loadData() async {
  var data = await fetchData();
  setState(() {
    myData = data;
  });
}

// ✅ Check if mounted
Future<void> _loadData() async {
  var data = await fetchData();
  if (mounted) {  // Check widget still exists
    setState(() {
      myData = data;
    });
  }
}
```

## setState vs Other State Management

| When to Use setState | When to Consider Alternatives |
|---------------------|-------------------------------|
| Simple counters/toggles | Data shared between pages |
| Form inputs | Complex app state |
| Local UI state | Shopping carts |
| Learning Flutter | Team projects |

## Performance Tips

### Minimize Rebuilds
```dart
// setState rebuilds entire widget
setState(() {
  // Only change what's necessary
  specificVariable = newValue;
  // Don't recalculate everything here
});
```

### Extract Widgets
If only part of UI changes, extract it to reduce rebuild scope:
```dart
// Before: Entire page rebuilds
@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Text('Static header'),  // Rebuilds unnecessarily
      Text('Count: $counter'), // Only this changes
    ],
  );
}

// After: Extract changing part
@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Text('Static header'),  // Doesn't rebuild
      CounterWidget(counter),  // Only this rebuilds
    ],
  );
}
```

## Quick Reference

| Method | When to Call | Purpose |
|--------|-------------|---------|
| `setState(() {})` | When changing state variables | Trigger UI rebuild |
| `initState()` | Once when widget created | Initialize state |
| `dispose()` | When widget removed | Cleanup resources |
| `mounted` check | Before setState in async | Prevent errors |

## Debugging setState

To see when rebuilds happen:
```dart
@override
Widget build(BuildContext context) {
  print('Building with counter: $counter');  // Debug line
  return YourWidget();
}
```

## When Covered in Course
- **[Week 4A](../../weekly/4A.md)** - setState fundamentals
- **[Week 10A](../../weekly/10A.md)** - Moving beyond setState to Provider

## External Resources
- [Flutter setState Documentation](https://api.flutter.dev/flutter/widgets/State/setState.html)
- [Flutter State Management Guide](https://docs.flutter.dev/data-and-backend/state-mgmt/intro)

---
*Last updated: Week 5 | IGME-340 Reference*
