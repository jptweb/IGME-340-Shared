# SharedPreferences Reference

## Quick Example
```dart
import 'package:shared_preferences/shared_preferences.dart';

// Save data
Future<void> saveUsername(String name) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', name);
}

// Load data
Future<String> loadUsername() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('username') ?? 'Guest';
}
```

---

## What Is SharedPreferences?

SharedPreferences provides persistent **key-value storage** on the device. Think of it like `localStorage` in web development - data stays saved even after the app closes.

**Perfect for:**
- User settings and preferences
- Favorites or bookmarks
- Last-used values (recent searches, form data)
- Simple flags (hasSeenTutorial, isDarkMode)
- Cache small amounts of data locally

**NOT for:**
- Large datasets (use a database instead)
- Sensitive data like passwords (use secure storage)
- Complex objects (must serialize to String/JSON first)

---

## Setup

### Installation
```bash
flutter pub add shared_preferences
```

### Import
```dart
import 'package:shared_preferences/shared_preferences.dart';
```

**Important:** Do a **hot restart** (not just hot reload) after adding the package.

---

## Supported Data Types

SharedPreferences supports 5 data types:

| Type | Save Method | Load Method | Example |
|------|------------|-------------|---------|
| `int` | `setInt()` | `getInt()` | Counter, age, score |
| `double` | `setDouble()` | `getDouble()` | Price, rating |
| `bool` | `setBool()` | `getBool()` | isDarkMode, isLoggedIn |
| `String` | `setString()` | `getString()` | Username, theme name |
| `List<String>` | `setStringList()` | `getStringList()` | Tags, favorites (IDs) |

---

## Basic Patterns

### Saving Data

All save operations follow this pattern:
1. Get SharedPreferences instance
2. Use appropriate `set___()` method
3. Data is automatically saved to disk

```dart
Future<void> saveUserSettings({
  required String username,
  required int age,
  required bool isDarkMode,
  required double fontSize,
  required List<String> favorites,
}) async {
  final prefs = await SharedPreferences.getInstance();
  
  await prefs.setString('username', username);
  await prefs.setInt('age', age);
  await prefs.setBool('isDarkMode', isDarkMode);
  await prefs.setDouble('fontSize', fontSize);
  await prefs.setStringList('favorites', favorites);
}
```

**Critical:** Don't forget the `await` keywords! Without them, data may not save properly.

### Loading Data

All load operations follow this pattern:
1. Get SharedPreferences instance
2. Use appropriate `get___()` method
3. Always provide a default value with `??`

```dart
Future<Map<String, dynamic>> loadUserSettings() async {
  final prefs = await SharedPreferences.getInstance();
  
  return {
    'username': prefs.getString('username') ?? 'Guest',
    'age': prefs.getInt('age') ?? 0,
    'isDarkMode': prefs.getBool('isDarkMode') ?? false,
    'fontSize': prefs.getDouble('fontSize') ?? 14.0,
    'favorites': prefs.getStringList('favorites') ?? [],
  };
}
```

**Why the `??` operator?**
- If the key doesn't exist, `get___()` returns `null`
- The `??` operator provides a fallback value
- This prevents null errors in your app

### Checking if Key Exists

```dart
Future<bool> hasUsername() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.containsKey('username');
}
```

### Removing Data

```dart
// Remove a specific key
Future<void> clearUsername() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('username');
}

// Remove ALL saved data (use with caution!)
Future<void> clearAllSettings() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
```

---

## Common Use Cases

### User Preferences / Settings

```dart
class SettingsService {
  // Save theme preference
  Future<void> saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDark);
  }
  
  // Load theme preference
  Future<bool> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDarkMode') ?? false;
  }
  
  // Save font size
  Future<void> saveFontSize(double size) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', size);
  }
  
  // Load font size
  Future<double> loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('fontSize') ?? 14.0;
  }
}
```

### Favorites System

```dart
class FavoritesService {
  static const _key = 'favorites';
  
  // Add to favorites
  Future<void> addFavorite(String itemId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_key) ?? [];
    
    if (!favorites.contains(itemId)) {
      favorites.add(itemId);
      await prefs.setStringList(_key, favorites);
    }
  }
  
  // Remove from favorites
  Future<void> removeFavorite(String itemId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_key) ?? [];
    
    favorites.remove(itemId);
    await prefs.setStringList(_key, favorites);
  }
  
  // Check if favorited
  Future<bool> isFavorite(String itemId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_key) ?? [];
    return favorites.contains(itemId);
  }
  
  // Get all favorites
  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }
}
```

### Recent Searches / History

