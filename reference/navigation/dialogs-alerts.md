# Dialogs & Alerts Reference

## Quick Example
```dart
// Basic alert dialog
showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('Alert'),
      content: Text('This is an alert dialog'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    );
  },
)
```

## AlertDialog - Material Style

### Basic Alert
```dart
ElevatedButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Item?'),
          content: Text('This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);  // Close dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Perform delete action
              },
              child: Text('Delete'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  },
  child: Text('Show Alert'),
)
```

### Styled Dialog
```dart
AlertDialog(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  title: Row(
    children: [
      Icon(Icons.info, color: Colors.blue),
      SizedBox(width: 8),
      Text('Information'),
    ],
  ),
  content: SingleChildScrollView(  // For long content
    child: Text('Your long message here...'),
  ),
  actions: [
    TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text('Got it'),
    ),
  ],
)
```

## CupertinoAlertDialog - iOS Style

```dart
import 'package:flutter/cupertino.dart';

showDialog(
  context: context,
  builder: (context) {
    return CupertinoAlertDialog(
      title: Text('Allow Location Access'),
      content: Text('This app needs location to find nearby stores'),
      actions: [
        CupertinoDialogAction(
          child: Text('Don\'t Allow'),
          onPressed: () => Navigator.pop(context),
        ),
        CupertinoDialogAction(
          child: Text('Allow'),
          isDefaultAction: true,  // Bold text
          onPressed: () {
            Navigator.pop(context);
            // Grant permission
          },
        ),
      ],
    );
  },
)
```

## showDialog Options

### Prevent Dismissing by Tapping Outside
```dart
showDialog(
  context: context,
  barrierDismissible: false,  // Must use button to close
  builder: (context) {
    return AlertDialog(
      title: Text('Please Wait'),
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 20),
          Text('Loading...'),
        ],
      ),
      // Note: Should provide a way to close!
    );
  },
)
```

### Custom Barrier Color
```dart
showDialog(
  context: context,
  barrierColor: Colors.red.withOpacity(0.5),  // Red tinted background
  builder: (context) => AlertDialog(...),
)
```

## Common Patterns

### Confirmation Dialog
```dart
Future<bool> showConfirmDialog(BuildContext context, String message) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Confirm'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text('No'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text('Yes'),
        ),
      ],
    ),
  ) ?? false;  // Default if dismissed
}

// Usage
bool confirmed = await showConfirmDialog(context, 'Are you sure?');
if (confirmed) {
  // Do something
}
```

### Input Dialog
```dart
String? userInput;
showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: Text('Enter Name'),
      content: TextField(
        onChanged: (value) {
          userInput = value;
        },
        decoration: InputDecoration(hintText: "Your name"),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (userInput != null) {
              // Use the input
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  },
)
```

### Loading Dialog
```dart
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading...'),
          ],
        ),
      ),
    );
  },
)
```

## Key Concepts

### Navigator.pop()
```dart
// Close dialog
Navigator.pop(context);

// Close with a return value
Navigator.pop(context, 'return value');

// Get return value
final result = await showDialog(...);
```

### Context Confusion
The `context: context` pattern can be confusing:
- First `context` is the parameter name for showDialog
- Second `context` is your widget's BuildContext
- The builder's `context` is a new context for the dialog

## Properties Reference

### AlertDialog Properties
| Property | Type | Purpose |
|----------|------|---------|
| `title` | Widget? | Dialog header |
| `content` | Widget? | Main message area |
| `actions` | List<Widget>? | Bottom buttons |
| `shape` | ShapeBorder? | Dialog shape/corners |
| `backgroundColor` | Color? | Background color |
| `elevation` | double? | Shadow depth |

### showDialog Parameters
| Parameter | Type | Purpose |
|-----------|------|---------|
| `context` | BuildContext | Required - where to show |
| `builder` | WidgetBuilder | Required - builds dialog |
| `barrierDismissible` | bool | Can tap outside to close? |
| `barrierColor` | Color? | Overlay color |
| `barrierLabel` | String? | Accessibility label |

## Common Mistakes

| Issue | Solution |
|-------|----------|
| Dialog won't close | Always provide Navigator.pop() option |
| Lost user input | Store in variable before closing |
| Dialog appears behind | Check context is from correct widget |
| Can't tap outside to close | barrierDismissible defaults to true |

## When Covered in Course
- **[Week 4B](../../weekly/4B.md)** - Basic dialogs and alerts
- **[Week 5B](../../weekly/5B.md)** - Dialogs for Project 1

## External Resources
- [Material Dialog Design](https://m3.material.io/components/dialogs/overview)
- [Flutter Dialog Cookbook](https://docs.flutter.dev/cookbook/design/dialogs)

---
*Last updated: Week 5 | IGME-340 Reference*
