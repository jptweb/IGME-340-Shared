# GoRouter - Modern Navigation Package

**When Covered:** Week 10A  
**Package:** `go_router` (pub.dev)  
**Prerequisites:** [Basic Navigation](basic-navigation.md), [Named Routes](named-routes.md)

---

## What is GoRouter?

GoRouter is Flutter's **declarative navigation package** (Navigation 2.0) that provides:
- ✅ URL-style routing (great for web)
- ✅ Cleaner syntax than Navigator.pushNamed()
- ✅ Built-in deep linking support
- ✅ Type-safe route parameters
- ✅ Maintained by the Flutter team
- ✅ 1.47M+ downloads

Think of it as **Named Routes 2.0** - all the benefits, better design.

---

## Quick Start

### Installation

```bash
flutter pub add go_router
```

### Basic Setup

```dart
import 'package:go_router/go_router.dart';

// Define routes (global scope, outside any class)
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
  ],
);

// Use MaterialApp.router
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
```

### Basic Navigation

```dart
// Navigate to a route
ElevatedButton(
  onPressed: () => context.go('/profile'),
  child: const Text('Go to Profile'),
)

// Go back to home
ElevatedButton(
  onPressed: () => context.go('/'),
  child: const Text('Home'),
)
```

---

## Common Patterns

### Pattern 1: Path Parameters

**Use when:** Passing IDs or simple values in the URL

```dart
// Define route with parameter
GoRoute(
  path: '/details/:id',
  builder: (context, state) {
    final id = state.pathParameters['id']!;
    return DetailsPage(id: id);
  },
)

// Navigate with parameter
context.go('/details/42');
```

**For integers:**
```dart
GoRoute(
  path: '/details/:id',
  builder: (context, state) {
    final id = int.parse(state.pathParameters['id']!);
    return DetailsPage(id: id);
  },
)
```

### Pattern 2: Query Parameters

**Use when:** Optional filters or settings

```dart
// Define route
GoRoute(
  path: '/search',
  builder: (context, state) {
    final query = state.uri.queryParameters['q'] ?? '';
    return SearchPage(query: query);
  },
)

// Navigate with query
context.go('/search?q=flutter');
```

### Pattern 3: Extra Data

**Use when:** Passing complex objects (not visible in URL)

```dart
// Define route
GoRoute(
  path: '/details',
  builder: (context, state) {
    final data = state.extra as Map<String, dynamic>;
    return DetailsPage(data: data);
  },
)

// Navigate with extra
final userData = {
  'name': 'Alice',
  'email': 'alice@example.com',
};

context.go('/details', extra: userData);
```

### Pattern 4: Named Routes (Optional)

**Use when:** Want to reference routes by name

```dart
// Define route with name
GoRoute(
  name: 'profile',
  path: '/profile/:userId',
  builder: (context, state) {
    final userId = state.pathParameters['userId']!;
    return ProfilePage(userId: userId);
  },
)

// Navigate by name
context.goNamed('profile', pathParameters: {'userId': '123'});
```

---

## Navigation Methods

| Method | Description | Use When |
|--------|-------------|----------|
| `context.go('/path')` | Navigate to path | Normal navigation |
| `context.push('/path')` | Push onto stack | Want back button |
| `context.pop()` | Go back | Manual back navigation |
| `context.replace('/path')` | Replace current route | Login → Home (no back) |

### go() vs push()

```dart
// context.go() - No stack, just "go there"
context.go('/settings'); // No back button in AppBar

// context.push() - Maintains stack
context.push('/settings'); // Shows back button
```

**Most common:** Use `context.go()` and manually navigate to previous screens.

---

## Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Router configuration
final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/users',
      builder: (context, state) => const UsersPage(),
    ),
    GoRoute(
      path: '/users/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return UserDetailPage(userId: id);
      },
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/users'),
          child: const Text('View Users'),
        ),
      ),
    );
  }
}

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('User ${index + 1}'),
            onTap: () => context.go('/users/$index'),
          );
        },
      ),
    );
  }
}

