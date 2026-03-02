# Focus Management & Keyboard Control

## Core Concepts

### What is Focus?
**Focus** determines which widget receives keyboard input. In forms:
- Focused field has cursor and receives keyboard input
- Only one field can have focus at a time
- Tapping a field gives it focus
- Keyboard action buttons (next, done) navigate between fields

### Why Focus Management Matters

**Without Focus Management:**
- "Next" button jumps to wrong fields
- Clear buttons (IconButton) get keyboard focus
- No control over navigation order
- Can't dismiss keyboard programmatically

**With Focus Management:**
- Control exact navigation flow
- Skip over buttons and non-input widgets
- Dismiss keyboard when appropriate
- Professional user experience

## Setting Up Focus Nodes

### Step 1: Declare Focus Nodes
```dart
class _MyFormState extends State<MyForm> {
  // Define at the top of your State class
  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode phoneFocusNode;
  late FocusNode messageFocusNode;
  
  // Also define controllers
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController messageController;
```

⚠️ **Always use `late` keyword** - Focus nodes can't be initialized inline.

### Step 2: Initialize in initState()
```dart
@override
void initState() {
  super.initState();
  
  // Initialize all focus nodes
  nameFocusNode = FocusNode();
  emailFocusNode = FocusNode();
  phoneFocusNode = FocusNode();
  messageFocusNode = FocusNode();
  
  // Initialize controllers too
  nameController = TextEditingController();
  emailController = TextEditingController();
  phoneController = TextEditingController();
  messageController = TextEditingController();
}
```

### Step 3: CRITICAL - Dispose Everything
```dart
@override
void dispose() {
  // Dispose ALL focus nodes
  nameFocusNode.dispose();
  emailFocusNode.dispose();
  phoneFocusNode.dispose();
  messageFocusNode.dispose();
  
  // Dispose ALL controllers
  nameController.dispose();
  emailController.dispose();
  phoneController.dispose();
  messageController.dispose();
  
  super.dispose();  // MUST be last
}
```

⚠️ **Forgetting to dispose causes memory leaks!**

## Controlling Focus Flow

### Chaining Fields Together
```dart
TextField(
  controller: nameController,
  focusNode: nameFocusNode,
  decoration: InputDecoration(labelText: 'Name'),
  textInputAction: TextInputAction.next,  // Shows "Next" on keyboard
  onEditingComplete: () {
    emailFocusNode.requestFocus();  // Jump to email field
  },
)

TextField(
  controller: emailController,
  focusNode: emailFocusNode,
  decoration: InputDecoration(labelText: 'Email'),
  textInputAction: TextInputAction.next,
  onEditingComplete: () {
    phoneFocusNode.requestFocus();  // Jump to phone field
  },
)

TextField(
  controller: phoneController,
  focusNode: phoneFocusNode,
  decoration: InputDecoration(labelText: 'Phone'),
  textInputAction: TextInputAction.done,  // Shows "Done" on keyboard
  onEditingComplete: () {
    phoneFocusNode.unfocus();  // Dismiss keyboard
  },
)
```

### Key Properties:

| Property | Purpose |
|----------|---------|
| `focusNode` | Assigns the FocusNode to control this field |
| `textInputAction` | Sets keyboard action button (next, done, go, search) |
| `onEditingComplete` | Code to run when user presses action button |

## Common Patterns

### Problem: Clear Button Breaks Navigation

**The Issue:**
```dart
TextField(
  controller: nameController,
  decoration: InputDecoration(
    labelText: 'Name',
    suffixIcon: IconButton(  // This gets keyboard focus!
      onPressed: () {
        nameController.clear();
      },
      icon: Icon(Icons.clear),
    ),
  ),
  textInputAction: TextInputAction.next,
)
// Pressing "Next" focuses the clear button instead of next field!
```

**The Fix:**
```dart
TextField(
  controller: nameController,
  focusNode: nameFocusNode,  // Add focus node
  decoration: InputDecoration(
    labelText: 'Name',
    suffixIcon: IconButton(
      onPressed: () {
        nameController.clear();
      },
      icon: Icon(Icons.clear),
    ),
  ),
  textInputAction: TextInputAction.next,
  onEditingComplete: () {
    emailFocusNode.requestFocus();  // Control navigation
  },
)
```

## Dismissing the Keyboard

### Method 1: FocusManager (Most Common)
```dart
// On button press or form submission
ElevatedButton(
  onPressed: () {
    FocusManager.instance.primaryFocus?.unfocus();
    // Process form submission...
  },
  child: Text('Submit'),
)
```

**Use this when:**
- Submitting forms
- Closing modals/dialogs
- Any action that should hide keyboard

### Method 2: GestureDetector (App-Wide Solution)
```dart
@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () {
      FocusManager.instance.primaryFocus?.unfocus();
    },
    child: Scaffold(
      appBar: AppBar(/* ... */),
      body: /* your form */,
    ),
  );
}
```

**Best practice for forms!** Users expect tapping outside to dismiss keyboard.

