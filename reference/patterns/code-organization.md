# Code Organization & DRY Principles

## Quick Reference

### DRY (Don't Repeat Yourself)
If you're copying and pasting code more than twice, extract it into a reusable component:

```dart
// ❌ BAD - Repetitive code
Column(
  children: [
    Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      child: Text('Item 1'),
    ),
    Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: Text('Item 2'),
    ),
    Container(
      width: 200,
      height: 200,
      color: Colors.green,
      child: Text('Item 3'),
    ),
  ],
)

// ✅ GOOD - Extracted method
Column(
  children: [
    _buildColorBox('Item 1', Colors.blue),
    _buildColorBox('Item 2', Colors.red),
    _buildColorBox('Item 3', Colors.green),
  ],
)

Widget _buildColorBox(String text, Color color) {
  return Container(
    width: 200,
    height: 200,
    color: color,
    child: Text(text),
  );
}
```

## Extraction Methods in VS Code

### Using VS Code's Extract Features
1. **Select the widget** you want to extract
2. **Press `Cmd/Ctrl + .`** (period) to open the action menu
3. Choose from three options:
   - **Extract Method** - Creates a method in the same class
   - **Extract Local Variable** - Creates a variable in build method
   - **Extract Widget** - Creates a new widget class

### When to Use Each Extraction Type

| Extraction Type | When to Use | Example Use Case |
|-----------------|-------------|------------------|
| **Extract Method** | Repeated UI patterns within one screen | Multiple similar containers, cards, or list items |
| **Extract Local Variable** | Single complex widget used once | Long widget tree that clutters build method |
| **Extract Widget** | Reusable component across multiple screens | Custom buttons, cards, or input fields |

## Extract Method Pattern (Most Common)

### Basic Pattern
```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),
          _buildContent(),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 100,
      color: Colors.blue,
      child: Center(child: Text('Header')),
    );
  }

  Widget _buildContent() {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Text('Content'),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 60,
      color: Colors.grey,
      child: Center(child: Text('Footer')),
    );
  }
}
```

### With Parameters (Project 1 Example)
```dart
// Perfect for Project 1's repeated item boxes
Widget _buildItemBox({
  required String imagePath,
  required String title,
  required String description,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown[100],
        border: Border.all(color: Colors.brown, width: 2),
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(description),
        ],
      ),
    ),
  );
}

// Usage
Column(
  children: [
    _buildItemBox(
      imagePath: 'assets/images/wood.png',
      title: 'Wood',
      description: 'Basic building material',
      onTap: () => _showItemDialog('Wood', woodDescription),
    ),
    _buildItemBox(
      imagePath: 'assets/images/stone.png',
      title: 'Stone',
      description: 'Stronger than wood',
      onTap: () => _showItemDialog('Stone', stoneDescription),
    ),
    // ... more items
  ],
)
```

## Extract Widget Pattern

### When to Create a Custom Widget
Create a custom widget when:
- You need the same component in multiple files
- The component has its own state
- The component is complex enough to deserve its own file
- You want to improve testability

### Custom Widget Example
```dart
// In a new file: custom_button.dart
class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? color;
  final IconData? icon;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon),
            SizedBox(width: 8),
          ],
          Text(label),
        ],
      ),
    );
  }
}

// Usage in multiple places
CustomButton(
  label: 'Save',
  icon: Icons.save,
  onPressed: _handleSave,
)
```

## File Organization

### Recommended Project Structure
```
lib/
├── main.dart                 # App entry point
├── screens/                  # Full page widgets
│   ├── home_screen.dart
│   ├── details_screen.dart
│   └── settings_screen.dart
├── widgets/                  # Reusable components
│   ├── custom_button.dart
│   ├── item_card.dart
│   └── loading_spinner.dart
├── models/                   # Data classes
│   ├── user.dart
│   └── item.dart
├── services/                 # API, database, etc.
│   └── api_service.dart
└── utils/                    # Helpers, constants
    ├── constants.dart
    └── helpers.dart
```

### For Smaller Projects (Like Course Assignments)
```
lib/
├── main.dart
├── home_page.dart
├── detail_page.dart
└── widgets/              # Only if you have 3+ custom widgets
    └── custom_card.dart
```

## Naming Conventions

### Methods
```dart
// Private methods start with underscore
Widget _buildHeader() { }

// Action methods start with verb
void _handleSubmit() { }
void _showDialog() { }
void _updateCounter() { }

// Boolean methods start with is/has/can
bool _isValid() { }
bool _hasPermission() { }
bool _canProceed() { }
```

