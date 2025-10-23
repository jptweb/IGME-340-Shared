# Named Routes

**Quick Reference:** Clean, maintainable navigation using string-based route names instead of direct widget references.

> **📌 When Covered:** [Week 9B](../../weekly/9B.md) - Simplified navigation patterns

---

## Quick Example

```dart
// Setup routes in main.dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomePage(),
    '/profile': (context) => ProfilePage(),
    '/settings': (context) => SettingsPage(),
  },
)

// Navigate anywhere in your app
Navigator.pushNamed(context, '/profile');
```

**That's it!** No need to import page files everywhere, just use the route name.

---

## Why Use Named Routes?

### ❌ Without Named Routes (Basic Navigation)
```dart
// Every file needs to import the page class
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';
import 'pages/about_page.dart';

// Verbose navigation code
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ProfilePage()
  )
);
```

### ✅ With Named Routes
```dart
// No imports needed!
// All routes defined in one place (main.dart)

// Clean, simple navigation
Navigator.pushNamed(context, '/profile');
```

**Benefits:**
1. **Centralized** - All routes in one place (`main.dart`)
2. **Maintainable** - Change a route once, works everywhere
3. **Cleaner code** - One line instead of six
4. **No imports** - Don't need to import page files everywhere
5. **Easy refactoring** - Change page classes without breaking navigation calls

---

## Setting Up Named Routes

### Step 1: Define Routes in main.dart

```dart
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Specify the starting route
      initialRoute: '/',
      
      // Define all routes
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/settings': (context) => SettingsPage(),
        '/about': (context) => AboutPage(),
      },
    );
  }
}
```

**Key Points:**
- `initialRoute` - The route shown when app starts (usually `'/'`)
- `routes` - A Map<String, WidgetBuilder> of all your routes
- Each route maps a string name to a widget builder function
- The `/` route is typically your home page

### Step 2: Navigate Using Route Names

```dart
// Push a named route
ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, '/profile');
  },
  child: Text('View Profile'),
)

// Pop back (same as before)
ElevatedButton(
  onPressed: () {
    Navigator.pop(context);
  },
  child: Text('Back'),
)
```

---

## Named Route Methods

### Navigator.pushNamed()

Navigate to a named route.

```dart
Navigator.pushNamed(context, '/routeName');
```

### Navigator.pushReplacementNamed()

Replace current route with a named route (no back button).

```dart
Navigator.pushReplacementNamed(context, '/home');
```

**Use case:** After login, replace login page with home page.

### Navigator.popAndPushNamed()

Pop current route and push a new named route in one action.

```dart
Navigator.popAndPushNamed(context, '/otherPage');
```

### Navigator.pushNamedAndRemoveUntil()

Push a route and remove all previous routes until a condition is met.

```dart
// Go to home and clear entire navigation stack
Navigator.pushNamedAndRemoveUntil(
  context,
  '/home',
  (route) => false,  // Remove all previous routes
);
```

**Use case:** Logout - go to login screen and clear all previous pages.

---

## Common Patterns

### Pattern 1: Standard Navigation

```dart
ListTile(
  title: Text('Settings'),
  onTap: () => Navigator.pushNamed(context, '/settings'),
)
```

### Pattern 2: Replace After Login

```dart
// Login button - go to home, can't go back to login
ElevatedButton(
  onPressed: () {
    if (loginSuccessful) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  },
  child: Text('Login'),
)
```

### Pattern 3: Logout Flow

```dart
// Clear entire stack and go to login
ElevatedButton(
  onPressed: () {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/login',
      (route) => false,  // Remove all routes
    );
  },
  child: Text('Logout'),
)
```

### Pattern 4: Bottom Navigation Bar

```dart
int currentIndex = 0;

BottomNavigationBar(
  currentIndex: currentIndex,
  onTap: (index) {
    setState(() => currentIndex = index);
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/search');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  },
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ],
)
```

---

## Route Naming Conventions

### ✅ Good Route Names

```dart
routes: {
  '/': (context) => HomePage(),           // Root/home
  '/login': (context) => LoginPage(),     // Simple name
  '/profile': (context) => ProfilePage(),
  '/settings': (context) => SettingsPage(),
  '/products': (context) => ProductsPage(),
  '/product-detail': (context) => ProductDetailPage(),
}
```

**Best practices:**
- Start with `/`
- Use lowercase
- Use hyphens for multi-word routes
- Keep names simple and descriptive
- Match the page purpose, not the class name

### ❌ Avoid

```dart
routes: {
  'home': (context) => HomePage(),        // ❌ Missing leading /
  '/Profile': (context) => ProfilePage(), // ❌ Capitalized
  '/user_settings': (context) => ...      // ❌ Underscores (use hyphens)
  '/pg2': (context) => ...                // ❌ Unclear abbreviations
}
```

---

## Passing Arguments with Named Routes

See [Data Passing Between Pages](data-passing.md) for detailed examples, but here's a quick reference:

### Sending Data

```dart
Navigator.pushNamed(
  context,
  '/product-detail',
  arguments: {
    'id': 123,
    'name': 'Product Name',
  },
);
```

### Receiving Data

```dart
// In the destination page
@override
Widget build(BuildContext context) {
  final Map args = ModalRoute.of(context)?.settings.arguments as Map;
  final int id = args['id'];
  final String name = args['name'];
  
  return Scaffold(
    appBar: AppBar(title: Text(name)),
    body: Text('Product ID: $id'),
  );
}
```

