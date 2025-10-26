# Provider Pattern - State Management

**When Covered:** Week 10A  
**Package:** `provider` (pub.dev)  
**Prerequisites:** [setState Basics](setstate-basics.md), [Declarative UI Architecture](declarative-ui-architecture.md)

---

## What is Provider?

Provider is Flutter's **recommended state management solution** that allows you to:
- ✅ Share data across multiple widgets without passing it through constructors
- ✅ Automatically rebuild widgets when data changes (no setState needed!)
- ✅ Keep your code organized with centralized state
- ✅ Scale from small to large applications
- ✅ 3.9M+ downloads, maintained by the Flutter team

**Think of it as:** A global variable that's smart enough to notify widgets when it changes.

---

## The Problem Provider Solves

### Without Provider (❌)

```dart
// Scattered setState calls across multiple files
// Passing data through 5+ widget constructors
// Pages don't auto-sync when data changes

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int money = 1000;  // Can't share with other pages!
  
  void earnMoney() {
    setState(() {
      money += 10;  // Other pages don't know this changed
    });
  }
}
```

### With Provider (✅)

```dart
// One class holds all shared data
// Widgets automatically update when data changes
// No setState needed!

class GameProvider with ChangeNotifier {
  int money = 1000;  // Accessible from ANY widget
  
  void earnMoney() {
    money += 10;
    notifyListeners();  // All watching widgets rebuild!
  }
}
```

---

## Quick Start

### Installation

```bash
flutter pub add provider
```

### Basic Setup (3 Steps)

**Step 1: Create a Provider Class**

```dart
import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;
  
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners();  // Critical! Tells widgets to rebuild
  }
}
```

**Step 2: Wrap Your App with Provider**

```dart
import 'package:provider/provider.dart';
import 'counter_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}
```

**Step 3: Use in Widgets**

```dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Watch for changes
    var counter = context.watch<CounterProvider>();
    
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Count: ${counter.count}'),
            ElevatedButton(
              onPressed: () => counter.increment(),
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Core Concepts

### ChangeNotifier

The magic behind Provider - it gives your class the ability to notify listeners.

```dart
class MyData with ChangeNotifier {
  int _value = 0;
  
  int get value => _value;
  
  void updateValue(int newValue) {
    _value = newValue;
    notifyListeners();  // Must call this!
  }
}
```

**Key Points:**
- Use `with ChangeNotifier` (mixin, not extends)
- Call `notifyListeners()` after **every** data change
- Private variables with public getters are optional but recommended

### context.watch vs context.read

| Method | Purpose | When to Use | Rebuilds? |
|--------|---------|-------------|-----------|
| `context.watch<T>()` | Get data AND listen for changes | Inside build() method | Yes |
| `context.read<T>()` | Get data once, no listening | Inside callbacks (onPressed, etc.) | No |

```dart
@override
Widget build(BuildContext context) {
  // ✅ Use watch in build - rebuilds when data changes
  var data = context.watch<MyProvider>();
  
  return ElevatedButton(
    // ✅ Use read in callbacks - doesn't rebuild unnecessarily
    onPressed: () => context.read<MyProvider>().updateData(),
    child: Text(data.value),
  );
}
```

---

## Common Patterns

### Pattern 1: Simple Data Provider

```dart
class SettingsProvider with ChangeNotifier {
  bool _darkMode = false;
  String _language = 'en';
  
  bool get darkMode => _darkMode;
  String get language => _language;
  
  void toggleDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }
  
  void setLanguage(String lang) {
    _language = lang;
    notifyListeners();
  }
}
```

### Pattern 2: List Management

```dart
class TodoProvider with ChangeNotifier {
  final List<String> _todos = [];
  
  List<String> get todos => _todos;
  
  void addTodo(String todo) {
    _todos.add(todo);
    notifyListeners();
  }
  
  void removeTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
```

### Pattern 3: Complex State with Multiple Properties

```dart
class GameProvider with ChangeNotifier {
  int _money = 1000;
  int _clickValue = 1;
  List<Map> _items = [];
  
  int get money => _money;
  int get clickValue => _clickValue;
  List<Map> get items => _items;
  
  void earnMoney() {
    _money += _clickValue;
    notifyListeners();
  }
  
  void buyItem(Map item) {
    _money -= item['cost'];
    _items.add(item);
    _clickValue += item['value'];
    notifyListeners();  // One call updates everything!
  }
}
```

### Pattern 4: Provider with Initialization

```dart
class UserProvider with ChangeNotifier {
  String? _username;
  
  UserProvider() {
    _loadUserData();
  }
  
  String? get username => _username;
  
  Future<void> _loadUserData() async {
    // Load from storage, API, etc.
    _username = await fetchUsername();
    notifyListeners();
  }
}
```

---

## Multiple Providers

When you need several providers:

```dart
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

// Access in widgets
var counter = context.watch<CounterProvider>();
var user = context.watch<UserProvider>();
var settings = context.watch<SettingsProvider>();
```

---

## Complete Example: Shopping Cart

```dart
// cart_provider.dart
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<String> _items = [];
  double _total = 0.0;
  
