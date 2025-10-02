# Form Validation Reference

## Quick Example
```dart
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter text';
          }
          return null; // null = valid
        },
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Process data
          }
        },
        child: Text('Submit'),
      ),
    ],
  ),
)
```

## Core Concepts

### GlobalKey for Form State
Forms need a GlobalKey to maintain their state across rebuilds:

```dart
class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [...]),
    );
  }
}
```

**Why GlobalKey?**
- Maintains widget identity during rebuilds
- Allows access to form state from anywhere in widget
- Similar to HTML form IDs

### TextFormField vs TextField
Use TextFormField when working with Form widget:

```dart
// Inside Form widget
TextFormField(
  validator: (value) {
    // Validation logic here
    return null; // or error message
  },
)
```

**Key Difference:** TextFormField has built-in validator property.

### Validator Function Pattern
```dart
validator: (value) {
  // Check for null or empty
  if (value == null || value.isEmpty) {
    return 'Field is required';
  }
  
  // Check length
  if (value.length < 5) {
    return 'Must be at least 5 characters';
  }
  
  // Check pattern (example: only letters)
  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
    return 'Letters only';
  }
  
  return null; // null means VALID!
}
```

## Common Patterns

### Form Submission
```dart
ElevatedButton(
  onPressed: () {
    // Validate all fields at once
    if (_formKey.currentState!.validate()) {
      // All fields passed validation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Processing data')),
      );
      
      // Save form data if needed
      _formKey.currentState!.save();
    }
  },
  child: Text('Submit'),
)
```

**Note:** The `!` after currentState is required due to null safety.

### Auto-Validation Modes
```dart
Form(
  key: _formKey,
  autovalidateMode: AutovalidateMode.onUserInteraction,
  child: Column(children: [...]),
)
```

**Available Modes:**
- `AutovalidateMode.disabled` - Only validate on submit (default)
- `AutovalidateMode.onUserInteraction` - Validate as user types
- `AutovalidateMode.always` - Validate constantly

**UX Consideration:** `onUserInteraction` can be annoying if validation happens before user finishes typing.

### Email Validation with Package
```dart
// In pubspec.yaml dependencies:
// email_validator: ^2.1.17

import 'package:email_validator/email_validator.dart';

TextFormField(
  decoration: InputDecoration(labelText: 'Email'),
  keyboardType: TextInputType.emailAddress,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email';
    }
    return null;
  },
)
```

### Password Validation Example
```dart
TextFormField(
  obscureText: true,
  decoration: InputDecoration(labelText: 'Password'),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain a number';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain an uppercase letter';
    }
    return null;
  },
)
```

### Matching Password Fields
```dart
final _passwordController = TextEditingController();

// First password field
TextFormField(
  controller: _passwordController,
  obscureText: true,
  decoration: InputDecoration(labelText: 'Password'),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  },
)

// Confirm password field
TextFormField(
  obscureText: true,
  decoration: InputDecoration(labelText: 'Confirm Password'),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  },
)
```

## Important Rules

⚠️ **Validator Return Values**
```dart
// ❌ WRONG - returning true/false
validator: (value) {
  if (value.isEmpty) {
    return false; // WRONG!
  }
  return true; // WRONG!
}

// ✅ CORRECT - return String or null
validator: (value) {
  if (value == null || value.isEmpty) {
    return 'Error message here';
  }
  return null; // null means valid
}
```

⚠️ **Must Use TextFormField, Not TextField**
```dart
// ❌ WRONG - TextField doesn't have validator
Form(
  child: TextField(
    validator: (value) {...}, // ERROR!
  ),
)

// ✅ CORRECT - Use TextFormField
Form(
  child: TextFormField(
    validator: (value) {...}, // Works!
  ),
)
```

⚠️ **GlobalKey Type Must Match**
```dart
// ✅ CORRECT
final _formKey = GlobalKey<FormState>();

// ❌ WRONG
final _formKey = GlobalKey(); // Missing type
```

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| "currentState is null" | Make sure Form has `key` property set |
| Validation doesn't trigger | Call `_formKey.currentState!.validate()` |
| Can't access validation result | Add `!` after currentState for null safety |
| Validator not running | Using TextField instead of TextFormField |
| All fields validate at once | That's correct behavior - one validate() checks all |

## When Covered in Course
- **[Week 6A](../../weekly/6A.md)** - TextField basics and controllers
- **[Week 6B](../../weekly/6B.md)** - Form validation implementation

## External Resources
- [Form Class Documentation](https://api.flutter.dev/flutter/widgets/Form-class.html)
- [TextFormField Documentation](https://api.flutter.dev/flutter/material/TextFormField-class.html)
- [FormState Documentation](https://api.flutter.dev/flutter/widgets/FormState-class.html)
- [email_validator Package](https://pub.dev/packages/email_validator)

---
*Last updated: Week 6B | IGME-340 Reference*
```