```dart
class SearchHistoryService {
  static const _key = 'searchHistory';
  static const _maxHistory = 10;  // Keep only last 10 searches
  
  Future<void> addSearch(String query) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList(_key) ?? [];
    
    // Remove if already exists (avoid duplicates)
    history.remove(query);
    
    // Add to beginning
    history.insert(0, query);
    
    // Keep only last 10
    if (history.length > _maxHistory) {
      history = history.sublist(0, _maxHistory);
    }
    
    await prefs.setStringList(_key, history);
  }
  
  Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }
  
  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
```

### First-Time User Detection

```dart
Future<bool> isFirstLaunch() async {
  final prefs = await SharedPreferences.getInstance();
  bool hasLaunched = prefs.getBool('hasLaunchedBefore') ?? false;
  
  if (!hasLaunched) {
    // Mark as launched
    await prefs.setBool('hasLaunchedBefore', true);
    return true;  // This is first launch
  }
  
  return false;  // Not first launch
}
```

---

## Advanced Patterns

### Storing Complex Objects (JSON)

Since you can only store strings, convert objects to JSON:

```dart
import 'dart:convert';

class User {
  String name;
  int age;
  String email;
  
  User({required this.name, required this.age, required this.email});
  
  // Convert to JSON
  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
    'email': email,
  };
  
  // Create from JSON
  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json['name'],
    age: json['age'],
    email: json['email'],
  );
}

// Save user object
Future<void> saveUser(User user) async {
  final prefs = await SharedPreferences.getInstance();
  String userJson = jsonEncode(user.toJson());
  await prefs.setString('user', userJson);
}

// Load user object
Future<User?> loadUser() async {
  final prefs = await SharedPreferences.getInstance();
  String? userJson = prefs.getString('user');
  
  if (userJson != null) {
    Map<String, dynamic> userMap = jsonDecode(userJson);
    return User.fromJson(userMap);
  }
  
  return null;
}
```

### Loading on App Start

Load preferences when your app starts:

```dart
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  bool isLoading = true;
  
  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }
  
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
      isLoading = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator();
    }
    
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomePage(),
    );
  }
}
```

---

## Important Rules

### ⚠️ Always Use Async/Await
```dart
// ❌ WRONG - Won't work!
void saveData() {
  final prefs = SharedPreferences.getInstance();  // Missing await!
  prefs.setString('key', 'value');
}

// ✅ CORRECT
Future<void> saveData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('key', 'value');
}
```

### ⚠️ Always Provide Default Values
```dart
// ❌ RISKY - Could be null!
String? username = prefs.getString('username');

// ✅ SAFE - Always has a value
String username = prefs.getString('username') ?? 'Guest';
```

### ⚠️ Use Consistent Keys
```dart
// ❌ BAD - Easy to make typos
prefs.setString('userNAME', 'Alice');
prefs.getString('username');  // Returns null! (typo)

// ✅ GOOD - Use constants
class PrefsKeys {
  static const username = 'username';
  static const isDarkMode = 'isDarkMode';
}

prefs.setString(PrefsKeys.username, 'Alice');
prefs.getString(PrefsKeys.username);
```

### ⚠️ Don't Store Sensitive Data
SharedPreferences is NOT encrypted. Never store:
- Passwords
- Credit card numbers
- API keys
- Social security numbers

Use `flutter_secure_storage` package for sensitive data instead.

### ⚠️ Keep It Small
SharedPreferences is for small data only. If you need to store:
- Large lists
- Many complex objects
- Relational data
- Files or images

Use a proper database (sqflite, Hive, etc.) instead.

---

## Common Issues & Solutions

| Problem | Solution |
|---------|----------|
| Data not saving | Make sure you `await` both `getInstance()` and `set___()` |
| Getting null values | Always use `??` operator with default values |
| Data lost after reinstall | SharedPreferences clears on app uninstall (expected behavior) |
| Can't save custom objects | Convert to JSON string first using `jsonEncode()` |
| Forgot to hot restart | Hot reload doesn't load new packages - do full restart |
| Keys have typos | Use string constants or enums for keys |

---

## When Covered in Course
- **[Week 9A](../../weekly/9A.md)** - SharedPreferences basics, saving/loading data
- **Lab 02 - GIF Finder** - Optional: Saving recent searches
- **Project 2** - User preferences, favorites, settings persistence

## External Resources
- [SharedPreferences Package](https://pub.dev/packages/shared_preferences)
- [Flutter Cookbook - Persist Data](https://docs.flutter.dev/cookbook/persistence/key-value)
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) - For sensitive data

---

*Last updated: Week 9A | IGME-340 Reference*