  List<String> get items => _items;
  double get total => _total;
  int get itemCount => _items.length;
  
  void addItem(String item, double price) {
    _items.add(item);
    _total += price;
    notifyListeners();
  }
  
  void removeItem(int index, double price) {
    _items.removeAt(index);
    _total -= price;
    notifyListeners();
  }
  
  void clearCart() {
    _items.clear();
    _total = 0.0;
    notifyListeners();
  }
}

// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ShopPage(),
    );
  }
}

// shop_page.dart
class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartProvider>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          IconButton(
            icon: Badge(
              label: Text('${cart.itemCount}'),
              child: const Icon(Icons.shopping_cart),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Widget 1'),
            subtitle: const Text('\$10.00'),
            trailing: ElevatedButton(
              onPressed: () => context.read<CartProvider>()
                  .addItem('Widget 1', 10.00),
              child: const Text('Add'),
            ),
          ),
          ListTile(
            title: const Text('Widget 2'),
            subtitle: const Text('\$20.00'),
            trailing: ElevatedButton(
              onPressed: () => context.read<CartProvider>()
                  .addItem('Widget 2', 20.00),
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}

// cart_page.dart
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartProvider>();
    
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cart.items[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => cart.removeItem(index, 10.00),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Total: \$${cart.total.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: cart.itemCount > 0 ? () => cart.clearCart() : null,
                  child: const Text('Clear Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## Important Rules

### ✅ DO

```dart
// Always call notifyListeners after changes
void updateValue(int newValue) {
  _value = newValue;
  notifyListeners();  // Don't forget!
}

// Use context.watch in build()
@override
Widget build(BuildContext context) {
  var data = context.watch<MyProvider>();
  return Text(data.value);
}

// Use context.read in callbacks
onPressed: () => context.read<MyProvider>().update(),

// Wrap app at root level
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MyApp(),
    ),
  );
}
```

### ❌ DON'T

```dart
// Don't forget notifyListeners
void update() {
  _value = 5;
  // Missing notifyListeners! UI won't update!
}

// Don't use context.watch in callbacks
onPressed: () {
  var data = context.watch<MyProvider>();  // NO! Causes errors
  data.update();
}

// Don't mix setState with Provider
class MyWidget extends StatefulWidget {
  void update() {
    setState(() {  // NO! Let Provider handle updates
      // ...
    });
  }
}

// Don't call methods that return void in build
@override
Widget build(BuildContext context) {
  context.read<MyProvider>().update();  // NO! Use watch or Consumer
  return Text('Hi');
}
```

---

## Common Errors & Fixes

### "Could not find the correct Provider"

**Problem:** Provider not wrapped around widget tree

```dart
// WRONG - Provider below where it's used
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = context.watch<MyProvider>();  // Error!
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: Text(data.value),
    );
  }
}

// CORRECT - Provider above where it's used
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MyApp(),
    ),
  );
}
```

### "context.watch called in a function that's not build"

**Problem:** Using watch in callback

```dart
// WRONG
onPressed: () {
  var data = context.watch<MyProvider>();
}

// CORRECT
onPressed: () {
  context.read<MyProvider>().update();
}
```

### Data changes but UI doesn't update

**Problem:** Forgot `notifyListeners()`

```dart
// WRONG
void update() {
  _value = 5;
}

// CORRECT
void update() {
  _value = 5;
  notifyListeners();
}
```

---

## Provider vs setState

| Aspect | setState | Provider |
|--------|----------|----------|
| **Scope** | Single widget only | Entire app |
| **Sharing** | Must pass through constructors | Accessible anywhere |
| **Updates** | Manually call setState() | Automatic with notifyListeners() |
| **Complexity** | Simple | More setup, but scales better |
| **Use When** | Local widget state | Shared app state |

**Rule of Thumb:**
- Use setState for local UI state (like TextField focus, dropdown selection)
- Use Provider for shared app state (like user data, cart, settings)

---

## Related Topics

- [setState Basics](setstate-basics.md) - Local state management
- [Declarative UI Architecture](declarative-ui-architecture.md) - Understanding Flutter's UI model
- [GoRouter](../navigation/gorouter.md) - Navigation with Provider
- Consumer Widget *(coming Week 10B)* - Targeted rebuilds
- FutureProvider *(coming Week 10B)* - Async data loading

---

## Quick Reference

```dart
// Installation
flutter pub add provider

// Import
import 'package:provider/provider.dart';

// Create provider class
class MyProvider with ChangeNotifier {
  int _data = 0;
  int get data => _data;
  
  void update(int value) {
    _data = value;
    notifyListeners();  // Critical!
  }
}

// Wrap app
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MyApp(),
    ),
  );
}

// Use in widgets
var provider = context.watch<MyProvider>();  // In build()
context.read<MyProvider>().update(5);        // In callbacks

// Multiple providers
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => Provider1()),
    ChangeNotifierProvider(create: (_) => Provider2()),
  ],
  child: MyApp(),
)
```

---

*Last updated: Week 10A | Fall 2025*
