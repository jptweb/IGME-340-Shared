# DropdownButton Reference

## Quick Example
```dart
String? selectedArmor = 'leather';

DropdownButton<String>(
  value: selectedArmor,
  onChanged: (String? newValue) {
    setState(() {
      selectedArmor = newValue;
    });
  },
  items: [
    DropdownMenuItem(value: 'leather', child: Text('Leather Armor')),
    DropdownMenuItem(value: 'chain', child: Text('Chain Mail')),
    DropdownMenuItem(value: 'plate', child: Text('Plate Armor')),
  ],
)
```

## Core Concepts

### Basic Setup Requirements
1. A state variable to hold selected value
2. List of DropdownMenuItem widgets
3. onChanged callback wrapped in setState
4. Value must match one of the item values exactly

## Creating DropdownMenuItems

### Method 1: Explicit Items (More Control)
```dart
List<DropdownMenuItem<String>> armorList = [
  DropdownMenuItem(
    value: 'leather',
    child: Row(
      children: [
        Icon(Icons.shield, size: 20),
        SizedBox(width: 8),
        Text('Leather Armor'),
      ],
    ),
  ),
  DropdownMenuItem(
    value: 'chain',
    child: Text('Chain Mail'),
  ),
];

// Use in DropdownButton
DropdownButton<String>(
  items: armorList,
  // ... rest of properties
)
```

### Method 2: Using .map() (Cleaner for Simple Lists)
```dart
List<String> weaponList = ['dagger', 'sword', 'mace', 'spear'];

DropdownButton<String>(
  value: selectedWeapon,
  items: weaponList.map((String item) {
    return DropdownMenuItem<String>(
      value: item,
      child: Text(item),
    );
  }).toList(),  // ⚠️ Don't forget .toList()!
  onChanged: (String? newValue) {
    setState(() {
      selectedWeapon = newValue;
    });
  },
)
```

### Method 3: From Complex Objects
```dart
class Category {
  final String id;
  final String name;
  Category(this.id, this.name);
}

List<Category> categories = [
  Category('1', 'Electronics'),
  Category('2', 'Clothing'),
];

DropdownButton<String>(
  value: selectedCategoryId,
  items: categories.map((Category cat) {
    return DropdownMenuItem<String>(
      value: cat.id,
      child: Text(cat.name),
    );
  }).toList(),
  onChanged: (String? newValue) {
    setState(() {
      selectedCategoryId = newValue;
    });
  },
)
```

## Styling DropdownButton

### Basic Styling
```dart
DropdownButton<String>(
  value: selectedValue,
  icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
  iconSize: 30,
  elevation: 16,
  style: TextStyle(color: Colors.deepPurple, fontSize: 18),
  underline: Container(
    height: 2,
    color: Colors.deepPurpleAccent,
  ),
  items: [...],
  onChanged: (value) {...},
)
```

### Full Width Dropdown
```dart
SizedBox(
  width: double.infinity,
  child: DropdownButton<String>(
    isExpanded: true,  // Makes dropdown take full width
    value: selectedValue,
    items: [...],
    onChanged: (value) {...},
  ),
)
```

### With Hint Text
```dart
DropdownButton<String>(
  value: selectedValue,  // Can be null initially
  hint: Text('Select an option'),
  items: [...],
  onChanged: (value) {...},
)
```

## Common Patterns

### Form Field with Label
```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Armor Type:', style: TextStyle(fontSize: 16)),
    SizedBox(height: 8),
    Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton<String>(
        value: selectedArmor,
        isExpanded: true,
        underline: SizedBox(),  // Remove default underline
        items: [...],
        onChanged: (value) {...},
      ),
    ),
  ],
)
```

### Disabled State
```dart
DropdownButton<String>(
  value: selectedValue,
  onChanged: null,  // Setting to null disables dropdown
  disabledHint: Text('Not available'),
  items: [...],
)
```

### With Initial Null Value
```dart
String? selectedValue;  // Starts as null

DropdownButton<String>(
  value: selectedValue,
  hint: Text('Choose one'),
  items: options.map(...).toList(),
  onChanged: (String? newValue) {
    setState(() {
      selectedValue = newValue;
    });
  },
)
```

## Important Rules

⚠️ **Value Must Match Exactly**
```dart
// ❌ WRONG - Value doesn't match any item value
value: 'Leather',  // Capital L
items: [
  DropdownMenuItem(value: 'leather', ...),  // lowercase l
]

// ✅ CORRECT - Values match exactly
value: 'leather',
items: [
  DropdownMenuItem(value: 'leather', ...),
]
```

⚠️ **Always Use setState**
```dart
// ❌ WRONG - UI won't update
onChanged: (value) {
  selectedValue = value;
}

// ✅ CORRECT - UI updates
onChanged: (value) {
  setState(() {
    selectedValue = value;
  });
}
```

## Properties Reference

| Property | Type | Purpose |
|----------|------|---------|
| `value` | T? | Currently selected value |
| `items` | List<DropdownMenuItem<T>>? | List of options |
| `onChanged` | ValueChanged<T?>? | Selection change callback |
| `hint` | Widget? | Shown when value is null |
| `disabledHint` | Widget? | Shown when disabled |
| `icon` | Widget? | Dropdown arrow icon |
| `iconSize` | double | Size of dropdown icon |
| `elevation` | int | Shadow depth of menu |
| `style` | TextStyle? | Text style for items |
| `isExpanded` | bool | Take full width |
| `underline` | Widget? | Line under dropdown |

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| "value == null or items.contains(value)" error | Ensure value matches an item value exactly |
| UI doesn't update on selection | Wrap onChanged in setState() |
| Dropdown too narrow | Set `isExpanded: true` |
| Can't select null/clear selection | Make value nullable (String?) |
| Text overflow in items | Use `isExpanded` or wrap in Flexible |

## When Covered in Course
- **[Week 6A](../../weekly/6A.md)** - DropdownButton basics and patterns
- **Project 2** - Used for filtering API results

## External Resources
- [DropdownButton Documentation](https://api.flutter.dev/flutter/material/DropdownButton-class.html)
- [Material Design Menus](https://m3.material.io/components/menus/overview)

---
*Last updated: Week 6A | IGME-340 Reference*
