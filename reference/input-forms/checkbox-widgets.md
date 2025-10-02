# Checkbox Widgets Reference

## Quick Example
```dart
// Basic checkbox
bool? isChecked = false;

Checkbox(
  value: isChecked,
  onChanged: (value) {
    setState(() {
      isChecked = value;
    });
  },
)

// Better UX: CheckboxListTile (entire row tappable)
CheckboxListTile(
  value: isChecked,
  onChanged: (value) {
    setState(() {
      isChecked = value;
    });
  },
  title: Text('Accept terms'),
)
```

## Core Concepts

### Basic Checkbox
Minimal checkbox requiring manual state management:

```dart
class _MyWidgetState extends State<MyWidget> {
  bool? chk01 = false; // Must be nullable!
  
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: chk01,
      onChanged: (value) {
        setState(() {
          chk01 = value;
        });
      },
    );
  }
}
```

**Critical:** Boolean must be `bool?` (nullable) because checkboxes support tri-state mode.

### Tri-State Checkbox
Cycles through three states: true → false → null (indeterminate):

```dart
bool? chk = false;

Checkbox(
  value: chk,
  tristate: true, // Enables three states
  onChanged: (value) {
    print(value); // Outputs: true, false, or null
    setState(() {
      chk = value;
    });
  },
)
```

**Use Cases:**
- "Select All" checkbox (null = partially selected)
- Unknown/optional state in forms
- Hierarchical selection (parent partially selected if some children selected)

### CheckboxListTile - Recommended
Entire row becomes tappable - much better UX:

```dart
bool? accepted = false;

CheckboxListTile(
  value: accepted,
  onChanged: (value) {
    setState(() {
      accepted = value;
    });
  },
  title: Text('I accept the terms'),
  subtitle: Text('Required to continue'),
  secondary: Icon(Icons.info), // Optional icon
  controlAffinity: ListTileControlAffinity.leading, // Checkbox on left
)
```

## Common Patterns

### Basic On/Off Toggle
```dart
bool? isEnabled = false;

CheckboxListTile(
  value: isEnabled,
  onChanged: (value) {
    setState(() {
      isEnabled = value;
    });
  },
  title: Text('Enable notifications'),
  activeColor: Colors.green,
)
```

### Multiple Checkboxes
```dart
bool? option1 = false;
bool? option2 = false;
bool? option3 = false;

Column(
  children: [
    CheckboxListTile(
      value: option1,
      onChanged: (value) => setState(() => option1 = value),
      title: Text('Option 1'),
    ),
    CheckboxListTile(
      value: option2,
      onChanged: (value) => setState(() => option2 = value),
      title: Text('Option 2'),
    ),
    CheckboxListTile(
      value: option3,
      onChanged: (value) => setState(() => option3 = value),
      title: Text('Option 3'),
    ),
  ],
)
```

### Select All Pattern
```dart
bool? selectAll = false;
List<bool?> items = [false, false, false];

Column(
  children: [
    CheckboxListTile(
      value: selectAll,
      tristate: true, // Shows partial selection
      onChanged: (value) {
        setState(() {
          selectAll = value ?? false;
          // Update all items
          for (int i = 0; i < items.length; i++) {
            items[i] = selectAll;
          }
        });
      },
      title: Text('Select All'),
    ),
    ...items.asMap().entries.map((entry) {
      int idx = entry.key;
      return CheckboxListTile(
        value: items[idx],
        onChanged: (value) {
          setState(() {
            items[idx] = value;
            // Update select all state
            if (items.every((item) => item == true)) {
              selectAll = true;
            } else if (items.every((item) => item == false)) {
              selectAll = false;
            } else {
              selectAll = null; // Partial selection
            }
          });
        },
        title: Text('Item ${idx + 1}'),
      );
    }).toList(),
  ],
)
```

### Styled CheckboxListTile
```dart
CheckboxListTile(
  value: accepted,
  onChanged: (value) => setState(() => accepted = value),
  title: Text('I agree to terms'),
  subtitle: Text('Required to proceed'),
  secondary: Icon(Icons.gavel),
  controlAffinity: ListTileControlAffinity.leading,
  activeColor: Colors.blue,
  checkColor: Colors.white,
  tileColor: Colors.grey[100],
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: BorderSide(color: Colors.blue, width: 1),
  ),
)
```

## Properties Reference

### Checkbox Properties
| Property | Type | Purpose |
|----------|------|---------|
| value | bool? | Current checked state (true/false/null) |
| onChanged | Function? | Callback when checkbox tapped |
| tristate | bool | Allow null state (default: false) |
| activeColor | Color? | Color when checked |
| checkColor | Color? | Color of checkmark itself |

### CheckboxListTile Additional Properties
| Property | Type | Purpose |
|----------|------|---------|
| title | Widget | Main text |
| subtitle | Widget? | Secondary text below title |
| secondary | Widget? | Widget on opposite side from checkbox |
| controlAffinity | ListTileControlAffinity | Checkbox position (leading/trailing) |
| tileColor | Color? | Background color |
| shape | ShapeBorder? | Border and corner styling |

## Important Rules

⚠️ **Boolean Must Be Nullable**
```dart
// ❌ WRONG - Non-nullable bool
bool isChecked = false;

Checkbox(
  value: isChecked,
  tristate: true, // ERROR! Needs nullable bool
  onChanged: (value) {...},
)

// ✅ CORRECT - Nullable bool
bool? isChecked = false;

Checkbox(
  value: isChecked,
  tristate: true, // Works!
  onChanged: (value) {...},
)
```

⚠️ **Must Wrap in setState**
```dart
// ❌ WRONG - UI won't update
onChanged: (value) {
  isChecked = value; // State changes but UI doesn't
}

// ✅ CORRECT - UI updates
onChanged: (value) {
  setState(() {
    isChecked = value;
  });
}
```

⚠️ **Disabled Checkbox Pattern**
```dart
// To disable checkbox, set onChanged to null
CheckboxListTile(
  value: isChecked,
  onChanged: null, // Disabled
  title: Text('Disabled option'),
)
```

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| Checkbox won't toggle | Forgot to wrap state change in `setState()` |
| "bool can't be null" error | Change `bool` to `bool?` for nullable |
| Can't click checkbox in ListTile | Use CheckboxListTile instead of manual Row |
| Checkbox doesn't show checked | Verify `value` property is set correctly |
| Want to disable checkbox | Set `onChanged: null` |

## When Covered in Course
- **[Week 6B](../../weekly/6B.md)** - Checkbox widgets and form controls

## External Resources
- [Checkbox Documentation](https://api.flutter.dev/flutter/material/Checkbox-class.html)
- [CheckboxListTile Documentation](https://api.flutter.dev/flutter/material/CheckboxListTile-class.html)
- [Material Design Checkboxes](https://m3.material.io/components/checkbox)

---
*Last updated: Week 6B | IGME-340 Reference*
```

---
