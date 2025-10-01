# ScaffoldMessenger Notifications Reference

## Quick Example
```dart
// Simple SnackBar
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(content: Text('Operation completed')),
);

// Material Banner with dismiss action
ScaffoldMessenger.of(context).showMaterialBanner(
  MaterialBanner(
    content: Text('Important notification'),
    actions: [
      TextButton(
        onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
        child: Text('DISMISS'),
      ),
    ],
  ),
);
```

## Core Concepts

### SnackBar - Temporary Notifications
Auto-dismissing notifications that appear from the bottom of the screen.

```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('File saved'),
    duration: Duration(seconds: 3),  // Default is 4 seconds
  ),
);
```

### Material Banner - Persistent Notifications
Notifications that remain visible until manually dismissed, appearing at the top of the content area.

```dart
ScaffoldMessenger.of(context).showMaterialBanner(
  MaterialBanner(
    content: Text('System update available'),
    actions: [  // REQUIRED - must have at least one action
      TextButton(
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
        },
        child: Text('DISMISS'),
      ),
    ],
  ),
);
```

## Common Patterns

### SnackBar with Icon and Action
```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Row(
      children: [
        Icon(Icons.check_circle, color: Colors.white),
        SizedBox(width: 10),
        Text('Item deleted'),
      ],
    ),
    backgroundColor: Colors.green,
    action: SnackBarAction(
      label: 'UNDO',
      textColor: Colors.yellow,
      onPressed: () {
        // Restore deleted item
        print('Undo deletion');
      },
    ),
  ),
);
```

### Prevent Banner Stacking
```dart
// Use cascade notation (..) to chain operations
ScaffoldMessenger.of(context)
  ..removeCurrentMaterialBanner()  // Remove any existing banner
  ..showMaterialBanner(
    MaterialBanner(
      content: Text('New notification'),
      actions: [
        TextButton(
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
          child: Text('OK'),
        ),
      ],
    ),
  );
```

### Error Notification Pattern
```dart
void showError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.white),
          SizedBox(width: 10),
          Expanded(child: Text(message)),
        ],
      ),
      backgroundColor: Colors.red.shade700,
      duration: Duration(seconds: 5),
    ),
  );
}
```

### Success Notification Pattern
```dart
void showSuccess(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(Icons.check_circle_outline, color: Colors.white),
          SizedBox(width: 10),
          Text(message),
        ],
      ),
      backgroundColor: Colors.green.shade600,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
```

## Properties Reference

### SnackBar Properties

| Property | Type | Purpose |
|----------|------|---------|
| content | Widget | Main content to display |
| duration | Duration | How long to show (default: 4 seconds) |
| action | SnackBarAction? | Optional action button |
| backgroundColor | Color? | Background color |
| behavior | SnackBarBehavior | Fixed (default) or floating |
| shape | ShapeBorder? | Custom shape (works with floating) |
| margin | EdgeInsetsGeometry? | Margin when floating |
| elevation | double? | Shadow depth |
| width | double? | Custom width (floating only) |
| dismissDirection | DismissDirection | Swipe to dismiss direction |

### MaterialBanner Properties

| Property | Type | Purpose |
|----------|------|---------|
| content | Widget | Main content to display |
| actions | List<Widget> | **Required** action buttons |
| backgroundColor | Color? | Background color |
| leading | Widget? | Icon or widget before content |
| leadingPadding | EdgeInsetsGeometry? | Padding around leading |
| forceActionsBelow | bool | Force actions to next line |
| contentTextStyle | TextStyle? | Text style for content |

## Important Rules

⚠️ **MaterialBanner requires actions**
```dart
// ❌ WRONG - No actions
MaterialBanner(
  content: Text('Message'),
  // Error: actions is required!
)

// ✅ CORRECT - Has at least one action
MaterialBanner(
  content: Text('Message'),
  actions: [
    TextButton(
      onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
      child: Text('OK'),
    ),
  ],
)
```

⚠️ **Material Banners stack without management**
```dart
// ❌ WRONG - Creates multiple stacked banners
void showBanner() {
  ScaffoldMessenger.of(context).showMaterialBanner(...);
}

// ✅ CORRECT - Removes existing before showing new
void showBanner() {
  ScaffoldMessenger.of(context)
    ..removeCurrentMaterialBanner()
    ..showMaterialBanner(...);
}
```

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| Banner won't dismiss | Ensure you call `hideCurrentMaterialBanner()` |
| Multiple banners stacking | Remove existing banner before showing new |
| SnackBar appears too briefly | Increase duration property |
| No ScaffoldMessenger found | Ensure widget is inside MaterialApp |
| Banner pushes content down | This is expected behavior - use SnackBar for overlay |
| Action not working | Check that onPressed is properly implemented |

## When to Use Which

### Use SnackBar When:
- Message is temporary/informational
- User action completed successfully
- Brief error messages
- Undo actions are needed

### Use MaterialBanner When:
- Message requires persistent visibility
- User must acknowledge the message
- System-wide notifications
- Important warnings that shouldn't auto-dismiss

## When Covered in Course
- **[Week 5A](../../weekly/5A.md)** - Introduction to ScaffoldMessenger, SnackBar, and MaterialBanner
- **Project 2** - User feedback for API operations and form submissions

## External Resources
- [SnackBar Documentation](https://api.flutter.dev/flutter/material/SnackBar-class.html)
- [MaterialBanner Documentation](https://api.flutter.dev/flutter/material/MaterialBanner-class.html)
- [ScaffoldMessenger Documentation](https://api.flutter.dev/flutter/material/ScaffoldMessenger-class.html)
- [Material Design Snackbars](https://material.io/components/snackbars)

---
*Last updated: Week 5A | IGME-340 Reference*