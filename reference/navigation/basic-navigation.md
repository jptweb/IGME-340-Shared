# Basic Navigation (Navigator & MaterialPageRoute)

**Quick Reference:** Basic page navigation using `Navigator.push()` and `Navigator.pop()` with `MaterialPageRoute`.

> **📌 When Covered:** [Week 9B](../../weekly/9B.md) - Navigation fundamentals

---

## Quick Example

```dart
// Navigate TO a new page
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondPage()
      )
    );
  },
  child: Text('Go to Second Page'),
)

// Navigate BACK from a page
ElevatedButton(
  onPressed: () {
    Navigator.pop(context);
  },
  child: Text('Go Back'),
)
```

---

**Warning! theres lot of good info here overall about navigation BUT** keep in mind it may be best when you make you app routes to use (named routes)[named-routes.md] so make sure to check out all chapters here on this topic before picking an approach.

## The Navigator Stack

Flutter's Navigator works like a **stack of plates** (LIFO - Last In, First Out):

```
┌─────────────────┐
│   Third Page    │ ← Top of stack (current page)
├─────────────────┤
│   Second Page   │
├─────────────────┤
│   First Page    │ ← Bottom of stack
└─────────────────┘
```

- **Push** adds a new page on top
- **Pop** removes the current page from the top
- You can only interact with the top page
- Popping reveals the page underneath

---

## Core Navigation Methods

### Navigator.push()

Adds a new page to the stack.

```dart
Navigator.push(
  context,                    // BuildContext - required
  MaterialPageRoute(          // The route to push
    builder: (context) {      // Builder function
      return DestinationPage();  // Return the widget
    }
  )
);
```

**What happens:**
1. Current page stays in memory underneath
2. New page slides in from the right (on Android)
3. Automatic back button appears in AppBar
4. User can swipe from left edge to go back (iOS)

### Navigator.pop()

Removes the current page from the stack.

```dart
Navigator.pop(context);
```

**What happens:**
1. Current page is destroyed
2. Previous page is revealed
3. Transition animation plays in reverse
4. If this is the last page, the app will exit

### Navigator.pushReplacement()

Replaces the current page instead of stacking.

```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => NewPage()
  )
);
```

**Use cases:**
- Login → Home (don't want back button to login)
- Onboarding → Main app
- Any time you want to prevent going back

**Key difference:** No automatic back button since there's nothing to go back to.

---

## MaterialPageRoute

A Material Design route with platform-appropriate transitions.

### Basic Syntax

```dart
MaterialPageRoute(
  builder: (context) {
    return YourWidget();
  }
)
```

### Arrow Function Shorthand

```dart
MaterialPageRoute(
  builder: (context) => YourWidget()
)
```

Both syntaxes are equivalent. The arrow function is more concise when you're just returning a widget.

---

## Common Patterns

### Pattern 1: Button Navigation

```dart
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage()
      )
    );
  },
  child: Text('View Profile'),
)
```

### Pattern 2: ListTile Navigation

```dart
ListTile(
  title: Text('Settings'),
  trailing: Icon(Icons.arrow_forward_ios),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsPage()
      )
    );
  },
)
```

### Pattern 3: Back Button in AppBar

```dart
AppBar(
  title: Text('Detail Page'),
  leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
)
```

**Note:** Usually unnecessary since Flutter provides an automatic back button. Only needed if you want custom behavior.

### Pattern 4: Custom Back Button Anywhere

```dart
ElevatedButton(
  onPressed: () => Navigator.pop(context),
  child: Text('Go Back'),
)
```

### Pattern 5: Replace Current Page

```dart
// Login successful, go to home (prevent back to login)
ElevatedButton(
  onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage()
      )
    );
  },
  child: Text('Login'),
)
```

---

## Navigation Stack Management

### Example Stack Evolution

```dart
// Start: HomePage only
Navigator Stack: [HomePage]

// User taps "View Profile" button
Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
Navigator Stack: [HomePage, ProfilePage]

// User taps "Edit Profile" button
Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
Navigator Stack: [HomePage, ProfilePage, EditProfilePage]

// User hits back button
Navigator.pop(context);
Navigator Stack: [HomePage, ProfilePage]

// User hits back button again
Navigator.pop(context);
Navigator Stack: [HomePage]
```

### Checking Stack State

```dart
// Check if you can pop (is there a page underneath?)
bool canPop = Navigator.canPop(context);

if (canPop) {
  Navigator.pop(context);
} else {
  // This is the last page, show confirmation dialog before exiting?
}
```

---

## Important Rules

### ✅ DO:

1. **Always use `context` from the build method**
   ```dart
   @override
   Widget build(BuildContext context) {
     // This context has access to Navigator
     Navigator.push(context, ...);
   }
   ```

2. **Wrap navigation in functions**
   ```dart
   onPressed: () {
     Navigator.push(...);  // ✅ Wrapped in function
   }
   ```

3. **Provide back navigation**
   - Let Flutter's automatic back button handle it, OR
   - Provide a custom back button with `Navigator.pop()`

### ❌ DON'T:

1. **Don't navigate without wrapping in a function**
   ```dart
   onPressed: Navigator.push(...)  // ❌ Won't work!
   ```

2. **Don't create circular navigation loops**
   ```dart
   // Page A pushes Page B
   // Page B pushes Page A
   // Infinite loop - BAD!
   ```

3. **Don't forget context availability**
   ```dart
   // Can't navigate from initState without context
   @override
   void initState() {
     super.initState();
     Navigator.push(context, ...);  // ❌ Context not ready yet
   }
   ```

---

## Common Errors & Solutions

### Error: "Navigator operation requested with a context that does not include a Navigator"

**Cause:** Trying to navigate before the Navigator widget exists in the tree.

**Solution:**
```dart
// Instead of navigating in initState, use WidgetsBinding
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.push(context, ...);  // ✅ Now context is ready
  });
}
```

### Error: "Pop called when no pages in stack"

**Cause:** Trying to pop when you're already at the root page.

**Solution:**
```dart
if (Navigator.canPop(context)) {
  Navigator.pop(context);
} else {
  // Handle case where this is the last page
  showDialog(...);  // Maybe show "Are you sure you want to exit?"
}
```

---

## When to Use Basic Navigation vs Named Routes

### Use Basic Navigation When:
- Small app with few pages
- Simple navigation flow
- Prototyping/learning
- Direct page-to-page navigation

### Use Named Routes When:
- Larger app with many pages
- Complex navigation patterns
- Want centralized route management
- Need deep linking support

**Next Step:** Learn about [Named Routes](named-routes.md) for cleaner, more maintainable navigation code.

---

## Related Topics

- [Named Routes](named-routes.md) - Cleaner navigation using string identifiers
- [Data Passing Between Pages](data-passing.md) - Send and receive data during navigation
- [Dialogs & Alerts](dialogs-alerts.md) - Modal overlays that don't use Navigator stack

---

## Complete Example: Multi-Page App

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage()
                  ),
                );
              },
              child: Text('Go to Second Page'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdPage()
                  ),
                );
              },
              child: Text('Replace with Third Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        // Flutter provides automatic back button
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the second page'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
        // No automatic back button (we used pushReplacement)
      ),
      body: Center(
        child: Text('No way to go back - we replaced the previous page!'),
      ),
    );
  }
}
```

---

*Last updated: Week 9B | Fall 2025*