### Widgets
```dart
// Widget classes use PascalCase
class CustomButton extends StatelessWidget { }
class UserProfileCard extends StatefulWidget { }

// Widget files use snake_case
custom_button.dart
user_profile_card.dart
```

### Variables
```dart
// Local variables use camelCase
final userName = 'John';
int itemCount = 0;

// Constants use camelCase or SCREAMING_SNAKE_CASE
const defaultPadding = 16.0;
const API_KEY = 'abc123';  // Some prefer this for true constants

// Private variables start with underscore
String _password = '';
int _counter = 0;
```

## Common Patterns

### Constants File
```dart
// utils/constants.dart
class AppColors {
  static const Color primary = Color(0xFF2196F3);
  static const Color secondary = Color(0xFF03DAC6);
  static const Color error = Color(0xFFB00020);
}

class AppSpacing {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
}

class AppStrings {
  static const String appName = 'My Flutter App';
  static const String welcomeMessage = 'Welcome back!';
}

// Usage
Container(
  padding: EdgeInsets.all(AppSpacing.medium),
  color: AppColors.primary,
  child: Text(AppStrings.welcomeMessage),
)
```

### Builder Pattern for Lists
```dart
// Instead of manually creating list items
ListView(
  children: [
    _buildItem(data[0]),
    _buildItem(data[1]),
    _buildItem(data[2]),
    // ... tedious and not scalable
  ],
)

// Use map or ListView.builder
ListView(
  children: data.map((item) => _buildItem(item)).toList(),
)

// Or even better for long lists
ListView.builder(
  itemCount: data.length,
  itemBuilder: (context, index) => _buildItem(data[index]),
)
```

## Code Smell Examples

### 🚫 Avoid Deep Nesting
```dart
// ❌ BAD - Hard to read and maintain
Widget build(BuildContext context) {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text('Deep nesting!'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// ✅ GOOD - Extract into methods
Widget build(BuildContext context) {
  return Container(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: _buildContent(),
    ),
  );
}

Widget _buildContent() {
  return Column(
    children: [
      _buildRow(),
    ],
  );
}

Widget _buildRow() {
  return Container(
    child: Row(
      children: [
        Expanded(child: Container(child: Text('Much cleaner!'))),
      ],
    ),
  );
}
```

### 🚫 Avoid Magic Numbers
```dart
// ❌ BAD
Container(
  width: 200,  // What is 200?
  height: 56,  // Why 56?
  padding: EdgeInsets.all(8),  // Random padding
)

// ✅ GOOD
Container(
  width: _cardWidth,
  height: _buttonHeight,
  padding: EdgeInsets.all(AppSpacing.small),
)

// Define at top of class or in constants file
static const double _cardWidth = 200.0;
static const double _buttonHeight = 56.0;  // Material Design button height
```

## Best Practices Summary

1. **Extract early and often** - Don't wait for 3+ copies, extract at 2
2. **Use descriptive names** - `_buildUserCard()` not `_build1()`
3. **Keep methods small** - Each method should do one thing
4. **Consistent naming** - Pick a convention and stick to it
5. **Group related code** - Keep related methods together
6. **Comment why, not what** - Code should be self-documenting
7. **Use constants** - No magic numbers or strings
8. **Think reusability** - Will I need this elsewhere?

## VS Code Tips

### Shortcuts for Organization
- `Cmd/Ctrl + .` - Quick actions menu
- `Alt/Shift + F` - Format document
- `F2` - Rename symbol everywhere
- `Cmd/Ctrl + Shift + R` - Refactor menu

### Extensions for Better Organization
- **Dart** - Essential, provides all extraction features
- **Flutter** - Adds Flutter-specific tools
- **Better Comments** - Color codes different comment types
- **Todo Tree** - Tracks TODO comments across project

## When Covered in Course
- **[Week 2B](../../weekly/2B.md)** - Widget extraction techniques
- **[Week 5B](../../weekly/5B.md)** - Extract Method for Project 1
- Used throughout course for clean code practices

## Related Topics
- [Widget Extraction](../weekly/2B.md#code-organization-techniques) - Detailed extraction walkthrough
- Project 1 - Practical application of DRY principles
- [Professional Commenting](../../commenting_guide.md) - Documentation standards

---
*Last updated: Week 5 | IGME-340 Reference*