class UserDetailPage extends StatelessWidget {
  final int userId;

  const UserDetailPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User $userId')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Details for user $userId'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/users'),
              child: const Text('Back to Users'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Important Rules

### ✅ DO

```dart
// Use MaterialApp.router (not MaterialApp)
MaterialApp.router(routerConfig: _router)

// Parse path parameters to correct type
final id = int.parse(state.pathParameters['id']!);

// Import go_router in pages that navigate
import 'package:go_router/go_router.dart';

// Use context.go() for declarative navigation
context.go('/profile');
```

### ❌ DON'T

```dart
// Don't mix Navigator and GoRouter
Navigator.pushNamed(context, '/profile'); // NO!
context.go('/profile'); // YES!

// Don't forget to parse strings
final id = state.pathParameters['id']; // Returns String!

// Don't use regular MaterialApp
MaterialApp(routes: {...}) // Wrong package
```

---

## Common Errors & Fixes

### "No route exists with /path"

**Problem:** Route not defined or typo in path

```dart
// Make sure path is defined in _router
GoRoute(
  path: '/settings',  // Must match exact path
  builder: (context, state) => const SettingsPage(),
)
```

### "The getter was called on null"

**Problem:** Path parameter doesn't exist

```dart
// Use ! only if you're SURE parameter exists
final id = state.pathParameters['id']!;

// Or provide default
final id = state.pathParameters['id'] ?? '0';
```

### "pathParameters is empty"

**Problem:** Forgot colon in path definition

```dart
// WRONG
path: '/details/id'

// CORRECT
path: '/details/:id'
```

---

## When to Use GoRouter vs Named Routes

| Use GoRouter When | Use Named Routes When |
|-------------------|----------------------|
| Building new apps | Working with existing code |
| Need web support | Simple mobile-only app |
| Want modern patterns | Learning navigation basics |
| Need deep linking | Quick prototypes |
| 5+ routes | 2-3 routes |

**Recommendation:** Start new projects with GoRouter. It's the future of Flutter navigation.

---

## When Covered in Course

- **[Week 10A](../../weekly/10A.md)** - Introduction to GoRouter, replacing Named Routes with URL-style routing, path parameters for passing data between pages, integrating with Provider for state management
- **Project 2** - Used for multi-page API applications with clean navigation patterns
- **Project 3** - Optional enhancement for complex navigation hierarchies

---

## Related Topics

- [Basic Navigation](basic-navigation.md) - Navigator fundamentals
- [Named Routes](named-routes.md) - Alternative routing approach
- [Data Passing](data-passing.md) - Sending data between pages
- [Provider Pattern](../state-management/provider-pattern.md) - State management with routing

---

## Advanced Features (Not Covered in Week 10A)

GoRouter has many more features:
- **Redirects & Guards** - Authentication checks, conditional routing
- **Shell Routes** - Persistent navigation (like bottom nav)
- **Nested Navigation** - Complex hierarchies
- **404 Handling** - Custom error pages
- **Transition Animations** - Custom page transitions

See [GoRouter documentation](https://pub.dev/packages/go_router) for advanced usage.

---

## Quick Reference

```dart
// Installation
flutter pub add go_router

// Import
import 'package:go_router/go_router.dart';

// Define routes (global)
final _router = GoRouter(
  initialLocation: '/',
  routes: [/* GoRoute list */],
);

// Use router
MaterialApp.router(routerConfig: _router)

// Navigate
context.go('/path')           // Go to path
context.push('/path')          // Push onto stack
context.pop()                  // Go back
context.replace('/path')       // Replace current

// Path parameters
path: '/details/:id'
state.pathParameters['id']

// Query parameters
path: '/search'
state.uri.queryParameters['q']

// Extra data
context.go('/path', extra: data)
state.extra as Type
```

---

*Last updated: Week 10A | Fall 2025*
