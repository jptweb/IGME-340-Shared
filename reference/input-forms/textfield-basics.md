# TextField Reference

## Quick Example
```dart
TextField(
  onChanged: (text) {
    print('User typed: $text');
  },
  decoration: InputDecoration(
    labelText: 'Enter your name',
    border: OutlineInputBorder(),
  ),
)
```

## Core Concepts

### Basic Text Input
```dart
String userInput = '';

TextField(
  onChanged: (text) {
    setState(() {
      userInput = text;
    });
  },
  onSubmitted: (text) {
    print('User submitted: $text');
  },
)
```

### Using TextEditingController (Recommended)
```dart
class _MyWidgetState extends State<MyWidget> {
  final TextEditingController _controller = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _controller.text = 'Initial text';  // Pre-fill
  }
  
  @override
  void dispose() {
    _controller.dispose();  // Prevent memory leaks!
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onSubmitted: (text) {
        print('Submitted: ${_controller.text}');
      },
    );
  }
}
```

## InputDecoration - Styling TextFields

### Common Decoration Properties
```dart
TextField(
  decoration: InputDecoration(
    // Labels and hints
    labelText: 'Email',
    hintText: 'example@email.com',
    helperText: 'We will never share your email',
    
    // Icons
    prefixIcon: Icon(Icons.email),
    suffixIcon: IconButton(
      icon: Icon(Icons.clear),
      onPressed: () => _controller.clear(),
    ),
    
    // Borders
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    
    // Colors
    filled: true,
    fillColor: Colors.grey[100],
    
    // Padding
    contentPadding: EdgeInsets.all(16),
  ),
)
```

### Border Styles
```dart
InputDecoration(
  // Default border
  border: OutlineInputBorder(),
  
  // When focused
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 2),
  ),
  
  // When enabled but not focused
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
  
  // When there's an error
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  ),
)
```

## Keyboard Types

```dart
// Numeric keyboard
TextField(
  keyboardType: TextInputType.number,
  decoration: InputDecoration(labelText: 'Age'),
)

// Email keyboard (@ symbol prominent)
TextField(
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(labelText: 'Email'),
)

// Other useful types:
TextInputType.phone        // Phone number pad
TextInputType.datetime      // Date/time input
TextInputType.multiline     // Multiple lines
TextInputType.url          // URL keyboard
TextInputType.visiblePassword  // Password (visible)
```

## Text Input Actions

```dart
TextField(
  textInputAction: TextInputAction.next,  // Show arrow
  onEditingComplete: () {
    FocusScope.of(context).nextFocus();  // Go to next field
  },
)

// Other actions:
TextInputAction.done     // Checkmark - close keyboard
TextInputAction.search   // Search icon
TextInputAction.go       // "Go" button
TextInputAction.send     // Send icon
```

## Common Patterns

### Password Field
```dart
bool _obscurePassword = true;

TextField(
  obscureText: _obscurePassword,
  decoration: InputDecoration(
    labelText: 'Password',
    suffixIcon: IconButton(
      icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        setState(() {
          _obscurePassword = !_obscurePassword;
        });
      },
    ),
  ),
)
```

### Search Field
```dart
TextField(
  controller: _searchController,
  textInputAction: TextInputAction.search,
  decoration: InputDecoration(
    hintText: 'Search...',
    prefixIcon: Icon(Icons.search),
    suffixIcon: _searchController.text.isNotEmpty
      ? IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            _searchController.clear();
            setState(() {});
          },
        )
      : null,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
    ),
  ),
  onSubmitted: (query) {
    // Perform search
  },
)
```

### Multi-line Text Area
```dart
TextField(
  maxLines: 5,  // or null for unlimited
  keyboardType: TextInputType.multiline,
  decoration: InputDecoration(
    labelText: 'Description',
    alignLabelWithHint: true,  // Aligns label to top
    border: OutlineInputBorder(),
  ),
)
```

### Character Counter
```dart
TextField(
  maxLength: 100,
  decoration: InputDecoration(
    labelText: 'Bio',
    counterText: '${_controller.text.length}/100',
  ),
)
```

## Controller Methods

```dart
// Get current text
String text = _controller.text;

// Set text programmatically
_controller.text = 'New text';

// Clear the field
_controller.clear();

// Listen to changes
_controller.addListener(() {
  print('Text changed: ${_controller.text}');
});

// Move cursor to end
_controller.selection = TextSelection.fromPosition(
  TextPosition(offset: _controller.text.length),
);
```

## Focus Management

> **📖 For Complete Focus Control:** See the [Focus Management Reference](focus-management.md) for comprehensive patterns including chaining fields, dismissing keyboard, and professional form navigation.

```dart
// Dismiss keyboard
FocusScope.of(context).unfocus();

// Move to next field
FocusScope.of(context).nextFocus();

// Request focus for specific field
FocusNode _focusNode = FocusNode();
TextField(
  focusNode: _focusNode,
)
// Later: _focusNode.requestFocus();
```

## Important Rules

⚠️ **Always Dispose Controllers**
```dart
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```

⚠️ **fillColor Requires filled: true**
```dart
InputDecoration(
  filled: true,  // Must be true
  fillColor: Colors.grey[100],
)
```

## Properties Quick Reference

| Property | Type | Purpose |
|----------|------|---------|
| `controller` | TextEditingController? | Manage text programmatically |
| `onChanged` | ValueChanged<String>? | Called on every character |
| `onSubmitted` | ValueChanged<String>? | Called on keyboard submit |
| `decoration` | InputDecoration? | Visual styling |
| `keyboardType` | TextInputType? | Which keyboard to show |
| `textInputAction` | TextInputAction? | Keyboard action button |
| `obscureText` | bool | Hide text (passwords) |
| `maxLines` | int? | Number of lines |
| `maxLength` | int? | Character limit |
| `enabled` | bool | Can user interact? |
| `readOnly` | bool | Display only |

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| Keyboard covers TextField | Wrap page in SingleChildScrollView |
| fillColor not showing | Set `filled: true` |
| Can't clear TextField | Use TextEditingController with .clear() |
| Text not updating | Use onChanged with setState |
| Memory leak warnings | Dispose controller in dispose() |
| Need initial text | Set controller.text in initState |

## When Covered in Course
- **[Week 6A](../../weekly/6A.md)** - TextField basics and InputDecoration
- **[Week 8B](../../weekly/8B.md)** - Focus management and keyboard control
- **Week 6B** - Form validation with TextFormField
- **Project 2** - Search functionality

## Related Topics
- [Focus Management](focus-management.md) - Complete guide to keyboard navigation and focus control
- [Form Validation](form-validation.md) - Validating text input
- [SingleChildScrollView](../widgets/singlechildscrollview.md) - Preventing keyboard from covering fields

## External Resources
- [TextField Documentation](https://api.flutter.dev/flutter/material/TextField-class.html)
- [InputDecoration Properties](https://api.flutter.dev/flutter/material/InputDecoration-class.html)
- [TextEditingController Guide](https://api.flutter.dev/flutter/widgets/TextEditingController-class.html)

---
*Last updated: Week 6A | IGME-340 Reference*