---

## When Route Doesn't Exist

### Handle Unknown Routes

```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomePage(),
    '/about': (context) => AboutPage(),
  },
  
  // Catch-all for unknown routes
  onUnknownRoute: (settings) {
    return MaterialPageRoute(
      builder: (context) => NotFoundPage(),
    );
  },
)
```

**Use case:** If someone tries to navigate to `'/invalid-route'`, they'll see your NotFoundPage instead of crashing.

---

## Advanced: onGenerateRoute

For more complex routing logic (dynamic routes, authentication checks, etc.):

```dart
MaterialApp(
  onGenerateRoute: (settings) {
    // Extract route name and arguments
    final String routeName = settings.name ?? '/';
    final args = settings.arguments;
    
    // Custom routing logic
    switch (routeName) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      
      case '/profile':
        // Check authentication
        if (isLoggedIn) {
          return MaterialPageRoute(builder: (_) => ProfilePage());
        } else {
          return MaterialPageRoute(builder: (_) => LoginPage());
        }
      
      case '/product-detail':
        // Validate arguments
        if (args is Map && args.containsKey('id')) {
          return MaterialPageRoute(
            builder: (_) => ProductDetailPage(id: args['id']),
          );
        }
        // Invalid arguments, go to products list
        return MaterialPageRoute(builder: (_) => ProductsPage());
      
      default:
        return MaterialPageRoute(builder: (_) => NotFoundPage());
    }
  },
)
```

**When to use:**
- Authentication-based routing
- Complex argument validation
- Dynamic route generation
- Deep linking support

---

## Comparison: Basic vs Named Routes

| Feature | Basic Navigation | Named Routes |
|---------|-----------------|--------------|
| **Setup** | None needed | Define routes in `main.dart` |
| **Navigation call** | `Navigator.push(context, MaterialPageRoute(...))` | `Navigator.pushNamed(context, '/route')` |
| **Imports** | Need to import page class | No imports needed |
| **Code length** | 6+ lines | 1 line |
| **Maintenance** | Change everywhere | Change once in `main.dart` |
| **Best for** | Small apps, prototypes | Production apps |
| **Data passing** | Direct constructor params | Through `arguments` parameter |
| **Learning curve** | Simpler to start | Requires understanding of route configuration |

---

## Important Rules

### ✅ DO:

1. **Use consistent naming**
   ```dart
   '/home', '/profile', '/settings'  // ✅ Consistent pattern
   ```

2. **Define all routes in one place**
   ```dart
   // All routes in main.dart MaterialApp
   routes: { ... }
   ```

3. **Use initialRoute to specify starting page**
   ```dart
   initialRoute: '/',
   ```

### ❌ DON'T:

1. **Don't forget the leading slash**
   ```dart
   'home'  // ❌ Won't work
   '/home' // ✅ Correct
   ```

2. **Don't define routes in multiple places**
   ```dart
   // ❌ Scattered route definitions
   // Keep them all in main.dart
   ```

3. **Don't use inconsistent naming**
   ```dart
   routes: {
     '/home': ...,
     'Profile': ...,  // ❌ Inconsistent (no /, capitalized)
     '/settings_page': ...,  // ❌ Uses underscores instead of hyphens
   }
   ```

---

## Common Errors & Solutions

### Error: "Could not find a generator for route RouteSettings('/page')"

**Cause:** Route name doesn't exist in routes map.

**Solution:**
```dart
// Make sure route is defined
routes: {
  '/': (context) => HomePage(),
  '/page': (context) => YourPage(),  // Add this!
}
```

### Error: "The argument type 'String' can't be assigned to parameter type 'Route'"

**Cause:** Using `Navigator.push()` with a route name instead of `Navigator.pushNamed()`.

**Solution:**
```dart
// ❌ Wrong
Navigator.push(context, '/profile');

// ✅ Correct
Navigator.pushNamed(context, '/profile');
```

---

## Migration Guide: Basic → Named Routes

### Before (Basic Navigation)

```dart
// home_page.dart
import 'profile_page.dart';  // Import needed

ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfilePage()
      )
    );
  },
  child: Text('Profile'),
)
```

### After (Named Routes)

```dart
// main.dart
routes: {
  '/': (context) => HomePage(),
  '/profile': (context) => ProfilePage(),  // Define once
}

// home_page.dart
// No import needed!

ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, '/profile');  // One line!
  },
  child: Text('Profile'),
)
```

---

## Complete Example: Named Routes App

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
      },
      // Handle unknown routes
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => NotFoundPage(),
        );
      },
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
              onPressed: () => Navigator.pushNamed(context, '/second'),
              child: Text('Go to Second Page'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/third'),
              child: Text('Go to Third Page'),
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
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the second page'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Go Back'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/third'),
              child: Text('Replace with Third Page'),
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
      appBar: AppBar(title: Text('Third Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the third page'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              child: Text('Go Home'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              ),
              child: Text('Go Home (Clear Stack)'),
            ),
          ],
        ),
      ),
    );
  }
}

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('404')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page Not Found', style: TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              ),
              child: Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Related Topics

- [Basic Navigation](basic-navigation.md) - Navigator fundamentals
- [Data Passing Between Pages](data-passing.md) - Sending/receiving data with routes
- [GoRouter Package](gorouter.md) *(coming Week 10A)* - Even more powerful routing

---

*Last updated: Week 9B | Fall 2025*