### Method 3: onTapOutside (Per-Field Basis)
```dart
TextField(
  controller: nameController,
  focusNode: nameFocusNode,
  decoration: InputDecoration(labelText: 'Name'),
  onTapOutside: (event) {
    nameFocusNode.unfocus();
  },
)
```

**Downside:** Must add to every field individually.

### Method 4: FocusNode.unfocus() on Last Field
```dart
TextField(
  controller: messageController,
  focusNode: messageFocusNode,
  decoration: InputDecoration(labelText: 'Message'),
  textInputAction: TextInputAction.done,
  onEditingComplete: () {
    messageFocusNode.unfocus();  // Dismiss keyboard
  },
)
```

**Use for the last field in a form.**

## Preventing Keyboard from Covering Fields

Wrap your form in `SingleChildScrollView` so fields scroll into view when keyboard appears:

```dart
body: SingleChildScrollView(
  child: Container(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        // All your form fields
      ],
    ),
  ),
)
```

**What happens:** When keyboard appears, active field automatically scrolls to stay visible.

⚠️ **Known Issue:** Sometimes emulator pauses for debugging when scrolling with keyboard. Check debug console if app seems to freeze.

## Important Rules

⚠️ **Always Use `late` Keyword**
```dart
// ❌ WRONG
FocusNode nameFocusNode = FocusNode();  // Can't initialize here

// ✅ CORRECT
late FocusNode nameFocusNode;  // Initialize in initState()
```

⚠️ **Always Dispose in Correct Order**
```dart
@override
void dispose() {
  // Dispose your resources first
  nameFocusNode.dispose();
  nameController.dispose();
  
  super.dispose();  // MUST be last
}
```

⚠️ **Assign Both focusNode and onEditingComplete**
```dart
// ❌ INCOMPLETE - Has focusNode but no navigation control
TextField(
  focusNode: nameFocusNode,
  textInputAction: TextInputAction.next,
  // Missing onEditingComplete!
)

// ✅ COMPLETE - Full control over focus flow
TextField(
  focusNode: nameFocusNode,
  textInputAction: TextInputAction.next,
  onEditingComplete: () {
    emailFocusNode.requestFocus();
  },
)
```

## TextInputAction Options

| Action | Keyboard Button | Common Use |
|--------|----------------|------------|
| `TextInputAction.next` | "Next" | Most form fields |
| `TextInputAction.done` | "Done" | Last field in form |
| `TextInputAction.go` | "Go" | Submit/navigate actions |
| `TextInputAction.search` | "Search" | Search fields |
| `TextInputAction.send` | "Send" | Message/email fields |
| `TextInputAction.newline` | Enter/Return | Multi-line text |

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| "Next" goes to clear button | Add FocusNode and onEditingComplete |
| Keyboard covers bottom fields | Wrap body in SingleChildScrollView |
| App crashes on back button | Ensure dispose() calls super.dispose() last |
| Can't dismiss keyboard | Use FocusManager.instance.primaryFocus?.unfocus() |
| Memory leaks | Always dispose FocusNodes and Controllers |
| "late initialization error" | Initialize in initState(), not at declaration |
| Keyboard doesn't show | Check emulator settings - may need to enable on-screen keyboard |

## Android Emulator Keyboard Setup

⚠️ **Important:** Latest Android emulators may show a button instead of the on-screen keyboard. To get the proper mobile experience:

1. Open emulator settings (three dots menu)
2. Go to Settings → General → Show virtual keyboard
3. Select "Show on-screen keyboard"

**Why this matters:** You need to test that keyboard doesn't cover your fields - the button doesn't test this!

See [Week 6A notes](../../weekly/6A.md#android-emulator-keyboard-note) for detailed setup instructions.

## Best Practices

1. **Always dispose** - Every FocusNode and Controller must be disposed
2. **Use GestureDetector** - Wrap Scaffold for tap-to-dismiss behavior
3. **Test keyboard navigation** - Verify "Next" flows through fields correctly
4. **Combine with SingleChildScrollView** - Prevent keyboard from covering fields
5. **Keep focus flow simple** - Usually just sequential: field1 → field2 → field3 → done
6. **Use TextInputAction.done on last field** - Clear indicator to user

## When Covered in Course
- **[Week 6A](../../weekly/6A.md)** - Introduction to TextEditingController
- **[Week 8B](../../weekly/8B.md)** - Complete focus management patterns
- **Project 2** - Essential for search forms
- **Project 3** - Required for any multi-field forms

## Related Topics
- [TextField Basics](textfield-basics.md) - Core text input concepts
- [Form Validation](form-validation.md) - Validating form input
- [SingleChildScrollView](../widgets/singlechildscrollview.md) - Preventing keyboard overlap

## External Resources
- [Focus and text fields - Flutter Documentation](https://docs.flutter.dev/cookbook/forms/focus)
- [FocusNode Class Documentation](https://api.flutter.dev/flutter/widgets/FocusNode-class.html)
- [FocusManager Documentation](https://api.flutter.dev/flutter/widgets/FocusManager-class.html)
- [TextInputAction Enum](https://api.flutter.dev/flutter/services/TextInputAction.html)

---
*Last updated: Week 8A | IGME-340 Reference*
