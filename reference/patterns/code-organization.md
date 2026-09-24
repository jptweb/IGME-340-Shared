# Code Organization & DRY Principles

## Quick Reference

### DRY (Don't Repeat Yourself)
If you're about to paste the same widget code a second time, extract it into a reusable piece instead:

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
1. **Put your cursor on the widget's name** (on `Row`, not inside its parentheses), or select the whole widget
2. **Press `Cmd/Ctrl + .`** (period) to open the action menu. Right-click → **Refactor** shows the same options.
3. Choose from three options:
   - **Extract Method** - Creates a method in the same class
   - **Extract Local Variable** - Creates a variable in build method
   - **Extract Widget** - Creates a new widget class

### When to Use Each Extraction Type

| Extraction Type | What You Get | When to Use |
|-----------------|--------------|-------------|
| **Extract Widget** | A new widget class | Any reusable piece of UI, even if it's only used on one screen. Usually the best choice. |
| **Extract Method** | A method in the same class | A quick tidy-up of one screen |
| **Extract Local Variable** | A variable inside `build` | Rarely what you want |

## Extract Method Pattern

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

**About the return type:** VS Code names the return type after the widget you extracted, so extracting a `Row` gives you `Row buildRow()`. The examples on this page use `Widget` instead. Either one works. `Widget` just means you can change what the method returns later (say, wrap the `Row` in a `Padding`) without also changing the first line.

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

### Why Bother With a Widget?
At first Extract Method looks easier, because there's no constructor to deal with. But an extracted widget is a real widget, so you use it the same way you use `Container` or `Text`, with labeled arguments:

```dart
// Extract Method: positional arguments, and the order matters
buildItemBox(context, title, content, imageUrl, lorem),

// Extract Widget: named arguments, reads like any other Flutter widget
ItemBox(title: title, content: content, imageUrl: imageUrl, lorem: lorem),
```

- You can see what each value is, and the order doesn't matter
- No `context` to pass in. A widget gets its own in its `build` method
- It can move to its own file (click the class name → Refactor → **Move to file**, and the import is added for you)
- Flutter's own [performance guide](https://docs.flutter.dev/perf/best-practices) recommends widgets over helper methods for reusable UI

### The Trick: Make Variables First, Then Extract
The constructor is the part that usually scares people off, and **you don't have to write it.** When you extract, VS Code looks for variables used inside the widget and turns each one into a constructor parameter.

It only does this for *variables*. A value typed directly inside the widget (a string, a URL, a color) gets copied into the new class as-is and stays hardcoded. So before extracting, pull the parts that change into variables in `build`, right above the widget:

```dart
String title = "My Title";
String content = "My Full Content";
String imageUrl = "https://placehold.co/50x50/EEE/31343C.png";
// lorem is already a variable from earlier in build

Row(
  children: [
    InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(title: Text(title), content: Text(content));
          },
        );
      },
      child: Image.network(imageUrl),
    ),
    SizedBox(
      height: 50,
      width: 300,
      child: SingleChildScrollView(child: Text(lorem)),
    ),
  ],
),
```

Now put your cursor on `Row`, press `Cmd/Ctrl + .`, and choose **Extract Widget**. VS Code writes this for you:

```dart
class ItemBox extends StatelessWidget {
  const ItemBox({
    super.key,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.lorem,
  });

  final String title;
  final String content;
  final String imageUrl;
  final String lorem;

  @override
  Widget build(BuildContext context) {
    return Row(
      // ... the same Row, now using title, content, imageUrl, and lorem
    );
  }
}
```

and replaces the original `Row` with a call to it:

```dart
ItemBox(title: title, content: content, imageUrl: imageUrl, lorem: lorem),
```

`required this.title` means "you have to pass a `title`, and it gets stored in the `title` field." You've written this before: it's the same constructor as `Player({required this.name, this.hp = 100})` in [Dart Exercise 5](../../exercises/dart-05-Classes.md#1-a-class-with-fields). The fields are `final` because widgets don't change once they're built (that exercise's [stretch S2](../../exercises/dart-05-Classes.md#s2-final-fields) touches on this). VS Code just typed it all for you. For a refresher on the shorthand, see [Study Guide 01](../../study-guides/01-dart-fundamentals.md#constructor-shorthand).

From here, delete the temporary variables and call `ItemBox` as many times as you need, passing different values each time:

```dart
ItemBox(title: "Item 1", content: "...", imageUrl: "...", lorem: lorem),
ItemBox(title: "Item 2", content: "...", imageUrl: "...", lorem: lorem),
```

**A few things to know:**
- VS Code suggests the name `NewWidget`. Rename it to something that says what it is.
- Don't name it after a Flutter widget (`Card`, `Title`, `Banner`). Yours will quietly replace Flutter's in that file.
- Extract Method picks up variables too, but as positional parameters: `Row buildRow(BuildContext context, String title, String content, String imageUrl, String lorem)`. Same trick, less readable call.

### Where to Cut
There isn't one right answer for *how much* to extract, and it's worth a second of thought before you pick the widget to extract.

Say each item sits in a `Container` whose size and color change from item to item. If you extract the whole `Container`, you end up adding `width`, `height`, and `color` parameters to your widget, which just rebuilds settings `Container` already has. Cut one level deeper instead. Leave the `Container` in `build`, where you can set its properties directly, and extract only the part inside it that repeats:

```dart
// Cut too high: re-creating Container's settings as your own parameters
ItemBox(width: 300, height: 80, color: Colors.amber, title: "Item 1", imageUrl: "..."),

// Cut lower: Container stays in build, only the repeated inside is extracted
Container(
  width: 300,
  height: 80,
  color: Colors.amber,
  child: ItemContent(title: "Item 1", imageUrl: "..."),
),
```

If you notice you're adding a parameter for every property of the outer widget, you probably cut too high.

### When to Create a Custom Widget
Create a custom widget when:
- You'd otherwise copy and paste the same widget tree, even on one screen
- You need the same component in multiple files
- The component has its own state
- The component is complex enough to deserve its own file

### Custom Widget Example
A widget you write by hand looks the same as one VS Code generates. This one has two optional parameters, so they're not `required`:

```dart
// In a new file: custom_button.dart
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final Color? color;
  final IconData? icon;

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

// Constants use lowerCamelCase too
const defaultPadding = 16.0;
const apiKey = 'abc123';  // not API_KEY: the Flutter linter flags ALL_CAPS names

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
- `Cmd/Ctrl + .` - Quick actions menu (cursor on the widget's name)
- `Shift + Option/Alt + F` - Format document
- `F2` - Rename symbol everywhere
- Right-click → **Refactor** - The extract options, plus Move to file

### Extensions for Better Organization
- **Dart** - Essential, provides all extraction features
- **Flutter** - Adds Flutter-specific tools
- **Better Comments** - Color codes different comment types
- **Todo Tree** - Tracks TODO comments across project

## When Covered in Course
- **[Week 2B](../../weekly/2B.md)** - Widget extraction techniques
- **[Week 5B](../../weekly/5B.md#iii-item-box-demo--extract-method--extract-widget)** - Extract Method and Extract Widget on an item box, for Project 1
- Used throughout course for clean code practices

## Related Topics
- [Widget Extraction](../../weekly/2B.md#extract-widget) - The three extract options
- [Dart Exercise 5: Classes and Constructors](../../exercises/dart-05-Classes.md) - The constructor pattern Extract Widget writes for you
- Project 1 - Practical application of DRY principles
- [Professional Commenting](../../commenting_guide.md) - Documentation standards

---
*Last updated: Week 5, Fall 2026 | IGME-340 Reference*
